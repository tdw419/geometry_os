# Session Rotation Orchestrator Design

**Date:** 2026-03-11
**Status:** Draft
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

HANDOFF_FILE=".session/handoff.md"
MAX_SESSIONS=50
SESSION_COUNT=0

while [ $SESSION_COUNT -lt $MAX_SESSIONS ]; do
  # Build prompt from handoff + history search
  PROMPT=$(python3 build_prompt.py --handoff "$HANDOFF_FILE")

  # Launch Claude session
  claude --print "$PROMPT" 2>&1 | tee ".session/logs/session_$SESSION_COUNT.log" &
  CLAUDE_PID=$!

  # Monitor for events
  while kill -0 $CLAUDE_PID 2>/dev/null; do
    EVENT=$(python3 detect_event.py --pid $CLAUDE_PID --handoff "$HANDOFF_FILE")

    case "$EVENT" in
      "rotate")
        echo "Rotation triggered - ending session $SESSION_COUNT"
        kill $CLAUDE_PID
        break
        ;;
      "complete")
        echo "Task complete - exiting orchestrator"
        exit 0
        ;;
      "error")
        echo "Error detected - rotating session"
        kill $CLAUDE_PID
        break
        ;;
    esac
    sleep 5
  done

  wait $CLAUDE_PID
  SESSION_COUNT=$((SESSION_COUNT + 1))
done

echo "Max sessions reached - stopping"
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
    """Estimate token usage from JSONL file size."""
    jsonl_files = sorted(project_dir.glob("*.jsonl"), key=lambda f: f.stat().st_mtime, reverse=True)
    if not jsonl_files:
        return 0
    # Rough estimate: 1 token ≈ 4 bytes
    return jsonl_files[0].stat().st_size // 4

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

## Open Questions

1. Should handoff be written by Claude (via instructions) or extracted from JSONL automatically?
2. How to handle partial tool calls mid-rotation?
3. Should we preserve working directory state (git status, uncommitted changes)?

## Success Criteria

- [ ] Sessions rotate smoothly when approaching token limits
- [ ] Context is preserved across rotations via handoff
- [ ] Orchestrator stops on task completion
- [ ] Logs are preserved for debugging
