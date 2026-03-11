---
name: directive-agent-control
description: Control the Directive Agent that processes WordPress substrate map directives for Geometry OS
category: coordination
---

# Directive Agent Control

Manage the Directive Agent that processes directives from the WordPress substrate map.

## When to Use

- Starting/stopping the directive processing daemon
- Checking directive processing status
- Processing directives manually
- Debugging WordPress integration issues

## Procedure

### Step 1: Start the Daemon

```bash
cd systems/intelligence
./directive_ctl.sh start
```

Expected output:
```
[INFO] Starting Directive Agent...
[INFO] Directive Agent started (PID: 12345)
[INFO] Heartbeat: systems/intelligence/directive_heartbeat.json
[INFO] Logs: systems/intelligence/logs/directive/directive_agent.log
```

### Step 2: Check Status

```bash
./directive_ctl.sh status
```

Output:
```
Directive Agent Status

Status:    RUNNING
PID:       12345

Heartbeat:
  Timestamp: 2026-02-21T15:30:00
  Running: True
  PID: 12345
  Uptime: 3600s
  Directives Processed: 42
```

### Step 3: Follow Logs

```bash
./directive_ctl.sh tail
```

### Step 4: Process One Cycle

```bash
./directive_ctl.sh process
```

### Step 5: Stop the Daemon

```bash
./directive_ctl.sh stop
```

## CLI Reference

### directive_ctl.sh

```
Usage: ./directive_ctl.sh <command>

Commands:
  start       Start the daemon in background
  stop        Stop the daemon gracefully
  status      Check daemon status
  tail        Follow daemon logs
  restart     Restart the daemon
  process     Process one cycle and exit
  help        Show this help message
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DIRECTIVE_POLL_INTERVAL` | 300 | Seconds between polls |
| `WP_URL` | http://localhost:8080 | WordPress URL |

## Configuration Files

| File | Purpose |
|------|---------|
| `directive_agent.pid` | PID file for daemon |
| `directive_heartbeat.json` | Status and metrics |
| `logs/directive/directive_agent.log` | Activity log |
| `substrate_map.json` | WordPress directive source |

## Troubleshooting

### "Daemon is already running"

**Cause**: Previous instance still active.
**Fix**: Stop and restart.

```bash
./directive_ctl.sh stop
sleep 2
./directive_ctl.sh start
```

### "WordPress connection failed"

**Cause**: WordPress not running or wrong URL.
**Fix**: Start WordPress or check URL.

```bash
# Check WordPress
curl http://localhost:8080/wp-admin/

# Set custom URL
WP_URL=http://custom:8080 ./directive_ctl.sh start
```

### "Substrate map not found"

**Cause**: substrate_map.json missing.
**Fix**: Generate from WordPress or create manually.

```bash
# Check file exists
ls -la wordpress_zone/substrate_map.json

# Generate from WordPress
cd wordpress_zone
./manage_wp.sh sync-substrate
```

### "Daemon stopped unexpectedly"

**Cause**: Error in processing or configuration.
**Fix**: Check logs for details.

```bash
# View recent logs
tail -50 systems/intelligence/logs/directive/directive_agent.log

# Run single cycle to debug
./directive_ctl.sh process
```

### "Heartbeat file outdated"

**Cause**: Daemon hung or crashed.
**Fix**: Restart daemon.

```bash
./directive_ctl.sh restart

# Verify fresh heartbeat
cat directive_heartbeat.json | jq '.timestamp'
```

## Examples

### Start with Custom Settings

```bash
# Poll every 60 seconds
DIRECTIVE_POLL_INTERVAL=60 ./directive_ctl.sh start

# Custom WordPress URL
WP_URL=http://production:8080 ./directive_ctl.sh start
```

### Monitor Processing

```bash
# Terminal 1: Start daemon
./directive_ctl.sh start

# Terminal 2: Watch logs
./directive_ctl.sh tail

# Terminal 3: Check status periodically
watch -n 5 './directive_ctl.sh status'
```

### Debug Directive Processing

```bash
# Stop daemon
./directive_ctl.sh stop

# Run single cycle with verbose output
python3 directive_agent.py \
    --wp-url http://localhost:8080 \
    --substrate-map ../../wordpress_zone/substrate_map.json \
    --once \
    --verbose

# Check results, then restart
./directive_ctl.sh start
```

## Heartbeat Format

```json
{
  "timestamp": "2026-02-21T15:30:00",
  "running": true,
  "pid": 12345,
  "uptime_seconds": 3600,
  "directives_processed": 42,
  "last_error": null,
  "last_directive": {
    "id": "directive-123",
    "type": "spawn_agent",
    "status": "completed"
  }
}
```

## Directive Types

| Type | Description |
|------|-------------|
| `spawn_agent` | Create a new agent on the map |
| `update_tile` | Modify a tile's content |
| `run_evolution` | Trigger evolution cycle |
| `sync_memory` | Sync with vector memory |

## Related Skills

- `evolution-daemon-control` - Evolution system control
- `visual-shell-debug` - Debug visual issues
- `wordpress-zone-control` - WordPress management
