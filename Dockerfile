FROM kalilinux/kali-rolling

WORKDIR /root

ENV GO_VERSION=go1.19.1

RUN apt update
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
  kali-tools-top10 \
  exploitdb \
  man-db \
  inetutils-ping \
  curl \
  exploitdb \
  ftp \
  git \
  gobuster \
  vim \
  mariadb-common \
  mysql-common \
  net-tools \
  nmap \
  nmap-common \
  postgresql \
  postgresql-client-14 \
  wget

RUN wget https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz -O go.tar.gz && cd /usr/lib/ && tar -xvf /root/go.tar.gz && cd /usr/bin && ln -s /usr/lib/go/bin/* .

RUN go install github.com/ffuf/ffuf@latest
RUN git clone https://github.com/danielmiessler/SecLists
RUN echo "export PATH=/root/go/bin:\$PATH" >> /root/.bashrc
