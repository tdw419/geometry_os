---
spec: directive-control-surface
phase: requirements
created: 2026-02-21T17:00:00Z
---

# Requirements: Directive Control Surface

## Goal

Create a production-ready control surface for the DirectiveAgent daemon with start/stop/status/tail commands following the existing evolution_ctl.sh pattern.

## User Stories

### US-1: Start Daemon
**As a** developer
**I want to** start the DirectiveAgent daemon with a simple command
**So that** it runs in the background processing directives

**Acceptance Criteria:**
- `./directive_ctl.sh start` launches daemon
- Daemon runs in background with nohup
- PID file is created for tracking
- Heartbeat file is created within 5 seconds

### US-2: Stop Daemon
**As a** developer
**I want to** stop the DirectiveAgent daemon gracefully
**So that** in-flight processing completes

**Acceptance Criteria:**
- `./directive_ctl.sh stop` sends SIGTERM first
- Waits up to 30 seconds for graceful shutdown
- Falls back to SIGKILL if needed
- Cleans up PID file on exit

### US-3: Check Status
**As a** developer
**I want to** see the current daemon status
**So that** I can verify it's running and healthy

**Acceptance Criteria:**
- `./directive_ctl.sh status` shows RUNNING/STOPPED
- Displays PID, uptime, directives processed
- Reads heartbeat file for live data

### US-4: Process Once
**As a** developer
**I want to** run a single directive processing cycle
**So that** I can test without running the daemon

**Acceptance Criteria:**
- `./directive_ctl.sh process` runs one cycle
- Exits after processing completes
- Returns appropriate exit code

## Functional Requirements

### FR-1: Heartbeat File (High)
The DirectiveAgent must write a heartbeat JSON file every cycle containing:
- timestamp (ISO 8601)
- pid (process ID)
- running (boolean)
- uptime_seconds (float)
- directives_processed (int)
- wp_url (string)
- substrate_components (int)

### FR-2: CLI Arguments (High)
The DirectiveAgent must accept CLI arguments:
- `--wp-url` - WordPress URL
- `--poll-interval` - Seconds between polls
- `--heartbeat` - Path to heartbeat file
- `--substrate-map` - Path to substrate cache
- `--once` - Process one cycle and exit
- `--version` - Show version

### FR-3: Control Script Commands (High)
The directive_ctl.sh must support:
- `start` - Start daemon in background
- `stop` - Stop daemon gracefully
- `status` - Show daemon status
- `tail` - Follow log file
- `process` - Run single cycle
- `restart` - Stop then start
- `help` - Show usage

### FR-4: Environment Variables (Medium)
The control script must respect:
- `DIRECTIVE_WP_URL` - WordPress URL override
- `DIRECTIVE_POLL_INTERVAL` - Polling interval override

### FR-5: Log File (Medium)
All daemon output must be logged to:
- `.geometry/logs/directive_agent.log`

### FR-6: PID File (Medium)
The control script must manage:
- `directive_agent.pid` in script directory
- Stale PID detection and cleanup

### FR-7: Unit Tests (High)
Test coverage required for:
- Heartbeat file creation
- Heartbeat content validation
- Heartbeat update on cycle

### FR-8: Integration Tests (Medium)
Bash tests required for:
- Help command output
- Status when stopped
- Process once command
- Script executability

## Non-Functional Requirements

### NFR-1: Startup Time
Daemon must start and write heartbeat within 5 seconds.

### NFR-2: Shutdown Time
Daemon must shut down gracefully within 30 seconds.

### NFR-3: Pattern Consistency
Control script must follow evolution_ctl.sh pattern exactly.

### NFR-4: Error Handling
Control script must handle:
- Missing daemon script
- Permission errors
- WordPress unavailability

### NFR-5: Documentation
README must document all commands and configuration.

## Scope

**In Scope:**
- Heartbeat support in DirectiveAgent
- CLI argument parsing
- directive_ctl.sh control script
- Unit and integration tests
- Usage documentation

**Out of Scope:**
- Systemd service files
- Process supervision (e.g., supervisord)
- Windows support
- Multi-instance management
