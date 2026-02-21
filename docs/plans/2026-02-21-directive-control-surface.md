# Directive Control Surface Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a production-ready control surface for the DirectiveAgent daemon with start/stop/status/tail commands following the existing evolution_ctl.sh pattern.

**Architecture:** A bash control script (`directive_ctl.sh`) manages the DirectiveAgent Python daemon process, using PID files for tracking, heartbeat files for status, and log files for observability. The DirectiveAgent is extended to support heartbeat writing and configurable logging.

**Tech Stack:** Bash, Python 3.12, JSON for state/heartbeat files

---

## Task 1: Add Heartbeat and State Support to DirectiveAgent

**Files:**
- Modify: `systems/intelligence/directive_agent.py`
- Test: `tests/test_directive_agent.py`

**Step 1: Write the failing test for heartbeat**

```python
# In tests/test_directive_agent.py, add:

import json
import tempfile
import os

class TestHeartbeatSupport:
    """Test heartbeat file writing for daemon monitoring."""

    def test_write_heartbeat_creates_file(self, tmp_path):
        """Heartbeat file should be created with expected structure."""
        from systems.intelligence.directive_agent import DirectiveAgent

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(heartbeat_path=str(heartbeat_file))

        agent.write_heartbeat()

        assert heartbeat_file.exists()

    def test_heartbeat_contains_required_fields(self, tmp_path):
        """Heartbeat should contain timestamp, pid, status."""
        from systems.intelligence.directive_agent import DirectiveAgent

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(heartbeat_path=str(heartbeat_file))

        agent.write_heartbeat()

        with open(heartbeat_file) as f:
            data = json.load(f)

        assert "timestamp" in data
        assert "pid" in data
        assert "running" in data
        assert "directives_processed" in data

    def test_heartbeat_updates_on_cycle(self, tmp_path):
        """Heartbeat should update after processing cycle."""
        from systems.intelligence.directive_agent import DirectiveAgent

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(heartbeat_path=str(heartbeat_file))

        agent.write_heartbeat()
        with open(heartbeat_file) as f:
            first = json.load(f)

        agent._directives_processed = 5
        agent.write_heartbeat()
        with open(heartbeat_file) as f:
            second = json.load(f)

        assert second["directives_processed"] == 5
        assert second["timestamp"] != first["timestamp"]
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py::TestHeartbeatSupport -v`
Expected: FAIL with "DirectiveAgent.__init__() got an unexpected keyword argument 'heartbeat_path'" or similar

**Step 3: Write minimal implementation**

Add to `systems/intelligence/directive_agent.py`:

```python
# Add imports at top (after existing imports)
import os

# Add to DirectiveAgent.__init__ method (after self._load_substrate_map()):
    # Heartbeat support
    self.heartbeat_path = heartbeat_path or os.environ.get("DIRECTIVE_HEARTBEAT_PATH", "")
    self._directives_processed = 0
    self._start_time = time.time()

# Add new methods to DirectiveAgent class (after process_one_cycle):
    def write_heartbeat(self) -> None:
        """
        Write heartbeat file for daemon monitoring.

        Creates a JSON file with current status that can be read
        by control scripts and monitoring tools.
        """
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

Update the `__init__` signature:

```python
def __init__(
    self,
    wp_url: Optional[str] = None,
    poll_interval: Optional[int] = None,
    substrate_map_path: Optional[str] = None,
    heartbeat_path: Optional[str] = None  # Add this parameter
):
```

Update `process_one_cycle` to increment counter and write heartbeat:

```python
def process_one_cycle(self) -> int:
    # ... existing code ...
    processed = 0

    for directive in directives:
        # ... existing code ...
        processed += 1

    self._directives_processed += processed
    self.write_heartbeat()  # Add this line after the loop

    self.logger.info(f"Processed {processed} directives")
    return processed
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py::TestHeartbeatSupport -v`
Expected: PASS (3 tests)

**Step 5: Commit**

```bash
git add systems/intelligence/directive_agent.py tests/test_directive_agent.py
git commit -m "feat(directive): add heartbeat support for daemon monitoring"
```

---

## Task 2: Add CLI Arguments for Daemon Mode

**Files:**
- Modify: `systems/intelligence/directive_agent.py`

**Step 1: Write the failing test for CLI**

```python
# In tests/test_directive_agent.py, add:

import subprocess
import sys

class TestCLIInterface:
    """Test command-line interface for daemon operation."""

    def test_cli_help_shows_options(self):
        """--help should show daemon options."""
        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.directive_agent", "--help"],
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "--heartbeat" in result.stdout or "heartbeat" in result.stdout.lower()

    def test_cli_version_flag(self):
        """--version should show version info."""
        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.directive_agent", "--version"],
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
```

**Step 2: Run test to verify it fails**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py::TestCLIInterface -v`
Expected: FAIL

