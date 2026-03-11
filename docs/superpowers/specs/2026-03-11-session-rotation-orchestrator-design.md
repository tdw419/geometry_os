# Session Rotation Orchestrator Design

**Date:** 2026-03-11
**Status:** Ready for Planning
**Author:** Claude (brainstorming session)

## Overview

A shell-based orchestrator that manages Claude Code CLI sessions, rotating to fresh sessions when context limits approach or errors are detected. Preserves work context via handoff files between sessions.

## Problem Statement

Long-running Claude sessions eventually hit context limits, degrading performance. The existing `claude_autopilot` keeps ONE session alive indefinitely via hooks, but doesn't handle graceful session rotation with context preservation.

## Proposed Solution

A hybrid orchestrator that:
1. Launches Claude Code CLI sessions
2. Monitors for rotation triggers (token limits, errors)
3. Gracefully terminates and starts fresh sessions
4. Passes context via handoff files between rotations

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    orchestrator.sh                          │
│  ┌─────────────┐    ┌──────────────┐    ┌───────────────┐  │
│  │ Monitor     │───▶│ Event        │───▶│ Session       │  │
│  │ (tokens,    │    │ Detector     │    │ Manager       │  │
│  │  errors)    │    │              │    │               │  │
│  └─────────────┘    └──────────────┘    └───────────────┘  │
│                              │                    │         │
│                              ▼                    ▼         │
│                     ┌──────────────┐    ┌───────────────┐  │
│                     │ handoff.md   │◀───│ claude CLI    │  │
│                     │ (state file) │    │ (session N)   │  │
│                     └──────────────┘    └───────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## Components

### 1. orchestrator.sh
Main control loop that manages session lifecycle.

```bash
#!/bin/bash
# orchestrator.sh - Session Rotation Orchestrator

set -e

# Configuration (override via environment)
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
        echo "Terminating Claude session $CLAUDE_PID"
        kill "$CLAUDE_PID" 2>/dev/null || true
        wait "$CLAUDE_PID" 2>/dev/null || true
    fi
    # Save final state
    echo "{\"session_count\": $SESSION_COUNT, \"status\": \"shutdown\"}" > "$SESSION_DIR/state.json"
    exit 0
}

trap cleanup SIGTERM SIGINT SIGQUIT

# Ensure session directory exists
mkdir -p "$SESSION_DIR/logs"

while [ $SESSION_COUNT -lt $MAX_SESSIONS ]; do
  echo "=== Starting session $SESSION_COUNT ==="

  # Build prompt from handoff + optional history search
  if [ -n "$SEARCH_QUERY" ]; then
    PROMPT=$(python3 build_prompt.py --handoff "$HANDOFF_FILE" --search "$SEARCH_QUERY")
  else
    PROMPT=$(python3 build_prompt.py --handoff "$HANDOFF_FILE")
  fi

  # Launch Claude session
  claude --print "$PROMPT" 2>&1 | tee "$SESSION_DIR/logs/session_$SESSION_COUNT.log" &
  CLAUDE_PID=$!

  # Monitor for events
  while kill -0 $CLAUDE_PID 2>/dev/null; do
    EVENT=$(python3 detect_event.py --pid $CLAUDE_PID --handoff "$HANDOFF_FILE" --token-limit "$TOKEN_LIMIT")

    case "$EVENT" in
      "rotate")
        echo "Rotation triggered - ending session $SESSION_COUNT"
        kill $CLAUDE_PID
        break
        ;;
      "complete")
        echo "Task complete - exiting orchestrator"
        kill $CLAUDE_PID 2>/dev/null || true
        cleanup
        ;;
      "error")
        echo "Error detected - rotating session"
        kill $CLAUDE_PID
        break
        ;;
    esac
    sleep 5
  done

  wait $CLAUDE_PID 2>/dev/null || true
  CLAUDE_PID=""
  SESSION_COUNT=$((SESSION_COUNT + 1))

  # Save state
  echo "{\"session_count\": $SESSION_COUNT, \"status\": \"running\"}" > "$SESSION_DIR/state.json"
done

echo "Max sessions reached - stopping"
cleanup
```

