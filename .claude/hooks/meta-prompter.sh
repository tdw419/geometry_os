#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Meta-Prompter Hook: Uses secondary Claude session to analyze history
# and generate the next prompt for the main session.
#
# Events: Stop, Notification
# Exit 0 + stdout = feed prompt to main session
# Exit 0 + empty = do nothing
# Exit 2 = block with feedback
# -----------------------------------------------------------------------------

set -euo pipefail

PROJECT_DIR="/home/jericho/zion/projects/geometry_os/geometry_os"
HISTORY_DIR="$HOME/.claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os"
HOOK_SCRIPT="$PROJECT_DIR/.claude/hooks/meta-analyzer-prompt.txt"

# Parse hook input
INPUT=$(cat)
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
TRANSCRIPT_PATH=$(echo "$INPUT" | jq -r '.transcript_path // ""')
NOTIFICATION_TYPE=$(echo "$INPUT" | jq -r '.notification_type // ""')

# Log for debugging
LOG_FILE="$PROJECT_DIR/.claude/hooks/meta-prompter.log"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    echo "[$(date -Iseconds)] [$EVENT] $*" >> "$LOG_FILE"
}

log "Hook fired. Session: $SESSION_ID, Notification: $NOTIFICATION_TYPE"

# Determine context based on event
case "$EVENT" in
    Stop)
        CONTEXT="The main Claude session just completed a turn."
        ;;
    Notification)
        case "$NOTIFICATION_TYPE" in
            idle_prompt)
                CONTEXT="The main Claude session is idle and waiting for input."
                ;;
            permission_prompt)
                CONTEXT="The main Claude session is waiting for permission approval."
                # Could auto-approve here if desired
                ;;
            *)
                CONTEXT="The main Claude session triggered a notification: $NOTIFICATION_TYPE"
                ;;
        esac
        ;;
    *)
        log "Unhandled event type: $EVENT"
        exit 0
        ;;
esac

# Find the most recent conversation history file
LATEST_HISTORY=$(find "$HISTORY_DIR" -name "*.jsonl" -type f -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)

if [[ -z "$LATEST_HISTORY" ]]; then
    log "No history files found in $HISTORY_DIR"
    exit 0
fi

log "Using history: $LATEST_HISTORY"

# Read the last N turns from history (simplified - just get last 50 lines)
# In production, you'd parse the JSONL properly
RECENT_HISTORY=$(tail -50 "$LATEST_HISTORY" 2>/dev/null | jq -s '.' 2>/dev/null || echo "[]")

# Build the analyzer prompt
ANALYZER_PROMPT=$(cat << ANALYZER_EOF
You are a meta-cognitive assistant analyzing a Claude Code session.

CONTEXT: $CONTEXT

PROJECT: Geometry OS - an autonomous visual computing system with neural event buses, swarm guilds, evolution daemon, and visual shell.

RECENT CONVERSATION HISTORY (last turns from $LATEST_HISTORY):
$(tail -20 "$LATEST_HISTORY" 2>/dev/null | while read -r line; do
    echo "$line" | jq -r '.message.content // .message.text // empty' 2>/dev/null | head -c 500
    echo ""
done)

CURRENT WORKING DIRECTORY: $PROJECT_DIR

YOUR TASK:
1. Analyze what just happened in the session
2. Determine what the logical next step should be
3. Output a SINGLE prompt that should be fed to the main session

OUTPUT FORMAT:
- If you have a next prompt, output ONLY the prompt text (no markdown, no explanation)
- If the session should wait for human input, output: WAIT
- If the session seems stuck and needs human intervention, output: STUCK: [reason]

GUIDELINES:
- Prompts should be specific and actionable
- Consider the project's active systems (NEB, Swarm, Evolution Daemon, Visual Shell)
- Check for failing tests, incomplete features, or obvious next steps
- Don't repeat what was just done
- Be helpful but not verbose
ANALYZER_EOF
)

# Spawn secondary Claude session to analyze
log "Spawning secondary Claude session for analysis..."

# Use claude --print for non-interactive output
# The --dangerously-skip-permissions allows it to run without blocking
NEXT_PROMPT=$(claude --print --dangerously-skip-permissions "$ANALYZER_PROMPT" 2>/dev/null | head -c 2000)

log "Secondary session response: $NEXT_PROMPT"

# Handle the response
case "$NEXT_PROMPT" in
    WAIT*)
        log "Secondary session says: WAIT"
        exit 0  # No prompt, let session idle
        ;;
    STUCK:*)
        REASON="${NEXT_PROMPT#STUCK: }"
        log "Secondary session says: STUCK - $REASON"
        # Could send notification here
        echo "Meta-analyzer detected issue: $REASON" >&2
        exit 0
        ;;
    "")
        log "Secondary session returned empty response"
        exit 0
        ;;
    *)
        # We have a prompt! Feed it to the main session via stdout
        log "Feeding prompt to main session: $NEXT_PROMPT"
        echo "$NEXT_PROMPT"
        exit 0
        ;;
esac
