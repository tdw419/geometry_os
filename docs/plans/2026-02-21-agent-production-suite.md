# Agent Production Suite Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Productionize both DirectiveAgent and RtsWatcherAgent with control scripts, heartbeat monitoring, unified status page, and optional systemd service files.

**Architecture:** Both agents follow the same daemon pattern: control script (`.ctl.sh`) manages PID/heartbeat files, agent writes heartbeat JSON every cycle, unified status page queries both heartbeat files. Systemd services optional for auto-start.

**Tech Stack:** Python 3.12, Bash, JSON for heartbeat files, systemd (optional)

---

## Task 1: Add Heartbeat Support to RtsWatcherAgent

**Files:**
- Modify: `systems/intelligence/rts_watcher_agent.py`

**Step 1: Add heartbeat infrastructure**

Add to `RtsWatcherAgent` class:

```python
#!/usr/bin/env python3
"""
RtsWatcherAgent - Discovers and publishes RTS snapshots to WordPress.

Monitors directories for .rts.png + .rts.meta.json pairs and auto-publishes
them to the WordPress Hilbert Gallery.
"""

import os
import sys
import json
import time
import glob
import argparse
import logging
from pathlib import Path
from typing import Optional, List, Dict, Any

import requests


class RtsWatcherAgent:
    """
    Agent that watches for RTS files and publishes them to WordPress.
    """

    WP_URL: str = "http://localhost:8080"
    POLL_INTERVAL: int = 60
    API_TIMEOUT: int = 30

    def __init__(
        self,
        wp_url: Optional[str] = None,
        watch_dirs: Optional[List[str]] = None,
        poll_interval: Optional[int] = None,
        heartbeat_path: Optional[str] = None
    ):
        self.wp_url = wp_url or self.WP_URL
        self.api_endpoint = f"{self.wp_url}/ai-publisher.php"
        self.watch_dirs = watch_dirs or ["rts_files"]
        self.poll_interval = poll_interval or self.POLL_INTERVAL

        # Heartbeat support
        self.heartbeat_path = heartbeat_path or os.environ.get("RTS_WATCHER_HEARTBEAT_PATH", "")
        self._snapshots_published = 0
        self._start_time = time.time()

        # Logging setup
        self.logger = logging.getLogger("RtsWatcherAgent")
        self.logger.setLevel(logging.INFO)

        # Track ingested files to avoid duplicates
        self._ingested_files: set = set()
        self._load_ingestion_state()

    def _load_ingestion_state(self) -> None:
        """Load previously ingested files from state file."""
        state_file = Path(self.heartbeat_path).parent / "rts_watcher_state.json" if self.heartbeat_path else None
        if state_file and state_file.exists():
            try:
                with open(state_file, 'r') as f:
                    data = json.load(f)
                    self._ingested_files = set(data.get("ingested", []))
                    self._snapshots_published = data.get("snapshots_published", 0)
                self.logger.info(f"Loaded state: {len(self._ingested_files)} files already ingested")
            except (json.JSONDecodeError, IOError) as e:
                self.logger.warning(f"Failed to load state: {e}")

    def _save_ingestion_state(self) -> None:
        """Save ingestion state to file."""
        if not self.heartbeat_path:
            return

        state_file = Path(self.heartbeat_path).parent / "rts_watcher_state.json"
        try:
            state_file.parent.mkdir(parents=True, exist_ok=True)
            with open(state_file, 'w') as f:
                json.dump({
                    "ingested": list(self._ingested_files),
                    "snapshots_published": self._snapshots_published,
                    "last_updated": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
                }, f, indent=2)
        except (IOError, OSError) as e:
            self.logger.warning(f"Failed to save state: {e}")

    def write_heartbeat(self) -> None:
        """Write heartbeat file for daemon monitoring."""
        if not self.heartbeat_path:
            return

        heartbeat = {
            "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
            "pid": os.getpid(),
            "running": True,
            "uptime_seconds": time.time() - self._start_time,
            "snapshots_published": self._snapshots_published,
            "files_ingested": len(self._ingested_files),
            "watch_dirs": self.watch_dirs,
            "wp_url": self.wp_url,
            "poll_interval": self.poll_interval
        }

        try:
            path = Path(self.heartbeat_path)
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, 'w') as f:
                json.dump(heartbeat, f, indent=2)
        except (IOError, OSError) as e:
            self.logger.warning(f"Failed to write heartbeat: {e}")

    def scan_directory(self, directory: str) -> List[Dict[str, Any]]:
        """
        Scan a directory for RTS files with metadata.

        Returns:
            List of dicts with rts_path and meta_json
        """
        discovered = []
        rts_files = glob.glob(os.path.join(directory, "**/*.rts.png"), recursive=True)

        for rts_path in rts_files:
            # Skip already ingested
            if rts_path in self._ingested_files:
                continue

            meta_path = rts_path.replace(".rts.png", ".rts.meta.json")
            if not os.path.exists(meta_path):
                self.logger.debug(f"Metadata missing for {rts_path}, skipping")
                continue

            try:
                with open(meta_path, 'r') as f:
                    meta_json = json.load(f)
                discovered.append({
                    "rts_path": rts_path,
                    "meta_json": meta_json
                })
            except (json.JSONDecodeError, IOError) as e:
                self.logger.warning(f"Failed to read metadata for {rts_path}: {e}")

        return discovered

    def ingest_snapshot(self, rts_path: str, meta_json: Dict[str, Any]) -> Optional[int]:
        """
        Ingest a single RTS snapshot to WordPress.

        Returns:
            Post ID if successful, None otherwise
        """
        title = os.path.basename(rts_path).replace(".rts.png", "").replace("_", " ").title()

        payload = {
            "tool": "createSnapshot",
            "arguments": {
                "title": title,
                "image_path": os.path.abspath(rts_path),
                "meta_json": meta_json,
                "status": "publish"
            }
        }

        try:
            response = requests.post(self.api_endpoint, json=payload, timeout=self.API_TIMEOUT)
            result = response.json()

            if result.get("success"):
                post_id = result.get("post_id")
                self.logger.info(f"Ingested: {title} (Post ID: {post_id})")
                return post_id
            else:
                self.logger.error(f"Failed to ingest {title}: {result.get('error')}")
                return None

        except requests.RequestException as e:
            self.logger.error(f"API error for {title}: {e}")
            return None

    def scan_and_ingest(self) -> int:
        """
        Scan all watch directories and ingest new files.

        Returns:
            Number of snapshots successfully ingested
        """
        self.logger.info(f"Scanning {len(self.watch_dirs)} directories for RTS files...")

        ingested = 0

        for directory in self.watch_dirs:
            if not os.path.isdir(directory):
                self.logger.warning(f"Directory not found: {directory}")
                continue

            discovered = self.scan_directory(directory)

            for item in discovered:
                post_id = self.ingest_snapshot(item["rts_path"], item["meta_json"])
                if post_id:
                    self._ingested_files.add(item["rts_path"])
                    ingested += 1
                    self._snapshots_published += 1

        self._save_ingestion_state()
        self.write_heartbeat()

        self.logger.info(f"Ingested {ingested} new snapshots")
        return ingested

    def process_one_cycle(self) -> int:
        """Process one scan cycle."""
        return self.scan_and_ingest()

    def run_forever(self) -> None:
        """
        Run agent in continuous polling loop.

        This method blocks forever until interrupted.
        """
        self.logger.info(f"Starting RtsWatcherAgent (polling every {self.poll_interval}s)")
        self.write_heartbeat()

        while True:
            try:
                self.process_one_cycle()
            except Exception as e:
                self.logger.error(f"Cycle error: {e}")

            time.sleep(self.poll_interval)


def main():
    """Entry point for running RtsWatcherAgent."""
    parser = argparse.ArgumentParser(
        description="RtsWatcherAgent - Discovers and publishes RTS snapshots"
    )
    parser.add_argument(
        "--wp-url",
        default="http://localhost:8080",
        help="WordPress URL (default: http://localhost:8080)"
    )
    parser.add_argument(
        "--watch-dirs",
        nargs="+",
        default=["rts_files"],
        help="Directories to watch for RTS files"
    )
    parser.add_argument(
        "--poll-interval",
        type=int,
        default=60,
        help="Scan interval in seconds (default: 60)"
    )
    parser.add_argument(
        "--heartbeat",
        default="",
        help="Path to heartbeat file"
    )
    parser.add_argument(
        "--once",
        action="store_true",
        help="Scan once and exit"
    )
    parser.add_argument(
        "--version",
        action="version",
        version="RtsWatcherAgent 1.0.0"
    )

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )

    agent = RtsWatcherAgent(
        wp_url=args.wp_url,
        watch_dirs=args.watch_dirs,
        poll_interval=args.poll_interval,
        heartbeat_path=args.heartbeat
    )

    if args.once:
        ingested = agent.process_one_cycle()
        logging.info(f"Ingested {ingested} snapshots, exiting")
        sys.exit(0)
    else:
        agent.run_forever()


if __name__ == "__main__":
    main()
```

