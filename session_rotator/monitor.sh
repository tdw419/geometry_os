#!/bin/bash
# monitor.sh - Real-time session rotator monitoring

SESSION_DIR="${SESSION_DIR:-.session}"

echo "=== Session Rotator Monitor ==="
echo "Press Ctrl+C to exit"
echo

# Check if running
if [ -f "$SESSION_DIR/state.json" ]; then
    echo "Status: $(cat $SESSION_DIR/state.json | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('status','unknown').upper())")"
else
    echo "Status: NOT RUNNING"
    exit 0
fi

# Show session count
SESSION_COUNT=$(cat $SESSION_DIR/state.json 2>/dev/null | python3 -c "import sys,json; print(json.load(sys.stdin).get('session_count',0))")
echo "Sessions rotated: $SESSION_COUNT"

# Show latest log
LATEST_LOG=$(ls -t $SESSION_DIR/logs/*.log 2>/dev/null | head -1)
if [ -n "$LATEST_LOG" ]; then
    echo
    echo "=== Latest session output (last 20 lines) ==="
    tail -20 "$LATEST_LOG"
fi

# Live monitoring mode
if [ "$1" == "-f" ] || [ "$1" == "--follow" ]; then
    echo
    echo "=== Following logs (Ctrl+C to stop) ==="
    tail -f $SESSION_DIR/logs/*.log 2>/dev/null
fi
