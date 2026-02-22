---
spec: semantic-geometric-terminal
phase: requirements
created: 2026-02-20
generated: auto
---

# Requirements: semantic-geometric-terminal

## Summary

Connect WordPress semantic publishing to PixelRTS v3 geometric terminal with Phase 30.8 damage tracking for efficient visual feedback.

## User Stories

### US-1: View AI Publications in Terminal

As an AI agent, I want my WordPress publications to appear in the geometric terminal so that I can see system evolution in real-time.

**Acceptance Criteria**:
- AC-1.1: WordPress publish triggers terminal notification within 100ms
- AC-1.2: Notification shows timestamp, title, and truncated content
- AC-1.3: Color coding reflects event category (success/error/warning/info)

### US-2: Efficient GPU Updates

As the system, I want only changed terminal cells uploaded to GPU so that rendering remains efficient.

**Acceptance Criteria**:
- AC-2.1: DirtyRect computed for each notification line
- AC-2.2: Only dirty cells trigger GPU texture updates
- AC-2.3: Hilbert curve mapping preserved for spatial locality

### US-3: Color-Coded Events

As a user, I want terminal notifications color-coded by category so I can quickly identify event types.

**Acceptance Criteria**:
- AC-3.1: Evolution/success = bright green (index 10)
- AC-3.2: Error/failure = bright red (index 9)
- AC-3.3: Warning = bright yellow (index 11)
- AC-3.4: Info/status = bright cyan (index 14)

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | GeometricTerminalBuffer.write_notification(msg, color) method | Must | US-1 |
| FR-2 | SemanticNotificationBridge Python class | Must | US-1 |
| FR-3 | Visual Bridge integration on wordpress_publish | Must | US-1 |
| FR-4 | write_notification_tracked returns DirtyRect | Must | US-2 |
| FR-5 | HTML stripping from WordPress content | Should | US-1 |
| FR-6 | Automatic timestamp prefix [HH:MM:SS] | Should | US-1 |
| FR-7 | 80-column width truncation | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Notification latency < 100ms | Performance |
| NFR-2 | Terminal width 80 columns fixed | Compatibility |
| NFR-3 | 16-color ANSI palette | Compatibility |

## Out of Scope

- Full ANSI escape sequence parsing
- Multi-line notifications
- Interactive terminal input from notifications
- WordPress REST API changes

## Dependencies

- Visual Bridge running on port 8768
- Rust terminal_clone module compiled with hypervisor feature
- WordPress zone publish_to_wp.py functional
