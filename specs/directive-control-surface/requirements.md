---
spec: directive-control-surface
phase: requirements
created: 2026-02-21T12:00:00Z
generated: auto
---

# Requirements: Directive Control Surface

## Summary

Production-ready control surface for DirectiveAgent daemon with start/stop/status/tail commands following evolution_ctl.sh pattern.

## User Stories

### US-1: Daemon Lifecycle Control

As a **system operator**, I want to **start/stop/restart the DirectiveAgent daemon** so that **I can manage the service lifecycle**.

**Acceptance Criteria**:
- AC-1.1: `directive_ctl.sh start` launches daemon in background
- AC-1.2: `directive_ctl.sh stop` gracefully terminates daemon
- AC-1.3: `directive_ctl.sh restart` performs stop then start
- AC-1.4: PID file tracks running process

### US-2: Daemon Status Monitoring

As a **system operator**, I want to **check daemon status** so that **I can verify the service is healthy**.

**Acceptance Criteria**:
- AC-2.1: `directive_ctl.sh status` shows RUNNING/STOPPED state
- AC-2.2: Status displays heartbeat info (timestamp, PID, uptime, directives processed)
- AC-2.3: Heartbeat file written every processing cycle

### US-3: Log Observation

As a **system operator**, I want to **follow daemon logs** so that **I can debug issues**.

**Acceptance Criteria**:
- AC-3.1: `directive_ctl.sh tail` follows log file in real-time
- AC-3.2: Logs written to `.geometry/logs/directive_agent.log`

### US-4: Single-Cycle Processing

As a **developer**, I want to **process one cycle without daemon mode** so that **I can test functionality**.

**Acceptance Criteria**:
- AC-4.1: `directive_ctl.sh process` runs single cycle and exits
- AC-4.2: `--once` CLI flag triggers single-cycle mode

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | DirectiveAgent must write heartbeat JSON file after each cycle | Must | US-2 |
| FR-2 | Heartbeat must contain timestamp, pid, running, uptime_seconds, directives_processed, wp_url, poll_interval, substrate_components | Must | US-2 |
| FR-3 | DirectiveAgent must accept --heartbeat CLI argument | Must | US-2 |
| FR-4 | DirectiveAgent must accept --wp-url, --poll-interval, --substrate-map CLI arguments | Must | US-1 |
| FR-5 | DirectiveAgent must accept --once flag for single-cycle mode | Must | US-4 |
| FR-6 | DirectiveAgent must accept --version flag | Should | US-4 |
| FR-7 | Control script must support start/stop/status/tail/process/restart commands | Must | US-1 |
| FR-8 | Control script must use PID file for process tracking | Must | US-1 |
| FR-9 | Control script must display heartbeat info on status command | Must | US-2 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Control script must complete status check in < 1 second | Performance |
| NFR-2 | Heartbeat file must be valid JSON | Reliability |
| NFR-3 | Daemon must handle SIGTERM gracefully | Reliability |

## Out of Scope

- Multi-instance daemon management
- Remote daemon control (SSH/REST)
- Configuration file support (env vars only)
- Process supervision (systemd, supervisord)

## Dependencies

- WordPress instance running with ai-publisher.php endpoint
- Substrate map JSON at `.geometry/substrate_map.json` (optional)
