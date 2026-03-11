---
spec: directive-control-surface
phase: design
created: 2026-02-21T17:00:00Z
---

# Design: Directive Control Surface

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                     directive_ctl.sh                        │
│  (Control Script - follows evolution_ctl.sh pattern)        │
│                                                             │
│  Commands: start | stop | status | tail | process | restart │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        │ nohup python3
                        ▼
┌─────────────────────────────────────────────────────────────┐
│                   directive_agent.py                        │
│  (Modified with heartbeat + CLI)                            │
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │ CLI Parser  │→ │ Agent Loop  │→ │ Heartbeat Writer   │  │
│  │ (argparse)  │  │ (run_forever)│  │ (write_heartbeat)  │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└───────────────────────┬─────────────────────────────────────┘
                        │
                        │ writes
                        ▼
┌─────────────────────────────────────────────────────────────┐
│                    Runtime Files                            │
│                                                             │
│  directive_agent.pid  →  Process ID for tracking            │
│  directive_heartbeat.json  →  Status for monitoring         │
│  .geometry/logs/directive_agent.log  →  Log output          │
└─────────────────────────────────────────────────────────────┘
```

## Components

### 1. DirectiveAgent Modifications

**File:** `systems/intelligence/directive_agent.py`

#### 1.1 New Imports

```python
import argparse
import sys
```

#### 1.2 New __init__ Parameters

```python
def __init__(
    self,
    wp_url: Optional[str] = None,
    poll_interval: Optional[int] = None,
    substrate_map_path: Optional[str] = None,
    heartbeat_path: Optional[str] = None  # NEW
):
    # ... existing code ...

    # NEW: Heartbeat support
    self.heartbeat_path = heartbeat_path or os.environ.get("DIRECTIVE_HEARTBEAT_PATH", "")
    self._directives_processed = 0
    self._start_time = time.time()
```

#### 1.3 New Method: write_heartbeat()

```python
def write_heartbeat(self) -> None:
    """Write heartbeat file for daemon monitoring."""
    if not self.heartbeat_path:
        return

    heartbeat = {
        "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "pid": os.getpid(),
        "running": True,
        "uptime_seconds": time.time() - self._start_time,
        "directives_processed": self._directives_processed,
        "wp_url": self.wp_url,
        "poll_interval": self.poll_interval,
        "substrate_components": len(self._substrate_cache)
    }

    try:
        path = Path(self.heartbeat_path)
        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, 'w') as f:
            json.dump(heartbeat, f, indent=2)
    except (IOError, OSError) as e:
        self.logger.warning(f"Failed to write heartbeat: {e}")
```

#### 1.4 Modified process_one_cycle()

```python
def process_one_cycle(self) -> int:
    # ... existing processing logic ...

    self._directives_processed += processed
    self.write_heartbeat()  # NEW: Write heartbeat after each cycle

    self.logger.info(f"Processed {processed} directives")
    return processed
```

#### 1.5 New main() with argparse

```python
def main():
    parser = argparse.ArgumentParser(
        description="DirectiveAgent - Bidirectional Human-AI Collaboration"
    )
    parser.add_argument("--wp-url", default="http://localhost:8080")
    parser.add_argument("--poll-interval", type=int, default=30)
    parser.add_argument("--heartbeat", default="")
    parser.add_argument("--substrate-map", default=".geometry/substrate_map.json")
    parser.add_argument("--once", action="store_true")
    parser.add_argument("--version", action="version", version="DirectiveAgent 1.0.0")

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )

    agent = DirectiveAgent(
        wp_url=args.wp_url,
        poll_interval=args.poll_interval,
        substrate_map_path=args.substrate_map,
        heartbeat_path=args.heartbeat
    )

    if args.once:
        processed = agent.process_one_cycle()
        logging.info(f"Processed {processed} directives, exiting")
        sys.exit(0)
    else:
        agent.run_forever()
```

### 2. directive_ctl.sh Control Script

**File:** `systems/intelligence/directive_ctl.sh`

**Pattern:** Exact copy of `evolution_ctl.sh` with these changes:

| evolution_ctl.sh | directive_ctl.sh |
|------------------|------------------|
| DAEMON_SCRIPT=evolution_daemon.py | DAEMON_SCRIPT=directive_agent.py |
| PID_FILE=evolution_daemon.pid | PID_FILE=directive_agent.pid |
| HEARTBEAT_FILE=evolution_heartbeat.json | HEARTBEAT_FILE=directive_heartbeat.json |
| EVOLUTION_INTERVAL | DIRECTIVE_POLL_INTERVAL |
| cmd_dry_run() | (removed) |
| cmd_report() | (removed) |
| cmd_target() | (removed) |
| cmd_process() | (added) |

**Key Functions:**

```bash
cmd_start()      # nohup python3 with --heartbeat flag
cmd_stop()       # SIGTERM → SIGKILL fallback
cmd_status()     # Read heartbeat JSON, display status
cmd_tail()       # tail -f log file
cmd_process()    # Run with --once flag
cmd_restart()    # stop + sleep + start
```

### 3. Test Files

#### 3.1 Unit Tests

**File:** `tests/test_directive_agent.py`

**New Test Class:**

```python
class TestHeartbeatSupport:
    def test_write_heartbeat_creates_file(self, tmp_path):
        # ...

    def test_heartbeat_contains_required_fields(self, tmp_path):
        # ...

    def test_heartbeat_updates_on_cycle(self, tmp_path):
        # ...

class TestCLIInterface:
    def test_cli_help_shows_options(self):
        # ...

    def test_cli_version_flag(self):
        # ...
```

#### 3.2 Integration Tests

**File:** `tests/test_directive_ctl.sh`

```bash
test_help_command()       # Verify help output
test_status_when_stopped() # Verify STOPPED display
test_process_once()       # Verify --once execution
test_executable()         # Verify chmod +x
```

### 4. Documentation

**File:** `specs/command-console/README.md`

**Sections:**
- Quick Start (start/stop/status commands)
- How It Works (5-step flow)
- Scope (Phase 3 limitations)
- Configuration (environment variables)
- Files (table of paths and purposes)

## Data Flow

```
User runs: ./directive_ctl.sh start
    │
    ├── Check if already running (PID file)
    │
    ├── Create log directory
    │
    ├── nohup python3 directive_agent.py --heartbeat ... &
    │
    ├── Write PID to directive_agent.pid
    │
    └── DirectiveAgent starts polling WordPress
            │
            ├── process_one_cycle()
            │       │
            │       ├── Poll WordPress for directives
            │       │
            │       ├── Execute directives
            │       │
            │       ├── Post responses
            │       │
            │       └── Increment counter
            │
            └── write_heartbeat() → directive_heartbeat.json
                    │
                    └── Sleep poll_interval seconds
```

## File Locations

| File | Location | Purpose |
|------|----------|---------|
| directive_agent.py | systems/intelligence/ | Main agent |
| directive_ctl.sh | systems/intelligence/ | Control script |
| directive_agent.pid | systems/intelligence/ | Process tracking |
| directive_heartbeat.json | systems/intelligence/ | Runtime status |
| directive_agent.log | .geometry/logs/ | Log output |
| test_directive_agent.py | tests/ | Unit tests |
| test_directive_ctl.sh | tests/ | Integration tests |

## Error Handling

| Error | Detection | Recovery |
|-------|-----------|----------|
| WordPress down | requests.RequestException | Log error, continue polling |
| Heartbeat write fail | IOError/OSError | Log warning, continue running |
| Stale PID file | ps -p check | Remove file, proceed |
| Graceful timeout | wait_for_shutdown | SIGKILL fallback |