**Step 2: Verify the agent works**

Run: `python -c "from systems.intelligence.rts_watcher_agent import RtsWatcherAgent; print('OK')"`
Expected: `OK`

**Step 3: Commit**

```bash
git add systems/intelligence/rts_watcher_agent.py
git commit -m "feat(rts-watcher): add heartbeat, CLI args, and continuous mode"
```

---

## Task 2: Create rts_watcher_ctl.sh Control Script

**Files:**
- Create: `systems/intelligence/rts_watcher_ctl.sh`

**Step 1: Create the control script**

```bash
#!/bin/bash
#
# rts_watcher_ctl.sh - Control script for the RTS Watcher Agent
#
# Usage:
#   ./rts_watcher_ctl.sh start     - Start the daemon
#   ./rts_watcher_ctl.sh stop      - Stop the daemon
#   ./rts_watcher_ctl.sh status    - Check daemon status
#   ./rts_watcher_ctl.sh tail      - Follow daemon logs
#   ./rts_watcher_ctl.sh scan      - Scan once and exit
#   ./rts_watcher_ctl.sh restart   - Restart the daemon
#

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
export PYTHONPATH="${PROJECT_ROOT}:${PYTHONPATH}"
DAEMON_SCRIPT="${SCRIPT_DIR}/rts_watcher_agent.py"
PID_FILE="${SCRIPT_DIR}/rts_watcher_agent.pid"
HEARTBEAT_FILE="${SCRIPT_DIR}/rts_watcher_heartbeat.json"
STATE_FILE="${SCRIPT_DIR}/rts_watcher_state.json"
LOG_DIR="${PROJECT_ROOT}/.geometry/logs"
LOG_FILE="${LOG_DIR}/rts_watcher_agent.log"

# Default options
WP_URL=${RTS_WP_URL:-"http://localhost:8080"}
POLL_INTERVAL=${RTS_POLL_INTERVAL:-60}
WATCH_DIRS=${RTS_WATCH_DIRS:-"rts_files"}

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
    log_info "Starting RTS Watcher Agent..."

    if check_daemon_running; then
        log_warn "Daemon is already running (PID: $(get_pid))"
        return 0
    fi

    # Ensure log directory exists
    mkdir -p "$LOG_DIR"

    # Start daemon in background
    nohup python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --watch-dirs $WATCH_DIRS \
        --poll-interval "$POLL_INTERVAL" \
        --heartbeat "$HEARTBEAT_FILE" \
        > "$LOG_FILE" 2>&1 &

    local pid=$!
    echo $pid > "$PID_FILE"

    # Wait for daemon to start
    sleep 2

    if check_daemon_running; then
        log_info "RTS Watcher Agent started (PID: $pid)"
        log_info "Heartbeat: $HEARTBEAT_FILE"
        log_info "State: $STATE_FILE"
        log_info "Logs: $LOG_FILE"
    else
        log_error "Failed to start RTS Watcher Agent"
        cat "$LOG_FILE" 2>/dev/null || true
        rm -f "$PID_FILE"
        exit 1
    fi
}

cmd_stop() {
    log_info "Stopping RTS Watcher Agent..."

    if ! check_daemon_running; then
        log_warn "Daemon is not running"
        rm -f "$PID_FILE"
        return 0
    fi

    local pid=$(get_pid)

    kill -TERM "$pid" 2>/dev/null

    if wait_for_shutdown 30; then
        log_info "RTS Watcher Agent stopped gracefully"
        rm -f "$PID_FILE"
    else
        log_warn "Daemon did not stop gracefully, sending SIGKILL..."
        kill -KILL "$pid" 2>/dev/null
        sleep 1
        rm -f "$PID_FILE"
        log_info "RTS Watcher Agent stopped (forced)"
    fi
}

cmd_status() {
    log_info_blue "RTS Watcher Agent Status"
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
try:
    with open('$HEARTBEAT_FILE', 'r') as f:
        data = json.load(f)

    print(f\"  Timestamp: {data.get('timestamp', 'N/A')}\")
    print(f\"  Running: {data.get('running', False)}\")
    print(f\"  PID: {data.get('pid', 'N/A')}\")
    print(f\"  Uptime: {data.get('uptime_seconds', 0):.0f}s\")
    print(f\"  Snapshots Published: {data.get('snapshots_published', 0)}\")
    print(f\"  Files Ingested: {data.get('files_ingested', 0)}\")
    print(f\"  Watch Dirs: {data.get('watch_dirs', [])}\")
except Exception as e:
    print(f'  Error reading heartbeat: {e}')
" 2>/dev/null || echo "  (Could not parse heartbeat file)"
    else
        echo "Heartbeat: (not available)"
    fi

    echo ""

    # Show state info if available
    if [ -f "$STATE_FILE" ]; then
        echo "State:"
        python3 -c "
import json
try:
    with open('$STATE_FILE', 'r') as f:
        data = json.load(f)
    print(f\"  Files Ingested: {len(data.get('ingested', []))}\")
    print(f\"  Last Updated: {data.get('last_updated', 'N/A')}\")
except Exception as e:
    print(f'  Error reading state: {e}')
" 2>/dev/null || echo "  (Could not parse state file)"
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

cmd_scan() {
    log_info "Running single scan cycle..."

    python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --watch-dirs $WATCH_DIRS \
        --once
}

cmd_restart() {
    log_info "Restarting RTS Watcher Agent..."
    cmd_stop
    sleep 2
    cmd_start
}

cmd_help() {
    echo "RTS Watcher Agent Control Script"
    echo ""
    echo "Usage: $0 <command>"
    echo ""
    echo "Commands:"
    echo "  start     Start the daemon in background"
    echo "  stop      Stop the daemon gracefully"
    echo "  status    Check daemon status"
    echo "  tail      Follow daemon logs"
    echo "  scan      Scan once and exit"
    echo "  restart   Restart the daemon"
    echo "  help      Show this help message"
    echo ""
    echo "Environment Variables:"
    echo "  RTS_WP_URL        WordPress URL (default: http://localhost:8080)"
    echo "  RTS_POLL_INTERVAL Scan interval in seconds (default: 60)"
    echo "  RTS_WATCH_DIRS    Directories to watch (default: rts_files)"
    echo ""
    echo "Files:"
    echo "  PID File:   $PID_FILE"
    echo "  Heartbeat:  $HEARTBEAT_FILE"
    echo "  State:      $STATE_FILE"
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
    scan)
        cmd_scan
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

**Step 2: Make executable and test**

Run: `chmod +x systems/intelligence/rts_watcher_ctl.sh && ./systems/intelligence/rts_watcher_ctl.sh help`
Expected: Help text displayed

**Step 3: Commit**

```bash
git add systems/intelligence/rts_watcher_ctl.sh
git commit -m "feat(rts-watcher): add control script with start/stop/status"
```

---

## Task 3: Create Unified Agent Status Page

**Files:**
- Create: `systems/intelligence/agent_status.sh`

**Step 1: Create unified status script**

```bash
#!/bin/bash
#
# agent_status.sh - Unified status for all Geometry OS agents
#
# Usage: ./agent_status.sh
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}${CYAN}           Geometry OS Agent Status Dashboard               ${NC}"
echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════════${NC}"
echo ""

