# Command Console - Directive Agent

Bidirectional human-AI collaboration via WordPress Directives.

## Quick Start

### Start the Daemon
./systems/intelligence/directive_ctl.sh start

### Check Status
./systems/intelligence/directive_ctl.sh status

### Process One Cycle
./systems/intelligence/directive_ctl.sh process

### Follow Logs
./systems/intelligence/directive_ctl.sh tail

### Stop the Daemon
./systems/intelligence/directive_ctl.sh stop

## How It Works

1. **Write a Directive**: Create a WordPress post in the "Directives" category
2. **Agent Polls**: DirectiveAgent polls WordPress every 30 seconds
3. **Scope Detection**: Agent classifies directive as INFORMATIONAL or RESEARCH
4. **Execute**: Agent looks up component in substrate map and generates response
5. **Post Response**: Agent posts HTML response as a WordPress comment

## Scope (Phase 3)

- ✅ INFORMATIONAL: Explain, describe, what is, how does
- ✅ RESEARCH: Investigate, analyze, explore
- 🚫 OUT OF SCOPE: Code modification, file changes, system operations

## Configuration

Environment variables:
- `DIRECTIVE_WP_URL`: WordPress URL (default: http://localhost:8080)
- `DIRECTIVE_POLL_INTERVAL`: Polling interval in seconds (default: 30)

## Files

| File | Purpose |
|------|---------|
| `directive_agent.py` | Main agent implementation |
| `directive_ctl.sh` | Control script |
| `directive_heartbeat.json` | Runtime status |
| `.geometry/logs/directive_agent.log` | Log file |
