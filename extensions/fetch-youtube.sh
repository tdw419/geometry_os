#!/bin/bash
# Safe Viewer - Fetch YouTube videos using yt-dlp
# Usage: ./fetch-youtube.sh CHANNEL_URL

set -e

OUTPUT_FILE="extensions/videos.json"

if [ -z "$1" ]; then
    echo "Usage: $0 <channel_url_or_video_url>"
    echo ""
    echo "Examples:"
    echo "  $0 https://www.youtube.com/@LinusTechTips"
    echo "  $0 https://www.youtube.com/watch?v=xxxxx"
    echo "  $0 UCBA6e21jHUO5R2p7-DdQJ4w"
    exit 1
fi

INPUT="$1"

# Check yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "Error: yt-dlp is not installed"
    echo "Install with: pip install yt-dlp"
    echo "Or: brew install yt-dlp"
    exit 1
fi

echo "Fetching videos from: $INPUT"

# Fetch video metadata as JSON
yt-dlp \
    --flat-playlist \
    --dump-json \
    --playlist-end 20 \
    "$INPUT" 2>/dev/null | while read -r line; do
        # Parse and output simplified format
        echo "$line" | jq -c '{
            id: .id,
            title: .title,
            url: "https://www.youtube.com/watch?v=" + .id,
            thumbnail: "https://i.ytimg.com/vi/" + .id + "/mqdefault.jpg",
            channel: .channel,
            channel_id: .channel_id,
            duration: .duration,
            view_count: .view_count
        }'
    done > "$OUTPUT_FILE"

echo ""
echo "Saved to: $OUTPUT_FILE"
echo "Videos: $(wc -l < "$OUTPUT_FILE")"
echo ""
echo "Open safe-viewer.html to view"