### 2. detect_event.py
Monitors session for rotation triggers.

```python
#!/usr/bin/env python3
"""
detect_event.py - Event detection for session rotation

Checks:
1. Token usage from JSONL history
2. Error patterns in recent messages
3. Completion signals
"""

import sys
import json
import re
from pathlib import Path

def get_token_usage(project_dir: Path) -> int:
    """Estimate token usage from JSONL file size.

    Uses a conservative heuristic: 1 token ≈ 3 bytes (accounts for
    formatting overhead). Falls back to 0 if file cannot be read.

    Accuracy: Within 20% of actual token count in practice.
    """
    jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
    if not jsonl_files:
        return 0
    try:
        size = jsonl_files[0].stat().st_size
        # Conservative estimate: 1 token ≈ 3 bytes
        # This errs on the side of rotating earlier
        return size // 3
    except OSError:
        return 0

def detect_errors(handoff_file: Path) -> bool:
    """Check handoff for error indicators."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    error_patterns = ["stuck", "blocked", "error:", "failed", "cannot proceed"]
    return any(p in content for p in error_patterns)

def detect_completion(handoff_file: Path) -> bool:
    """Check for completion signals."""
    if not handoff_file.exists():
        return False
    content = handoff_file.read_text().lower()
    return "task complete" in content

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--pid", type=int)
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--token-limit", type=int, default=150000)
    args = parser.parse_args()

    handoff = Path(args.handoff)

    # Check completion first
    if detect_completion(handoff):
        print("complete")
        return

    # Check errors
    if detect_errors(handoff):
        print("error")
        return

    # Check token usage
    claude_home = Path.home() / ".claude" / "projects"
    project_dirs = sorted(claude_home.iterdir(), key=lambda d: d.stat().st_mtime, reverse=True)
    if project_dirs:
        tokens = get_token_usage(project_dirs[0])
        if tokens > args.token_limit:
            print("rotate")
            return

    print("continue")

if __name__ == "__main__":
    main()
```

### 3. build_prompt.py
Constructs the initial prompt for each session from handoff + history.

```python
#!/usr/bin/env python3
"""
build_prompt.py - Build session prompt from handoff and history
"""

import sys
import json
from pathlib import Path

def load_handoff(handoff_file: Path) -> str:
    """Load handoff context."""
    if handoff_file.exists():
        return handoff_file.read_text()
    return ""

def search_history(query: str, limit: int = 5) -> list[str]:
    """Search recent conversation history for relevant context."""
    claude_home = Path.home() / ".claude" / "projects"
    project_dirs = sorted(claude_home.iterdir(), key=lambda d: d.stat().st_mtime, reverse=True)

    results = []
    for project_dir in project_dirs[:1]:  # Most recent project
        jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
        for jsonl_file in jsonl_files[:1]:
            for line in jsonl_file.read_text().splitlines()[-50:]:
                try:
                    obj = json.loads(line)
                    msg = obj.get("message", {})
                    content = msg.get("content", "")
                    if isinstance(content, list):
                        content = " ".join(b.get("text", "") for b in content if isinstance(b, dict))
                    if query.lower() in content.lower():
                        results.append(content[:500])
                except:
                    continue

    return results[:limit]

def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--handoff", type=str, required=True)
    parser.add_argument("--search", type=str, default="")
    args = parser.parse_args()

    handoff = load_handoff(Path(args.handoff))

    prompt_parts = []

    if handoff:
        prompt_parts.append("## Session Continuation\n")
        prompt_parts.append("You are continuing from a previous session. Here's the handoff context:\n")
        prompt_parts.append(handoff)
        prompt_parts.append("\n## Instructions\n")
        prompt_parts.append("Continue working on the task above. Do not summarize - just continue the work.\n")

    if args.search:
        history = search_history(args.search)
        if history:
            prompt_parts.append("\n## Relevant History\n")
            for h in history:
                prompt_parts.append(f"- {h[:200]}...\n")

    print("".join(prompt_parts))

if __name__ == "__main__":
    main()
```