**Step 3: Write minimal implementation**

Replace the `main()` function in `systems/intelligence/directive_agent.py`:

```python
import argparse

# ... existing code ...

def main():
    """Entry point for running DirectiveAgent."""
    parser = argparse.ArgumentParser(
        description="DirectiveAgent - Bidirectional Human-AI Collaboration"
    )
    parser.add_argument(
        "--wp-url",
        default="http://localhost:8080",
        help="WordPress URL (default: http://localhost:8080)"
    )
    parser.add_argument(
        "--poll-interval",
        type=int,
        default=30,
        help="Polling interval in seconds (default: 30)"
    )
    parser.add_argument(
        "--heartbeat",
        default="",
        help="Path to heartbeat file for daemon monitoring"
    )
    parser.add_argument(
        "--substrate-map",
        default=".geometry/substrate_map.json",
        help="Path to substrate map cache"
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Process one cycle and exit (no daemon mode)"
    )
    parser.add_argument(
        "--version",
        action="version",
        version="DirectiveAgent 1.0.0"
    )

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


if __name__ == "__main__":
    main()
```

**Step 4: Run test to verify it passes**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py::TestCLIInterface -v`
Expected: PASS (2 tests)

**Step 5: Commit**

```bash
git add systems/intelligence/directive_agent.py tests/test_directive_agent.py
git commit -m "feat(directive): add CLI arguments for daemon control"
```

---

## Task 3: Create directive_ctl.sh Control Script

**Files:**
- Create: `systems/intelligence/directive_ctl.sh`

**Step 1: Write the control script**

```bash
#!/bin/bash
#
# directive_ctl.sh - Control script for the Directive Agent Daemon
#
# Usage:
#   ./directive_ctl.sh start     - Start the daemon
#   ./directive_ctl.sh stop      - Stop the daemon
#   ./directive_ctl.sh status    - Check daemon status
#   ./directive_ctl.sh tail      - Follow daemon logs
#   ./directive_ctl.sh process   - Process one cycle and exit
#   ./directive_ctl.sh restart   - Restart the daemon
#

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
export PYTHONPATH="${PROJECT_ROOT}:${PYTHONPATH}"
DAEMON_SCRIPT="${SCRIPT_DIR}/directive_agent.py"
PID_FILE="${SCRIPT_DIR}/directive_agent.pid"
HEARTBEAT_FILE="${SCRIPT_DIR}/directive_heartbeat.json"
LOG_DIR="${PROJECT_ROOT}/.geometry/logs"
LOG_FILE="${LOG_DIR}/directive_agent.log"

# Default options
WP_URL=${DIRECTIVE_WP_URL:-"http://localhost:8080"}
POLL_INTERVAL=${DIRECTIVE_POLL_INTERVAL:-30}
SUBSTRATE_MAP="${PROJECT_ROOT}/.geometry/substrate_map.json"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_info_blue() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

check_daemon_running() {
    if [ -f "$PID_FILE" ]; then
        local pid=$(cat "$PID_FILE")
        if ps -p "$pid" > /dev/null 2>&1; then
            return 0
        else
            # Stale PID file
            rm -f "$PID_FILE"
            return 1
        fi
    fi
    return 1
}

get_pid() {
    if [ -f "$PID_FILE" ]; then
        cat "$PID_FILE"
    else
        echo ""
    fi
}

wait_for_shutdown() {
    local max_wait=${1:-30}
    local waited=0
    while [ $waited -lt $max_wait ]; do
        if ! check_daemon_running; then
            return 0
        fi
        sleep 1
        waited=$((waited + 1))
    done
    return 1
}

# Commands
cmd_start() {
    log_info "Starting Directive Agent Daemon..."

    if check_daemon_running; then
        log_warn "Daemon is already running (PID: $(get_pid))"
        return 0
    fi

    # Ensure log directory exists
    mkdir -p "$LOG_DIR"

    # Start daemon in background
    nohup python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --poll-interval "$POLL_INTERVAL" \
        --substrate-map "$SUBSTRATE_MAP" \
        --heartbeat "$HEARTBEAT_FILE" \
        > "$LOG_FILE" 2>&1 &

    local pid=$!
    echo $pid > "$PID_FILE"

    # Wait for daemon to start
    sleep 2

    if check_daemon_running; then
        log_info "Directive Agent Daemon started (PID: $pid)"
        log_info "Heartbeat: $HEARTBEAT_FILE"
        log_info "Logs: $LOG_FILE"
    else
        log_error "Failed to start Directive Agent Daemon"
        cat "$LOG_FILE" 2>/dev/null || true
        rm -f "$PID_FILE"
        exit 1
    fi
}

