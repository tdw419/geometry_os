#!/bin/bash
# pi_orchestrator.sh - Recursive Orchestration of the Claude Code Agentic CLI

set -e

# CONFIGURATION
HANDOFF="pi_agent_swarm/handoff.md"
LOGS="pi_agent_swarm/logs"
STATE=".session/state.json"
CLAUDE_PATH="/home/jericho/.nvm/versions/node/v20.19.5/bin/claude"
MAX_SESSIONS=10

mkdir -p "$LOGS" ".session"

cleanup() {
    echo "Stopping Pi swarm..."
    if [ -n "$PI_PID" ]; then
        kill "$PI_PID" 2>/dev/null || true
    fi
    exit 0
}

trap cleanup SIGINT SIGTERM

echo "Initializing Pi Agent Swarm with Deterministic History Injection..."

SESSION_COUNT=0
while [ $SESSION_COUNT -lt $MAX_SESSIONS ]; do
    echo "--- LAUNCHING SESSION $SESSION_COUNT ---"
    
    # 1. Cleanup stale locks
    LOCK_DIR="$HOME/.local/state/claude/locks"
    if [ -d "$LOCK_DIR" ]; then
        find "$LOCK_DIR" -type f -name "*.lock" -mmin +5 -delete 2>/dev/null
    fi

    # 2. Build prompt
    PROMPT=$(python3 pi_agent_swarm/pi_prompt_builder.py)
    
    # 3. Headless Invocation
    $CLAUDE_PATH --print "$PROMPT" --dangerously-skip-permissions 2>&1 | tee "$LOGS/session_$SESSION_COUNT.log" &
    PI_PID=$!
    
    # 4. Monitoring
    while kill -0 $PI_PID 2>/dev/null; do
        EVENT=$(python3 pi_agent_swarm/pi_event_detector.py)
        
        case "$EVENT" in
            "complete")
                echo "TASK COMPLETE."
                kill $PI_PID 2>/dev/null || true
                exit 0
                ;;
            "rotate")
                echo "SESSION ROTATION TRIGGERED."
                kill $PI_PID 2>/dev/null || true
                break
                ;;
            "error")
                echo "ERROR DETECTED."
                kill $PI_PID 2>/dev/null || true
                break
                ;;
        esac
        sleep 5
    done
    
    wait $PI_PID 2>/dev/null || true
    SESSION_COUNT=$((SESSION_COUNT + 1))
    echo "{\"session_count\": $SESSION_COUNT, \"last_rotation\": \"$(date)\"}" > "$STATE"
done

echo "MAX SESSIONS REACHED."