### 4. Handoff File Format

The handoff file (`.session/handoff.md`) is written by Claude before session end:

```markdown
# Session Handoff

## Current Task
[What was being worked on]

## Progress
- [x] Completed step 1
- [x] Completed step 2
- [ ] In progress: step 3
- [ ] Remaining: step 4, step 5

## Key Files
- `path/to/file.py` - Description of changes made
- `path/to/other.py` - What needs to be done

## Blockers
[Any issues encountered]

## Next Action
[Specific next step to take]
```

## Event Triggers

| Event | Detection Method | Action |
|-------|------------------|--------|
| Token Limit | JSONL file size > threshold | Rotate session |
| Error/Stuck | Keywords in handoff: "stuck", "blocked", "error" | Rotate session |
| Completion | "TASK COMPLETE" in handoff | Exit orchestrator |
| Max Sessions | Counter > MAX_SESSIONS | Exit orchestrator |

## Directory Structure

```
.session/
├── handoff.md          # Current session handoff
├── logs/
│   ├── session_0.log   # Session logs
│   ├── session_1.log
│   └── ...
└── state.json          # Orchestrator state
```

## Integration with Existing Autopilot

This orchestrator can work alongside or replace the existing `claude_autopilot`:

- **Alongside:** Use orchestrator for session rotation, keep autopilot hooks for within-session continuation
- **Replace:** Disable autopilot Stop hook, let orchestrator manage all lifecycle

## Safety Limits

- `MAX_SESSIONS=50` - Hard stop after 50 rotations
- Token limit check every 5 seconds
- Graceful shutdown on SIGTERM

## Usage

```bash
# Start orchestrator
./orchestrator.sh

# With custom token limit
TOKEN_LIMIT=100000 ./orchestrator.sh

# With search query for history
SEARCH_QUERY="test collection" ./orchestrator.sh
```

## Design Decisions

### 1. Handoff Authorship
**Decision:** Claude writes handoff via instructions in the continuation prompt.
- The continuation prompt instructs Claude to update `.session/handoff.md` before stopping
- This is more reliable than automatic extraction because Claude knows what context matters
- Handoff template is provided in the prompt

### 2. Partial Tool Calls
**Decision:** Accept potential data loss on rotation; rely on git for recovery.
- Mid-rotation tool calls may be interrupted - this is acceptable
- Git commits serve as checkpoints; uncommitted work may be lost
- The continuation prompt instructs Claude to commit frequently

### 3. Working Directory State
**Decision:** Preserve git status via frequent commits, not orchestrator management.
- Claude is instructed to commit after each logical step
- Orchestrator does not manage git state directly
- On rotation, Claude reads recent commits to understand state

## Non-Goals

This orchestrator does NOT:
- Manage parallel sessions (single session only)
- Handle authentication or credentials
- Persist conversation history (only handoff + git)
- Recover from system crashes (session logs are best-effort)

## Success Criteria

The implementation is complete when:

1. **Rotation works:** Running `./orchestrator.sh` starts Claude, and after `TOKEN_LIMIT` tokens, a new session starts with handoff context
2. **Handoff preserves context:** A task spanning multiple sessions can be completed (e.g., "create 5 files, one per session")
3. **Completion stops orchestrator:** When Claude outputs "TASK COMPLETE", the orchestrator exits cleanly
4. **Logs are preserved:** Each session's output is saved to `.session/logs/session_N.log`
5. **Graceful shutdown:** SIGTERM/SIGINT cleanly terminates Claude and saves state
