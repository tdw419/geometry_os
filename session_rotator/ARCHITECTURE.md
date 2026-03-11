# Session Rotation Architecture

## Overview

The Session Rotator is a system for automatically rotating Claude CLI sessions when they approach context limits or encounter errors. It enables long-running autonomous work by continuously launching fresh sessions with context from previous ones.

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│                     ORCHESTRATOR LOOP                           │
│                                                                 │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐  │
│  │  Build   │───▶│  Launch  │───▶│ Monitor  │───▶│  Rotate  │  │
│  │  Prompt  │    │  Claude  │    │  Events  │    │  Session │  │
│  └──────────┘    └──────────┘    └──────────┘    └──────────┘  │
│       ▲                                                │        │
│       └────────────────────────────────────────────────┘        │
└─────────────────────────────────────────────────────────────────┘
```

## Components

### 1. orchestrator.sh

The main control loop that manages session lifecycle.

**Responsibilities:**
- Build prompts from handoff files
- Launch Claude CLI sessions
- Monitor for rotation events
- Handle graceful shutdown
- Track session count and state

**Configuration (environment variables):**
| Variable | Default | Description |
|----------|---------|-------------|
| `HANDOFF_FILE` | `.session/handoff.md` | Path to handoff context file |
| `MAX_SESSIONS` | `50` | Maximum rotations before stopping |
| `TOKEN_LIMIT` | `150000` | Token threshold for rotation |
| `SEARCH_QUERY` | (empty) | Optional history search query |

### 2. detect_event.py

Monitors session state and determines when to rotate.

**Event Types:**
| Event | Trigger | Action |
|-------|---------|--------|
| `continue` | Normal operation | Keep monitoring |
| `rotate` | Token limit exceeded | Kill session, start new |
| `error` | Error patterns detected | Rotate for recovery |
| `complete` | "TASK COMPLETE" in handoff | Exit orchestrator |

**Error Detection Patterns:**
- `stuck`
- `blocked`
- `error:`
- `failed`
- `cannot proceed`

**Token Estimation:**
```python
# Conservative estimate: 1 token ≈ 3 bytes
token_count = jsonl_file_size // 3
```

### 3. build_prompt.py

Constructs continuation prompts for new sessions.

**Prompt Structure:**
```
## Session Continuation
You are continuing from a previous session. Here's the handoff context:
[handoff file contents]

## Relevant History (optional)
[matching history excerpts]

## Instructions
Continue working on the task above. Do not summarize - just continue the work.
```

**History Search:**
- Searches `~/.claude/projects/*/` for JSONL files
- Matches query against message content
- Returns top 5 matches (truncated to 200 chars)

## Data Flow

```
                    ┌─────────────────┐
                    │  HANDOFF FILE   │
                    │ (.session/      │
                    │  handoff.md)    │
                    └────────┬────────┘
                             │
                             ▼
┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│   HISTORY    │─────▶│ BUILD_PROMPT │─────▶│   PROMPT     │
│   SEARCH     │      │              │      │   OUTPUT     │
└──────────────┘      └──────────────┘      └──────┬───────┘
                                                    │
                                                    ▼
┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│  MONITOR     │◀─────│   CLAUDE     │◀─────│  LAUNCH      │
│  (detect)    │      │   SESSION    │      │  SESSION     │
└──────┬───────┘      └──────────────┘      └──────────────┘
       │
       │ event?
       ▼
┌──────────────┐      ┌──────────────┐
│   ROTATE?    │─────▶│   UPDATE     │
│              │ yes  │  HANDOFF     │
└──────────────┘      └──────────────┘
```

## Usage

### Basic Usage

```bash
# Create handoff file
mkdir -p .session
cat > .session/handoff.md << 'EOF'
## Task
Continue implementing the visual shell integration.

## Progress
- Completed: WGPU renderer setup
- Current: WebSocket streaming
- Next: Connect to PixiJS

## Context
The infinite_map_rs module needs to stream frames to port 3002.
EOF

# Run orchestrator
./session_rotator/orchestrator.sh
```

### With History Search

```bash
# Search for relevant context in conversation history
SEARCH_QUERY="websocket" ./session_rotator/orchestrator.sh
```

### Custom Configuration

```bash
# Limit to 10 sessions with 100k token threshold
MAX_SESSIONS=10 TOKEN_LIMIT=100000 ./session_rotator/orchestrator.sh
```

## Handoff File Format

The handoff file is the communication channel between sessions:

```markdown
## Task
[What needs to be done]

## Progress
[What was accomplished]

## Current Work
[What's being worked on now]

## Blockers
[Any issues encountered]

## Next Steps
[What to do next]
```

### Signaling Completion

To end the orchestrator loop, write to the handoff file:

```markdown
## Status
TASK COMPLETE

## Summary
[Final results]
```

## Session State

The orchestrator maintains state in `.session/state.json`:

```json
{
  "session_count": 5,
  "status": "running"
}
```

Session logs are saved to `.session/logs/session_N.log`.

## Graceful Shutdown

The orchestrator handles signals properly:

```bash
# Send SIGTERM to gracefully stop
kill -TERM $orchestrator_pid

# Or use Ctrl+C (SIGINT)
```

On shutdown:
1. Terminates current Claude session
2. Saves final state to `state.json`
3. Exits cleanly

## Limitations

1. **Token estimation is approximate** - Uses file size / 3, not actual token count
2. **History search is basic** - Simple substring matching, no semantic search
3. **Single handoff file** - One task at a time
4. **No persistence** - State lost on system reboot

## Future Improvements

- [ ] Semantic history search using embeddings
- [ ] Multiple concurrent tasks with priority queues
- [ ] Persistent state with SQLite
- [ ] Web dashboard for monitoring
- [ ] Slack/Discord notifications on rotation

## Testing

```bash
# Run integration tests
python3 -m pytest session_rotator/tests/ -v
```

## Files

```
session_rotator/
├── orchestrator.sh      # Main control loop
├── detect_event.py      # Event detection
├── build_prompt.py      # Prompt construction
├── __init__.py          # Package init
├── README.md            # Quick start
├── ARCHITECTURE.md      # This document
└── tests/
    └── test_integration.py
```
