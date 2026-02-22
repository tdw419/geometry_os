---
spec: desktop-agent-testing
phase: requirements
created: 2026-02-22T00:00:00Z
generated: auto
---

# Requirements: Desktop Agent Testing Suite

## Summary

Comprehensive test suite for Desktop Agent Service proving safety, correctness, and performance. 100+ tests with 80%+ code coverage across all components.

## User Stories

### US-1: Safety Validation (P0)
As a **system operator**, I want **dangerous operations always blocked** so that **the system remains secure**.

**Acceptance Criteria**:
- AC-1.1: Ctrl+Alt+Delete always rejected with BLOCKED_COMBO code
- AC-1.2: `rm -rf /` always rejected with BLOCKED_COMMAND code
- AC-1.3: All 4 blocked key combos tested
- AC-1.4: All 10 blocked command patterns tested
- AC-1.5: Safe operations allowed through
- AC-1.6: Case-insensitive command blocking

### US-2: Session Management
As a **developer**, I want **session lifecycle tested** so that **resource leaks are prevented**.

**Acceptance Criteria**:
- AC-2.1: Sessions created with unique IDs
- AC-2.2: Max 5 sessions enforced with RuntimeError
- AC-2.3: Session retrieval updates activity timestamp
- AC-2.4: Stale sessions (>10min) cleaned up
- AC-2.5: Destroy calls backend.disconnect()

### US-3: Backend Operations
As a **developer**, I want **LocalBackend mocked** so that **tests run without X11/tools**.

**Acceptance Criteria**:
- AC-3.1: Mouse/keyboard input sent via mocked xdotool
- AC-3.2: Screenshots via mocked mss
- AC-3.3: Window listing via mocked wmctrl
- AC-3.4: Command execution with timeout handling
- AC-3.5: Wayland detection works

### US-4: Track Coordination
As a **system operator**, I want **WordPress unavailable fallback tested** so that **local-only mode works**.

**Acceptance Criteria**:
- AC-4.1: Claim succeeds when WordPress unavailable
- AC-4.2: Heartbeat loop starts/stops correctly
- AC-4.3: Release cleans up heartbeat task

### US-5: Service Integration
As a **developer**, I want **full service flow tested** so that **end-to-end works**.

**Acceptance Criteria**:
- AC-5.1: Connect creates session and claims track
- AC-5.2: Screenshot returns base64 image
- AC-5.3: Send_input validates via sanitizer
- AC-5.4: Exec_command validates via sanitizer
- AC-5.5: List_windows returns window list

### US-6: Performance Validation
As a **system operator**, I want **latency targets verified** so that **NFRs are met**.

**Acceptance Criteria**:
- AC-6.1: Key validation < 1ms
- AC-6.2: Command validation < 1ms
- AC-6.3: Session creation < 10ms

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | SafetySanitizer blocks Ctrl+Alt+Delete | Must | US-1 |
| FR-2 | SafetySanitizer blocks rm -rf / | Must | US-1 |
| FR-3 | SafetySanitizer allows safe keys | Must | US-1 |
| FR-4 | SafetySanitizer case-insensitive commands | Must | US-1 |
| FR-5 | SessionManager creates unique sessions | Must | US-2 |
| FR-6 | SessionManager enforces max 5 sessions | Must | US-2 |
| FR-7 | SessionManager cleans stale sessions | Must | US-2 |
| FR-8 | LocalBackend mouse input mocked | Should | US-3 |
| FR-9 | LocalBackend key input mocked | Should | US-3 |
| FR-10 | LocalBackend screenshot mocked | Should | US-3 |
| FR-11 | LocalBackend window list mocked | Should | US-3 |
| FR-12 | LocalBackend command execution mocked | Should | US-3 |
| FR-13 | TrackBoardClient fallback on WP unavailable | Must | US-4 |
| FR-14 | TrackBoardClient heartbeat loop | Should | US-4 |
| FR-15 | DesktopAgentService connect flow | Must | US-5 |
| FR-16 | DesktopAgentService screenshot flow | Must | US-5 |
| FR-17 | DesktopAgentService input validation | Must | US-5 |
| FR-18 | DesktopAgentService command validation | Must | US-5 |
| FR-19 | Key validation latency < 1ms | Must | US-6 |
| FR-20 | Command validation latency < 1ms | Must | US-6 |
| FR-21 | Session creation latency < 10ms | Must | US-6 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | 80%+ code coverage | Quality |
| NFR-2 | All tests complete in < 30s | Performance |
| NFR-3 | No external dependencies in tests | Reliability |
| NFR-4 | Quality gate script for CI | DevOps |

## Out of Scope

- Real X11/Wayland integration tests (require display)
- WordPress server integration tests
- VNC/RDP backend tests (not implemented)
- Load/stress tests

## Dependencies

- pytest, pytest-asyncio, pytest-cov, pytest-benchmark
- unittest.mock (standard library)
- mss, xdotool, wmctrl (mocked in tests)
