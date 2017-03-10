#!/bin/sh
## Script to pull the latest from master upstream for a bunch of local git repos. Run in a directory above the git repo dirs
## Copyright (C) 2017 Hrishi Dixit - All Rights Reserved
## Last revised 03/09/2017
## 
## Usage: gpull.sh
##
## Options: none

RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

find * -prune -type d | while read d; do
  cd $d
  if [ -d ".git" ]; then
    echo ""
    echo "----> Pulling ${CYAN}$d${NC}"
    git checkout master
    git pull origin master
  else
    echo ""
    echo "[${RED}$d${NC} is not a github directory.. skipping]"
  fi
  cd ..
done

