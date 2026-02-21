---
name: evolution-daemon-control
description: Controls the Evolution Daemon for continuous autonomous improvement of Geometry OS. Use this skill when you need to start, stop, monitor, or troubleshoot the self-evolving system that improves code using Foveated Knowledge Gravity.
category: operations
---

# Evolution Daemon Control

This skill provides a procedural workflow for managing the Evolution Daemon, Geometry OS's autonomous self-improvement system.

## Quick Reference

| Command | Description |
|---------|-------------|
| `start` | Start daemon in background |
| `stop` | Stop daemon gracefully |
| `status` | Check daemon status and metrics |
| `tail` | Follow daemon logs in real-time |
| `report` | Generate detailed status report |
| `restart` | Restart the daemon |
| `dry-run` | Run in foreground (no changes) |

## Control Script Location

```bash
SYSTEMS/visual_shell/swarm/evolution/evolution_ctl.sh
```

## Execution Workflow

### Starting the Daemon

1. Navigate to the control script directory:
   ```bash
   cd systems/visual_shell/swarm/evolution
   ```

2. Start the daemon:
   ```bash
   ./evolution_ctl.sh start
   ```

3. Verify startup:
   ```bash
   ./evolution_ctl.sh status
   ```

### Checking Status

```bash
./evolution_ctl.sh status
```

Expected output shows:
- Status: RUNNING or STOPPED
- PID: Process ID
- Heartbeat metrics (see Key Metrics below)
- State information

### Viewing Logs

```bash
./evolution_ctl.sh tail
```

Press Ctrl+C to exit log following.

### Generating Reports

```bash
./evolution_ctl.sh report
```

This outputs a detailed JSON report with current evolution state.

### Stopping the Daemon

```bash
./evolution_ctl.sh stop
```

For graceful shutdown (30 second timeout), then force kill if needed.

## Key Metrics

| Metric | Description | Healthy Range |
|--------|-------------|---------------|
| Cycles | Total evolution cycles completed | Growing |
| Improvements | Successful improvements applied | Growing |
| Rejections | Proposals that failed validation | Low ratio to improvements |
| Uptime | Seconds since daemon start | N/A |
| Phase | Current orchestrator phase | INTROSPECT, PROPOSE, VALIDATE, CONSENSUS, APPLY |
| Rate Limit | Improvements in current hour | Below MAX_PER_HOUR |

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `EVOLUTION_INTERVAL` | 300 | Seconds between cycles |
| `EVOLUTION_MAX_PER_HOUR` | 10 | Maximum improvements per hour |
| `EVOLUTION_COOLDOWN` | 300 | Cooldown seconds between improvements |

## File Locations

| File | Path | Description |
|------|------|-------------|
| PID File | `evolution_daemon.pid` | Process ID lock |
| State File | `evolution_state.json` | Persistent state |
| Heartbeat | `evolution_heartbeat.json` | Live status |
| Logs | `logs/evolution/evolution_daemon.log` | Activity log |

## Troubleshooting

### Daemon Won't Start

1. Check for stale PID file:
   ```bash
   rm -f evolution_daemon.pid
   ```

2. Verify Python environment:
   ```bash
   python3 evolution_daemon.py --dry-run --interval 60
   ```

3. Check log directory permissions:
   ```bash
   mkdir -p logs/evolution
   ```

### High Rejection Rate

1. Check GuardianGate logs for validation failures
2. Run `./evolution_ctl.sh report` to see recent rejection reasons
3. Verify test suite is passing: `pytest tests/`

### Daemon Hangs

1. Check heartbeat file timestamp:
   ```bash
   cat evolution_heartbeat.json | python3 -c "import sys,json; print(json.load(sys.stdin).get('timestamp'))"
   ```

2. If stale, force restart:
   ```bash
   ./evolution_ctl.sh stop
   sleep 5
   ./evolution_ctl.sh start
   ```

### No Improvements Being Applied

1. Verify target directory exists:
   ```bash
   ls -la systems/visual_shell/
   ```

2. Check rate limiting in state file:
   ```bash
   cat evolution_state.json | python3 -c "import sys,json; d=json.load(sys.stdin); print(f'Recent improvements: {len(d.get(\"recent_improvements\", []))}')"
   ```

## Dry-Run Mode

For testing without making changes:

```bash
./evolution_ctl.sh dry-run
```

This runs in foreground with verbose output. Press Ctrl+C to stop.

## Targeting Specific Files

To focus evolution on a single file:

```bash
./evolution_ctl.sh target path/to/file.py
```

This stops the current daemon and restarts with the specified target.
