#! /bin/bash

# Creates an empty markdown post file in "_posts" directory
# and adds there front-matter with current time

usage (){
    echo    "Usage: $0 [New Post Title]"
}

while getopts ":h" option; do
   case $option in
      h)
         usage
         exit;;
     \?) 
         echo "Error: Invalid option"
         usage
         exit;;
   esac
done

TITLE=$1

if [ ! "${TITLE}" ]; then
  TITLE="No Title"
fi

title="${TITLE,,}"
postfile="./_posts/$(date +%F)-${title// /-}.markdown"
postdate=$(date +"%F %H:%M:%S %z")

if [ ! -f "$postfile" ]; then
echo "---
layout: post
published: false
title:  $TITLE
date:   $postdate
categories: none
---" > $postfile
else
  echo "Post with the same title already exists, please give it other name"
fi