cmd_stop() {
    log_info "Stopping Directive Agent Daemon..."

    if ! check_daemon_running; then
        log_warn "Daemon is not running"
        rm -f "$PID_FILE"
        return 0
    fi

    local pid=$(get_pid)

    # Send SIGTERM for graceful shutdown
    kill -TERM "$pid" 2>/dev/null

    # Wait for graceful shutdown
    if wait_for_shutdown 30; then
        log_info "Directive Agent Daemon stopped gracefully"
        rm -f "$PID_FILE"
    else
        log_warn "Daemon did not stop gracefully, sending SIGKILL..."
        kill -KILL "$pid" 2>/dev/null
        sleep 1
        rm -f "$PID_FILE"
        log_info "Directive Agent Daemon stopped (forced)"
    fi
}

cmd_status() {
    log_info_blue "Directive Agent Daemon Status"
    echo ""

    if check_daemon_running; then
        local pid=$(get_pid)
        echo -e "Status:    ${GREEN}RUNNING${NC}"
        echo "PID:       $pid"
    else
        echo -e "Status:    ${RED}STOPPED${NC}"
    fi

    echo ""

    # Show heartbeat info if available
    if [ -f "$HEARTBEAT_FILE" ]; then
        echo "Heartbeat:"
        python3 -c "
import json
import sys

try:
    with open('$HEARTBEAT_FILE', 'r') as f:
        data = json.load(f)

    print(f\"  Timestamp: {data.get('timestamp', 'N/A')}\")
    print(f\"  Running: {data.get('running', False)}\")
    print(f\"  PID: {data.get('pid', 'N/A')}\")
    print(f\"  Uptime: {data.get('uptime_seconds', 0):.0f}s\")
    print(f\"  Directives Processed: {data.get('directives_processed', 0)}\")
    print(f\"  WordPress URL: {data.get('wp_url', 'N/A')}\")
    print(f\"  Substrate Components: {data.get('substrate_components', 0)}\")

except Exception as e:
    print(f'  Error reading heartbeat: {e}')
" 2>/dev/null || echo "  (Could not parse heartbeat file)"
    else
        echo "Heartbeat: (not available)"
    fi
}

cmd_tail() {
    if [ ! -f "$LOG_FILE" ]; then
        log_warn "Log file not found: $LOG_FILE"
        log_info "Daemon may not have started yet"
        exit 1
    fi

    log_info "Following logs (Ctrl+C to exit)..."
    echo ""
    tail -f "$LOG_FILE"
}

cmd_process() {
    log_info "Processing one directive cycle..."

    python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --substrate-map "$SUBSTRATE_MAP" \
        --once
}

cmd_restart() {
    log_info "Restarting Directive Agent Daemon..."
    cmd_stop
    sleep 2
    cmd_start
}

cmd_help() {
    echo "Directive Agent Daemon Control Script"
    echo ""
    echo "Usage: $0 <command>"
    echo ""
    echo "Commands:"
    echo "  start     Start the daemon in background"
    echo "  stop      Stop the daemon gracefully"
    echo "  status    Check daemon status and heartbeat"
    echo "  tail      Follow daemon logs"
    echo "  process   Process one cycle and exit"
    echo "  restart   Restart the daemon"
    echo "  help      Show this help message"
    echo ""
    echo "Environment Variables:"
    echo "  DIRECTIVE_WP_URL        WordPress URL (default: http://localhost:8080)"
    echo "  DIRECTIVE_POLL_INTERVAL Polling interval in seconds (default: 30)"
    echo ""
    echo "Files:"
    echo "  PID File:   $PID_FILE"
    echo "  Heartbeat:  $HEARTBEAT_FILE"
    echo "  Log File:   $LOG_FILE"
}

# Main
case "${1:-help}" in
    start)
        cmd_start
        ;;
    stop)
        cmd_stop
        ;;
    status)
        cmd_status
        ;;
    tail)
        cmd_tail
        ;;
    process)
        cmd_process
        ;;
    restart)
        cmd_restart
        ;;
    help|--help|-h)
        cmd_help
        ;;
    *)
        log_error "Unknown command: $1"
        cmd_help
        exit 1
        ;;
esac
```

**Step 2: Make script executable**

Run: `chmod +x /home/jericho/zion/projects/geometry_os/geometry_os/systems/intelligence/directive_ctl.sh`
Expected: No error

**Step 3: Test help command**

Run: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/intelligence/directive_ctl.sh help`
Expected: Help text with commands listed

