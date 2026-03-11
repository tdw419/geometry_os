#!/bin/bash
# orchestrator.sh - Session Rotation Orchestrator

set -e

# Configuration (override via environment)
CLI_COMMAND="${CLI_COMMAND:-claude}"
HANDOFF_FILE="${HANDOFF_FILE:-.session/handoff.md}"
MAX_SESSIONS="${MAX_SESSIONS:-50}"
TOKEN_LIMIT="${TOKEN_LIMIT:-150000}"
SEARCH_QUERY="${SEARCH_QUERY:-}"
SESSION_DIR=".session"

SESSION_COUNT=0
CLAUDE_PID=""

# Graceful shutdown handler
cleanup() {
    echo "Shutting down orchestrator..."
    if [ -n "$CLAUDE_PID" ] && kill -0 "$CLAUDE_PID" 2>/dev/null; then
        echo "Terminating session $CLAUDE_PID"
        kill "$CLAUDE_PID" 2>/dev/null || true
        wait "$CLAUDE_PID" 2>/dev/null || true
    fi
    # Save final state
    mkdir -p "$SESSION_DIR"
    echo "{\"session_count\": $SESSION_COUNT, \"status\": \"shutdown\"}" > "$SESSION_DIR/state.json"
    exit 0
}

trap cleanup SIGTERM SIGINT SIGQUIT

# Ensure session directory exists
mkdir -p "$SESSION_DIR/logs"

# Clear old logs from previous runs
rm -f "$SESSION_DIR/logs"/*.log 2>/dev/null
rm -f "$SESSION_DIR/state.json" 2>/dev/null

while [ $SESSION_COUNT -lt $MAX_SESSIONS ]; do
  echo "=== Starting session $SESSION_COUNT ==="

  # Build prompt from handoff + optional history search
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [ -n "$SEARCH_QUERY" ]; then
    PROMPT=$(python3 "$SCRIPT_DIR/build_prompt.py" --handoff "$HANDOFF_FILE" --search "$SEARCH_QUERY")
  else
    PROMPT=$(python3 "$SCRIPT_DIR/build_prompt.py" --handoff "$HANDOFF_FILE")
  fi

  # Launch session (unbuffered for real-time logging)
  stdbuf -oL -eL "$CLI_COMMAND" --dangerously-skip-permissions --print "$PROMPT" > "$SESSION_DIR/logs/session_$SESSION_COUNT.log" 2>&1 &
  CLAUDE_PID=$!

  # Monitor for events
  while kill -0 $CLAUDE_PID 2>/dev/null; do
    EVENT=$(python3 "$SCRIPT_DIR/detect_event.py" --handoff "$HANDOFF_FILE" --log "$SESSION_DIR/logs/session_$SESSION_COUNT.log" --token-limit "$TOKEN_LIMIT" --no-token-check)

    case "$EVENT" in
      "rotate")
        echo "Rotation triggered - ending session $SESSION_COUNT"
        kill $CLAUDE_PID
        break
        ;;
      "complete")
        echo "Task complete detected during session - exiting orchestrator"
        kill $CLAUDE_PID 2>/dev/null || true
        cleanup
        ;;
      "error")
        echo "Error detected during session - rotating"
        kill $CLAUDE_PID
        break
        ;;
    esac
    sleep 5
  done

  wait $CLAUDE_PID 2>/dev/null || true
  CLAUDE_PID=""

  # Post-mortem event detection
  FINAL_EVENT=$(python3 "$SCRIPT_DIR/detect_event.py" --handoff "$HANDOFF_FILE" --log "$SESSION_DIR/logs/session_$SESSION_COUNT.log" --no-token-check)
  if [ "$FINAL_EVENT" == "complete" ]; then
    echo "=== Task Complete (verified in logs) ==="
    SESSION_COUNT=$((SESSION_COUNT + 1))
    echo "{\"session_count\": $SESSION_COUNT, \"status\": \"complete\"}" > "$SESSION_DIR/state.json"
    exit 0
  fi

  SESSION_COUNT=$((SESSION_COUNT + 1))

  # Save state
  echo "{\"session_count\": $SESSION_COUNT, \"status\": \"running\"}" > "$SESSION_DIR/state.json"
done

echo "Max sessions reached - stopping"
cleanup