#!/bin/bash
# Test the meta-prompter hook manually
# Usage: ./test-hook.sh [event_type]

cd /home/jericho/zion/projects/geometry_os/geometry_os

EVENT="${1:-Stop}"

# Simulate hook input
cat << EOF | .claude/hooks/meta-prompter.sh
{
  "hook_event_name": "$EVENT",
  "session_id": "test-session-123",
  "transcript_path": "",
  "cwd": "/home/jericho/zion/projects/geometry_os/geometry_os",
  "notification_type": ""
}
EOF

echo ""
echo "---"
echo "Check log: .claude/hooks/meta-prompter.log"
