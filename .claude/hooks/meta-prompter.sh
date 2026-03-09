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
                ;;
            *)
                CONTEXT="The main Claude session triggered notification: $NOTIFICATION_TYPE"
                ;;
        esac
        ;;
    *)
        log "Unhandled event type: $EVENT"
        exit 0
        ;;
esac

# Use the current session's transcript if available, otherwise find most recent
if [[ -n "$TRANSCRIPT_PATH" && -f "$TRANSCRIPT_PATH" ]]; then
    HISTORY_FILE="$TRANSCRIPT_PATH"
else
    HISTORY_FILE=$(find "$HISTORY_DIR" -name "*.jsonl" -type f -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)
fi

if [[ -z "$HISTORY_FILE" || ! -f "$HISTORY_FILE" ]]; then
    log "No history files found"
    exit 0
fi

log "Using history: $HISTORY_FILE"

# Extract readable conversation from JSONL
# This handles both string content and array content formats
extract_history() {
    local file="$1"
    local lines="${2:-30}"

    tail -"$lines" "$file" 2>/dev/null | jq -r '
        select(.type == "user" or .type == "assistant") |
        if .type == "user" then
            "USER: " + (
                if (.message.content | type) == "string" then
                    .message.content[0:500]
                elif (.message.content | type) == "array" then
                    (.message.content | map(select(.type == "text") | .text)[0] // "")[0:500]
                else
                    ""
                end
            )
        else
            "ASSISTANT: " + (
                if (.message.content | type) == "string" then
                    .message.content[0:500]
                elif (.message.content | type) == "array" then
                    (.message.content | map(select(.type == "text") | .text)[0] // "")[0:500]
                else
                    ""
                end
            )
        end
    ' 2>/dev/null | grep -v "^null$" | head -20
}

RECENT_HISTORY=$(extract_history "$HISTORY_FILE" 50)

if [[ -z "$RECENT_HISTORY" ]]; then
    log "Could not extract history"
    exit 0
fi

# Build the analyzer prompt
ANALYZER_PROMPT=$(cat << 'ANALYZER_EOF'
You are a meta-cognitive assistant analyzing a Claude Code session.
Your job is to determine what the NEXT prompt should be.

CONTEXT: ANALYZER_CONTEXT_PLACEHOLDER

PROJECT: Geometry OS - an autonomous visual computing system.

RECENT CONVERSATION:
ANALYZER_HISTORY_PLACEHOLDER

YOUR TASK:
1. Analyze what just happened
2. Determine the logical next step
3. Output ONLY a single prompt (no markdown, no quotes, no explanation)

OUTPUT RULES:
- Output a prompt if there's a clear next step
- Output "WAIT" if the session should pause for human
- Output "STUCK: reason" if there's a problem

Be concise. Maximum 2 sentences for the prompt.
ANALYZER_EOF
)

# Replace placeholders
ANALYZER_PROMPT="${ANALYZER_PROMPT/ANALYZER_CONTEXT_PLACEHOLDER/$CONTEXT}"
ANALYZER_PROMPT="${ANALYZER_PROMPT/ANALYZER_HISTORY_PLACEHOLDER/$RECENT_HISTORY}"

log "Spawning secondary Claude session..."

# Use claude --print for non-interactive output
NEXT_PROMPT=$(claude --print --dangerously-skip-permissions "$ANALYZER_PROMPT" 2>/dev/null | head -c 1000 || echo "")

log "Response: $NEXT_PROMPT"

# Handle the response
case "$NEXT_PROMPT" in
    WAIT*)
        log "Secondary says: WAIT"
        exit 0
        ;;
    STUCK:*)
        REASON="${NEXT_PROMPT#STUCK: }"
        log "Secondary says: STUCK - $REASON"
        exit 0
        ;;
    "")
        log "Empty response"
        exit 0
        ;;
    *)
        log "Feeding prompt: $NEXT_PROMPT"
        echo "$NEXT_PROMPT"
        exit 0
        ;;
esac