**Step 4: Commit**

```bash
git add systems/intelligence/directive_ctl.sh
git commit -m "feat(directive): add directive_ctl.sh control script"
```

---

## Task 4: Write Integration Tests for Control Script

**Files:**
- Create: `tests/test_directive_ctl.sh`

**Step 1: Write the test script**

```bash
#!/bin/bash
#
# Test suite for directive_ctl.sh
#
# Run: bash tests/test_directive_ctl.sh
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CTL_SCRIPT="${PROJECT_ROOT}/systems/intelligence/directive_ctl.sh"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

pass() {
    echo -e "${GREEN}✓ PASS:${NC} $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

fail() {
    echo -e "${RED}✗ FAIL:${NC} $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

# Test 1: Help command
test_help_command() {
    local output=$("$CTL_SCRIPT" help 2>&1)

    if echo "$output" | grep -q "start" && \
       echo "$output" | grep -q "stop" && \
       echo "$output" | grep -q "status"; then
        pass "help command shows expected options"
    else
        fail "help command missing expected options"
    fi
}

# Test 2: Status when stopped
test_status_when_stopped() {
    # Ensure daemon is not running
    "$CTL_SCRIPT" stop 2>/dev/null || true

    local output=$("$CTL_SCRIPT" status 2>&1)

    if echo "$output" | grep -qi "stopped"; then
        pass "status shows STOPPED when daemon not running"
    else
        fail "status should show STOPPED"
    fi
}

# Test 3: Process once command
test_process_once() {
    local output=$("$CTL_SCRIPT" process 2>&1)

    # Should complete without error
    pass "process once command executes without error"
}

# Test 4: Script is executable
test_executable() {
    if [ -x "$CTL_SCRIPT" ]; then
        pass "directive_ctl.sh is executable"
    else
        fail "directive_ctl.sh is not executable"
    fi
}

# Run tests
echo "Running directive_ctl.sh tests..."
echo ""

test_executable
test_help_command
test_status_when_stopped
test_process_once

# Summary
echo ""
echo "========================================="
echo "Tests: $TESTS_PASSED passed, $TESTS_FAILED failed"
echo "========================================="

if [ $TESTS_FAILED -gt 0 ]; then
    exit 1
fi
```

**Step 2: Run tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && bash tests/test_directive_ctl.sh`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/test_directive_ctl.sh
git commit -m "test(directive): add control script integration tests"
```

---

## Task 5: Update Documentation

**Files:**
- Modify: `specs/command-console/README.md` (create if needed)

**Step 1: Create README with usage instructions**

```markdown
# Command Console - Directive Agent

Bidirectional human-AI collaboration via WordPress Directives.

## Quick Start

### Start the Daemon

```bash
./systems/intelligence/directive_ctl.sh start
```

### Check Status

```bash
./systems/intelligence/directive_ctl.sh status
```

### Process One Cycle

```bash
./systems/intelligence/directive_ctl.sh process
```

### Follow Logs

```bash
./systems/intelligence/directive_ctl.sh tail
```

### Stop the Daemon

```bash
./systems/intelligence/directive_ctl.sh stop
```

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
```

**Step 2: Commit**

```bash
git add specs/command-console/README.md
git commit -m "docs(command-console): add directive agent usage documentation"
```

---

## Task 6: Final Verification

**Files:**
- None (verification only)

**Step 1: Run all DirectiveAgent tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/test_directive_agent.py -v`
Expected: All tests pass

**Step 2: Run control script tests**

Run: `cd /home/jericho/zion/projects/geometry_os/geometry_os && bash tests/test_directive_ctl.sh`
Expected: All tests pass

**Step 3: Test full daemon lifecycle**

```bash
# Start daemon
./systems/intelligence/directive_ctl.sh start

# Check status (should show RUNNING)
./systems/intelligence/directive_ctl.sh status

# Stop daemon
./systems/intelligence/directive_ctl.sh stop

# Check status (should show STOPPED)
./systems/intelligence/directive_ctl.sh status
```

Expected: All commands execute without error

**Step 4: Final commit (if any fixes needed)**

```bash
git status
# If changes, commit with:
git commit -m "fix(directive): address final verification issues"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Add heartbeat support | directive_agent.py, test_directive_agent.py |
| 2 | Add CLI arguments | directive_agent.py, test_directive_agent.py |
| 3 | Create control script | directive_ctl.sh |
| 4 | Write integration tests | test_directive_ctl.sh |
| 5 | Update documentation | README.md |
| 6 | Final verification | (none) |

**Estimated effort:** 1-2 hours

**Dependencies:** None (DirectiveAgent already exists from Phase 3)
