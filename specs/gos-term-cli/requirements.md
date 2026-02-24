# Requirements: gos-term CLI

## Goal

Command-line tool for Geometry OS Web Terminal enabling AI agents and developers to execute commands via WebSocket with NEB integration for swarm coordination. Single commands, interactive mode, and event publishing in one CLI.

## User Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Primary users | Internal developers only | Narrow audience, prioritize speed |
| Priority tradeoffs | Speed over completeness | MVP delivery first |
| Success criteria | Feature works as specified | Tests pass + functional code |

## User Stories

### US-1: Single Command Execution
**As a** developer
**I want to** run terminal commands via gos-term CLI
**So that** I can execute Geometry OS commands without opening the web terminal

**Acceptance Criteria:**
- [ ] AC-1.1: `gos-term ls -la` executes command and returns output
- [ ] AC-1.2: `gos-term -p 9000 pwd` connects to custom port
- [ ] AC-1.3: `gos-term --timeout 10 long-command` respects timeout
- [ ] AC-1.4: Connection errors show helpful message
- [ ] AC-1.5: Command timeout raises TimeoutError with clear message

### US-2: Interactive Terminal Session
**As a** developer
**I want to** start an interactive terminal session
**So that** I can run multiple commands in a persistent shell

**Acceptance Criteria:**
- [ ] AC-2.1: `gos-term -i` opens interactive session
- [ ] AC-2.2: Keyboard input streams to WebSocket
- [ ] AC-2.3: Terminal output displays in real-time
- [ ] AC-2.4: Ctrl+D or `exit` closes session cleanly
- [ ] AC-2.5: Terminal settings restored on exit (even on error)

### US-3: NEB Event Publishing
**As a** swarm agent
**I want to** subscribe to gos-term command events
**So that** I can react to terminal activity in real-time

**Acceptance Criteria:**
- [ ] AC-3.1: `gos-term --neb make test` publishes to NEB
- [ ] AC-3.2: Events published to `gos.term.command` topic
- [ ] AC-3.3: Payload contains command, output (truncated), timestamp
- [ ] AC-3.4: NEB unavailable does not crash CLI (graceful degradation)

### US-4: Shell Wrapper Integration
**As a** developer
**I want to** call `gos-term` from any directory
**So that** I can use it like any other CLI tool

**Acceptance Criteria:**
- [ ] AC-4.1: `gos-term` executable script wraps Python module
- [ ] AC-4.2: `gos-term --help` shows usage
- [ ] AC-4.3: `gos-term --version` shows version 1.0.0
- [ ] AC-4.4: Script executable without `.py` extension

### US-5: AI Agent Integration
**As an** AI agent
**I want to** execute commands and capture output programmatically
**So that** I can automate development tasks

**Acceptance Criteria:**
- [ ] AC-5.1: Non-interactive mode returns output to stdout
- [ ] AC-5.2: Exit code 0 on success, non-zero on failure
- [ ] AC-5.3: stderr contains error messages
- [ ] AC-5.4: JSON output mode optional (future: `--json`)

## Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|---------------------|
| FR-1 | Parse command arguments | High | All flags work: `-i`, `-p`, `--neb`, `--timeout`, `--version` |
| FR-2 | Connect to WebSocket terminal | High | Connects to `ws://localhost:8769/terminal` |
| FR-3 | Send command via WebSocket | High | Sends `{"type": "input", "data": "cmd\n"}` |
| FR-4 | Receive output from WebSocket | High | Receives `{"type": "output", "data": "..."}` |
| FR-5 | Handle command timeout | High | TimeoutError after configurable seconds |
| FR-6 | Interactive mode PTY handling | Medium | Raw mode stdin, proper termios cleanup |
| FR-7 | Publish to NEB on `--neb` flag | Medium | Topic: `gos.term.command` |
| FR-8 | Display help text | Medium | `--help` shows usage |
| FR-9 | Display version | Low | `--version` shows "gos-term 1.0.0" |
| FR-10 | Custom WebSocket port | Medium | `-p PORT` overrides default 8769 |
| FR-11 | Environment variable support | Low | `-e KEY=VALUE` sets env (deferred) |
| FR-12 | Exit code propagation | Medium | Return 0 on success, 1 on error |

## Non-Functional Requirements

| ID | Requirement | Metric | Target |
|----|-------------|--------|--------|
| NFR-1 | Command latency | Time to first output | < 500ms |
| NFR-2 | Memory footprint | RSS during execution | < 50MB |
| NFR-3 | Connection resilience | Error handling | Graceful message, exit 1 |
| NFR-4 | Terminal compatibility | POSIX compliance | Linux/macOS terminals |
| NFR-5 | Output encoding | UTF-8 handling | No encoding errors on valid UTF-8 |
| NFR-6 | Test coverage | Unit tests | > 80% of modules |

## Glossary

- **NEB**: Neural Event Bus - Geometry OS pub/sub system for swarm coordination
- **PTY**: Pseudo-terminal - Unix terminal emulation for process I/O
- **termios**: Unix terminal I/O control library for raw mode
- **WebSocket Bridge**: Server bridging PTY to WebSocket clients (port 8769)
- **gos-term**: Shell wrapper script for Python CLI module

## Out of Scope

- Session reconnection (`--session ID`)
- Environment variable injection (`-e KEY=VALUE`)
- JSON output mode (`--json`)
- Windows terminal support
- Multiple concurrent sessions per CLI instance
- Shell autocomplete integration
- Command history persistence

## Dependencies

- Python 3.12+
- `websockets` package (pip install websockets)
- Terminal WebSocket Bridge running on port 8769
- NEBBus (optional, for `--neb` flag)

## Success Criteria

1. All 5 plan tasks completed with passing tests
2. `gos-term echo "hello"` outputs "hello"
3. `gos-term -i` provides working interactive session
4. `gos-term --neb pwd` publishes to NEB
5. Test suite: `pytest systems/visual_shell/api/tests/test_gos_term_cli.py -v` passes

## Unresolved Questions

- Should `-e` environment vars override or append? (Deferred to future)
- Should interactive mode auto-enable NEB? (Decision: No, requires explicit `--neb`)
- Exit code detection from shell output? (Current: always returns 0 on no exception)

## Next Steps

1. Approve requirements
2. Implement Task 1: CLI entry point with argument parser
3. Implement Task 2: WebSocket command execution
4. Implement Task 3: Interactive mode
5. Implement Task 4: Shell wrapper script
6. Implement Task 5: Documentation
