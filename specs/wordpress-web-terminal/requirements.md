---
spec: wordpress-web-terminal
phase: requirements
created: 2026-02-22T12:00:00Z
generated: auto
---

# Requirements: WordPress Web Terminal

## Summary

Web-based terminal (xterm.js) in WordPress admin connecting to Geometry OS shell sessions via WebSocket through existing Visual Bridge infrastructure.

## User Stories

### US-1: Admin Terminal Access

As a WordPress administrator, I want to access a terminal from the admin dashboard so that I can execute shell commands without SSH.

**Acceptance Criteria**:
- AC-1.1: Terminal page accessible via "GO Terminal" menu item
- AC-1.2: Terminal renders with 120x36 default dimensions
- AC-1.3: Connection status indicator shows connected/disconnected state
- AC-1.4: Only users with `manage_options` capability can access

### US-2: Real-Time Shell Interaction

As an administrator, I want bidirectional terminal I/O so that I can interact with the shell in real-time.

**Acceptance Criteria**:
- AC-2.1: Keystrokes sent to shell within 50ms
- AC-2.2: Shell output appears in terminal within 100ms
- AC-2.3: ANSI escape sequences rendered correctly (colors, cursor movement)
- AC-2.4: Terminal auto-resizes on window resize

### US-3: Session Management

As an administrator, I want secure session tokens so that my terminal session is authenticated.

**Acceptance Criteria**:
- AC-3.1: Session token generated from WordPress user ID + nonce
- AC-3.2: Token validated on WebSocket connection
- AC-3.3: PTY process spawned per session, isolated from other sessions
- AC-3.4: Session cleaned up on WebSocket close

### US-4: Error Handling

As an administrator, I want clear error messages so that I can troubleshoot connection issues.

**Acceptance Criteria**:
- AC-4.1: "Visual Bridge not running" warning on activation if port 8768 unavailable
- AC-4.2: Connection lost message with auto-reconnect attempt
- AC-4.3: Error output displayed in red in terminal

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | WordPress admin page with xterm.js terminal | Must | US-1 |
| FR-2 | WebSocket connection to Visual Bridge (port 8768) | Must | US-2 |
| FR-3 | PTY process spawning per session | Must | US-3 |
| FR-4 | Session token authentication | Must | US-3 |
| FR-5 | Bidirectional input/output streaming | Must | US-2 |
| FR-6 | Terminal auto-resize with xterm-addon-fit | Should | US-2 |
| FR-7 | Connection status indicator | Should | US-1 |
| FR-8 | Auto-reconnect on disconnect | Should | US-4 |
| FR-9 | Geometry OS themed terminal colors | Should | US-1 |
| FR-10 | REST API endpoints for session management | Should | US-3 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Input latency < 50ms | Performance |
| NFR-2 | Output latency < 100ms | Performance |
| NFR-3 | Terminal scrollback 5000 lines | Usability |
| NFR-4 | Admin-only access enforced | Security |
| NFR-5 | PTY processes isolated per user | Security |

## Out of Scope

- Multi-tab session synchronization
- Persistent session state across browser restarts
- Custom shell selection (uses $SHELL env var)
- Terminal recording/playback

## Dependencies

- Visual Bridge running on port 8768
- WordPress 6.0+
- PHP 8.0+
- Modern browser with WebSocket support