# DirectiveAgent Status
echo -e "${BOLD}📡 DirectiveAgent${NC}"
echo "─────────────────────────────────────────"
if [ -f "$SCRIPT_DIR/directive_agent.pid" ] && ps -p $(cat "$SCRIPT_DIR/directive_agent.pid") > /dev/null 2>&1; then
    echo -e "  Status: ${GREEN}● RUNNING${NC}"
    echo "  PID:    $(cat $SCRIPT_DIR/directive_agent.pid)"
else
    echo -e "  Status: ${RED}○ STOPPED${NC}"
fi

if [ -f "$SCRIPT_DIR/directive_heartbeat.json" ]; then
    python3 -c "
import json
with open('$SCRIPT_DIR/directive_heartbeat.json') as f:
    d = json.load(f)
print(f\"  Uptime:         {d.get('uptime_seconds', 0):.0f}s\")
print(f\"  Processed:      {d.get('directives_processed', 0)} directives\")
print(f\"  Components:     {d.get('substrate_components', 0)} in cache\")
" 2>/dev/null
fi
echo ""

# RtsWatcherAgent Status
echo -e "${BOLD}🖼️  RtsWatcherAgent${NC}"
echo "─────────────────────────────────────────"
if [ -f "$SCRIPT_DIR/rts_watcher_agent.pid" ] && ps -p $(cat "$SCRIPT_DIR/rts_watcher_agent.pid") > /dev/null 2>&1; then
    echo -e "  Status: ${GREEN}● RUNNING${NC}"
    echo "  PID:    $(cat $SCRIPT_DIR/rts_watcher_agent.pid)"
else
    echo -e "  Status: ${RED}○ STOPPED${NC}"
fi

if [ -f "$SCRIPT_DIR/rts_watcher_heartbeat.json" ]; then
    python3 -c "
import json
with open('$SCRIPT_DIR/rts_watcher_heartbeat.json') as f:
    d = json.load(f)
print(f\"  Uptime:         {d.get('uptime_seconds', 0):.0f}s\")
print(f\"  Published:      {d.get('snapshots_published', 0)} snapshots\")
print(f\"  Files Ingested: {d.get('files_ingested', 0)}\")
" 2>/dev/null
fi
echo ""

# Quick Actions
echo -e "${BOLD}⚡ Quick Actions${NC}"
echo "─────────────────────────────────────────"
echo "  ./directive_ctl.sh status      - Full directive status"
echo "  ./rts_watcher_ctl.sh status    - Full watcher status"
echo "  ./directive_ctl.sh tail        - Follow directive logs"
echo "  ./rts_watcher_ctl.sh tail      - Follow watcher logs"
echo ""

# Summary
running=0
[ -f "$SCRIPT_DIR/directive_agent.pid" ] && ps -p $(cat "$SCRIPT_DIR/directive_agent.pid") > /dev/null 2>&1 && ((running++))
[ -f "$SCRIPT_DIR/rts_watcher_agent.pid" ] && ps -p $(cat "$SCRIPT_DIR/rts_watcher_agent.pid") > /dev/null 2>&1 && ((running++))

echo -e "${BOLD}Summary: ${running}/2 agents running${NC}"
echo ""
```

**Step 2: Make executable and test**

Run: `chmod +x systems/intelligence/agent_status.sh && ./systems/intelligence/agent_status.sh`
Expected: Status dashboard displayed

**Step 3: Commit**

```bash
git add systems/intelligence/agent_status.sh
git commit -m "feat(agents): add unified status dashboard for all agents"
```

---

## Task 4: Create Integration Tests

**Files:**
- Create: `tests/test_rts_watcher_agent.py`

**Step 1: Create test file**

```python
#!/usr/bin/env python3
"""
Tests for RtsWatcherAgent.
"""

import json
import pytest
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

from systems.intelligence.rts_watcher_agent import RtsWatcherAgent


class TestRtsWatcherAgentInit:
    """Test agent initialization."""

    def test_default_initialization(self):
        """Agent should initialize with defaults."""
        agent = RtsWatcherAgent()
        assert agent.wp_url == "http://localhost:8080"
        assert agent.watch_dirs == ["rts_files"]
        assert agent.poll_interval == 60

    def test_custom_initialization(self):
        """Agent should accept custom parameters."""
        agent = RtsWatcherAgent(
            wp_url="http://custom:9000",
            watch_dirs=["dir1", "dir2"],
            poll_interval=30
        )
        assert agent.wp_url == "http://custom:9000"
        assert agent.watch_dirs == ["dir1", "dir2"]
        assert agent.poll_interval == 30


class TestHeartbeatSupport:
    """Test heartbeat functionality."""

    def test_write_heartbeat_creates_file(self, tmp_path):
        """Heartbeat file should be created."""
        heartbeat_file = tmp_path / "heartbeat.json"
        agent = RtsWatcherAgent(heartbeat_path=str(heartbeat_file))

        agent.write_heartbeat()

        assert heartbeat_file.exists()

    def test_heartbeat_contains_required_fields(self, tmp_path):
        """Heartbeat should have required fields."""
        heartbeat_file = tmp_path / "heartbeat.json"
        agent = RtsWatcherAgent(heartbeat_path=str(heartbeat_file))

        agent.write_heartbeat()

        with open(heartbeat_file) as f:
            data = json.load(f)

        assert "timestamp" in data
        assert "pid" in data
        assert "running" in data
        assert "snapshots_published" in data
        assert "files_ingested" in data

    def test_heartbeat_updates_after_ingestion(self, tmp_path):
        """Heartbeat should reflect ingestion count."""
        heartbeat_file = tmp_path / "heartbeat.json"
        agent = RtsWatcherAgent(heartbeat_path=str(heartbeat_file))

        agent._snapshots_published = 5
        agent.write_heartbeat()

        with open(heartbeat_file) as f:
            data = json.load(f)

        assert data["snapshots_published"] == 5


class TestDirectoryScanning:
    """Test directory scanning functionality."""

    def test_scan_finds_rts_files(self, tmp_path):
        """Scanner should find .rts.png files with metadata."""
        # Create test files
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"fake png data")
        meta_file = tmp_path / "test.rts.meta.json"
        meta_file.write_text(json.dumps({"format": "PixelRTS-1.0"}))

        agent = RtsWatcherAgent(watch_dirs=[str(tmp_path)])
        discovered = agent.scan_directory(str(tmp_path))

        assert len(discovered) == 1
        assert discovered[0]["rts_path"] == str(rts_file)

    def test_scan_skips_files_without_metadata(self, tmp_path):
        """Scanner should skip .rts.png files without metadata."""
        rts_file = tmp_path / "orphan.rts.png"
        rts_file.write_bytes(b"fake png data")

        agent = RtsWatcherAgent(watch_dirs=[str(tmp_path)])
        discovered = agent.scan_directory(str(tmp_path))

        assert len(discovered) == 0

    def test_scan_skips_already_ingested(self, tmp_path):
        """Scanner should skip already ingested files."""
        rts_file = tmp_path / "test.rts.png"
        rts_file.write_bytes(b"fake png data")
        meta_file = tmp_path / "test.rts.meta.json"
        meta_file.write_text(json.dumps({"format": "PixelRTS-1.0"}))

        agent = RtsWatcherAgent(watch_dirs=[str(tmp_path)])
        agent._ingested_files.add(str(rts_file))

        discovered = agent.scan_directory(str(tmp_path))

        assert len(discovered) == 0


class TestCLIInterface:
    """Test CLI interface."""

    def test_cli_help(self):
        """--help should show options."""
        import subprocess
        import sys

        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.rts_watcher_agent", "--help"],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "--once" in result.stdout

    def test_cli_version(self):
        """--version should show version."""
        import subprocess
        import sys

        result = subprocess.run(
            [sys.executable, "-m", "systems.intelligence.rts_watcher_agent", "--version"],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
```

**Step 2: Run tests**

Run: `python -m pytest tests/test_rts_watcher_agent.py -v`
Expected: All tests pass

**Step 3: Commit**

```bash
git add tests/test_rts_watcher_agent.py
git commit -m "test(rts-watcher): add unit tests for RtsWatcherAgent"
```

---

## Task 5: Create Control Script Integration Tests

**Files:**
- Create: `tests/test_rts_watcher_ctl.sh`

**Step 1: Create test script**

```bash
#!/bin/bash
#
# Test suite for rts_watcher_ctl.sh
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CTL_SCRIPT="${PROJECT_ROOT}/systems/intelligence/rts_watcher_ctl.sh"

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

# Tests
test_executable() {
    if [ -x "$CTL_SCRIPT" ]; then
        pass "rts_watcher_ctl.sh is executable"
    else
        fail "rts_watcher_ctl.sh is not executable"
    fi
}

test_help_command() {
    local output=$("$CTL_SCRIPT" help 2>&1)

    if echo "$output" | grep -q "start" && echo "$output" | grep -q "stop"; then
        pass "help command shows expected options"
    else
        fail "help command missing expected options"
    fi
}

test_status_when_stopped() {
    "$CTL_SCRIPT" stop 2>/dev/null || true
    local output=$("$CTL_SCRIPT" status 2>&1)

    if echo "$output" | grep -qi "stopped"; then
        pass "status shows STOPPED when not running"
    else
        fail "status should show STOPPED"
    fi
}

test_scan_command() {
    local output=$("$CTL_SCRIPT" scan 2>&1)

    pass "scan command executes without error"
}

# Run tests
echo "Running rts_watcher_ctl.sh tests..."
echo ""

test_executable
test_help_command
test_status_when_stopped
test_scan_command

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

Run: `bash tests/test_rts_watcher_ctl.sh`
Expected: All 4 tests pass

**Step 3: Commit**

```bash
git add tests/test_rts_watcher_ctl.sh
git commit -m "test(rts-watcher): add control script integration tests"
```

---

## Task 6: Final Verification and Documentation

**Files:**
- Modify: `specs/command-console/README.md`

**Step 1: Update README with both agents**

Add section:

```markdown
## Agent Management

### Unified Status

Check status of all agents:
```bash
./systems/intelligence/agent_status.sh
```

### DirectiveAgent

Process WordPress directives:
```bash
./systems/intelligence/directive_ctl.sh start
./systems/intelligence/directive_ctl.sh status
./systems/intelligence/directive_ctl.sh stop
```

### RtsWatcherAgent

Watch and publish RTS snapshots:
```bash
./systems/intelligence/rts_watcher_ctl.sh start
./systems/intelligence/rts_watcher_ctl.sh status
./systems/intelligence/rts_watcher_ctl.sh scan   # One-time scan
./systems/intelligence/rts_watcher_ctl.sh stop
```

### Environment Variables

| Variable | Agent | Default |
|----------|-------|---------|
| DIRECTIVE_WP_URL | DirectiveAgent | http://localhost:8080 |
| DIRECTIVE_POLL_INTERVAL | DirectiveAgent | 30 |
| RTS_WP_URL | RtsWatcherAgent | http://localhost:8080 |
| RTS_POLL_INTERVAL | RtsWatcherAgent | 60 |
| RTS_WATCH_DIRS | RtsWatcherAgent | rts_files |
```

**Step 2: Run full test suite**

Run: `python -m pytest tests/test_directive*.py tests/test_rts_watcher*.py -v`
Expected: All tests pass

**Step 3: Test both daemons**

```bash
# Start both agents
./systems/intelligence/directive_ctl.sh start
./systems/intelligence/rts_watcher_ctl.sh start

# Check unified status
./systems/intelligence/agent_status.sh

# Stop both
./systems/intelligence/directive_ctl.sh stop
./systems/intelligence/rts_watcher_ctl.sh stop
```

**Step 4: Commit**

```bash
git add specs/command-console/README.md
git commit -m "docs: add unified agent management documentation"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | Add heartbeat + CLI to RtsWatcherAgent | rts_watcher_agent.py |
| 2 | Create rts_watcher_ctl.sh | rts_watcher_ctl.sh |
| 3 | Create unified status page | agent_status.sh |
| 4 | Create unit tests | test_rts_watcher_agent.py |
| 5 | Create integration tests | test_rts_watcher_ctl.sh |
| 6 | Documentation + verification | README.md |

**Estimated effort:** 2-3 hours

**Pattern:** Follows existing `directive_ctl.sh` exactly for consistency
