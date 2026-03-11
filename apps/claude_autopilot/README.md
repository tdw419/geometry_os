# Geometry OS Autopilot — Claude Code Hook System

Keeps Claude Code running autonomously by intercepting every `Stop` event,
reading the conversation history from `~/.claude/projects/`, generating
a context-aware next prompt, and injecting it back — so Claude never idles.

## How It Works

```
Claude finishes a turn
        ↓
Stop hook fires (autopilot.py receives JSON on stdin)
        ↓
autopilot.py reads ~/.claude/projects/<slug>/*.jsonl
        ↓
Extracts recent turns, detects what Claude was building
        ↓
Checks for completion signals ("TASK COMPLETE" etc.)
        ↓
If complete → exit 0, let Claude stop
If not done → generate next prompt, output {"decision":"block","reason":"..."}
        ↓
Claude receives the prompt and keeps working
        ↓
Loop counter increments (hard stop at MAX_LOOPS)
```

## Install

```bash
cd geo-autopilot
chmod +x install.sh
./install.sh
```

Then fill in `CLAUDE.md` with your project goal.

## Files

```
geo-autopilot/
├── install.sh                   # One-shot installer
├── settings.json                # Hook config (merged into ~/.claude/settings.json)
├── scripts/
│   ├── autopilot.py             # Main Stop hook — brain of the system
│   ├── subagent_autopilot.py    # SubagentStop hook — keeps subagents alive
│   └── session_init.py          # SessionStart hook — injects goal, resets counter
```

After install, scripts live at `~/.claude/hooks/`.

## Configuration

All config via environment variables:

| Variable              | Default                    | Purpose                            |
|-----------------------|----------------------------|------------------------------------|
| `AUTOPILOT_MAX_LOOPS` | `50`                       | Hard stop after N loops            |
| `AUTOPILOT_LOOP_FILE` | `/tmp/autopilot_loop_count`| Where loop counter is stored       |
| `AUTOPILOT_GOAL`      | *(empty)*                  | Path to goal file (falls back to CLAUDE.md) |
| `AUTOPILOT_LOG`       | `/tmp/autopilot.log`       | Log file                           |
| `AUTOPILOT_PROJECT`   | `$PWD`                     | Project root override              |

## Stopping Claude

Claude will stop itself when:
1. Its response contains a completion signal (`TASK COMPLETE`, `goal achieved`, etc.)
2. The loop counter hits `MAX_LOOPS`
3. You Ctrl-C the session

## Monitoring

```bash
tail -f /tmp/autopilot.log
```

## Project Slug Resolution

Claude Code stores conversation history at:
```
~/.claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os/
```

The slug is your absolute path with `/` replaced by `-`.
`autopilot.py` auto-detects this by slugifying `$PWD` or the git root.

## Completion Signals

Add these to `COMPLETION_SIGNALS` in `autopilot.py` to match your project:
```python
COMPLETION_SIGNALS = [
    "task complete",
    "draw_pixel works",
    "triangle closed",
    "end-to-end loop complete",
    ...
]
```
