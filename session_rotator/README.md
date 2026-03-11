# Session Rotation Orchestrator

Manages Claude Code CLI sessions with automatic rotation when context limits approach.

> **Full documentation:** See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed explanations, data flow diagrams, and usage patterns.

## Quick Start

```bash
./orchestrator.sh
```

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `MAX_SESSIONS` | 50 | Hard stop after N rotations |
| `TOKEN_LIMIT` | 150000 | Rotate when tokens exceed limit |
| `SEARCH_QUERY` | (empty) | Optional history search term |
| `HANDOFF_FILE` | .session/handoff.md | Path to handoff file |

## Files

- `orchestrator.sh` - Main control loop
- `detect_event.py` - Detect rotation triggers
- `build_prompt.py` - Build continuation prompt

## Handoff Format

Create `.session/handoff.md` with:

```markdown
# Session Handoff

## Current Task
[What you're working on]

## Progress
- [x] Done
- [ ] Remaining

## Next Action
[Specific next step]
```

## Testing

```bash
cd session_rotator
python -m pytest tests/ -v
```