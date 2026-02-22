---
spec: desktop-agent-testing
phase: research
created: 2026-02-22T00:00:00Z
generated: auto
---

# Research: Desktop Agent Testing Suite

## Executive Summary

Desktop Agent Service already implemented at `systems/desktop_agent/`. Need comprehensive test suite covering 5 components: SafetySanitizer (P0 critical), SessionManager, LocalBackend, TrackBoardClient, DesktopAgentService. Target: 100+ tests, 80%+ coverage. Tech stack: pytest, pytest-asyncio, unittest.mock, pytest-cov, pytest-benchmark.

## Codebase Analysis

### Existing Implementation

| Component | File | Lines | Key Methods |
|-----------|------|-------|-------------|
| SafetySanitizer | `safety/sanitizer.py` | 119 | validate_key_event, validate_command, is_blocked_combo |
| SessionManager | `session_manager.py` | 138 | create, get, destroy, list, cleanup_stale |
| LocalBackend | `backends/local_backend.py` | 263 | connect, send_input, capture_frame, get_windows, exec_command |
| TrackBoardClient | `safety/track_client.py` | 135 | claim, release, heartbeat, start_heartbeat_loop |
| DesktopAgentService | `service.py` | 240 | connect, disconnect, screenshot, send_input, exec_command |
| ErrorCode | `errors.py` | 42 | 16 error codes defined |

### Blocked Operations (Safety Critical)

**Key Combinations:**
- Ctrl+Alt+Delete (system interrupt)
- Ctrl+Alt+Backspace (kill X)
- Ctrl+Alt+F[1-9] (VT switch)
- Alt+SysRq (magic sysrq)

**Commands (regex patterns):**
- `rm -rf /` variants
- mkfs, dd if=, shutdown, reboot, poweroff
- init 0, init 6
- chmod 777 /, chown root /

### Dependencies

- `systems/ai_gui/backends/base.py` - BaseBackend, InputEvent, InputEventType, WindowInfo, CommandResult
- `wordpress_zone/track_manager.py` - TrackManager, WordPressUnavailableError
- External tools: xdotool, wmctrl, mss, pyperclip

### Test Patterns in Codebase

- `tests/test_directive_agent.py` - Uses pytest + unittest.mock + AsyncMock
- `tests/verification_wp_integration.js` - Integration test patterns
- Existing conftest patterns in `tests/conftest.py` (if exists)

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Implementation complete, just needs tests |
| Effort Estimate | M | ~100 tests across 6 files |
| Risk Level | Low | Mock external deps for reliability |

## Testing Strategy

### Unit Tests (85 tests)
1. **SafetySanitizer** (25 tests) - P0 critical, 100% coverage required
2. **SessionManager** (15 tests) - Session lifecycle, limits, cleanup
3. **LocalBackend** (20 tests) - Mock xdotool/wmctrl/mss
4. **TrackBoardClient** (15 tests) - Mock TrackManager, WordPress unavailable fallback

### Integration Tests (15 tests)
5. **DesktopAgentService** (15 tests) - Full flow with mock backends

### Performance Tests (6 benchmarks)
6. **Latency validation** - NFR targets: <1ms validation, <10ms session creation

## Recommendations

1. Start with SafetySanitizer (P0) - critical safety validation
2. Mock all subprocess calls (xdotool, wmctrl) for reliable tests
3. Mock TrackManager to avoid WordPress dependency
4. Use pytest-asyncio for async method testing
5. Create shared fixtures in conftest_desktop_agent.py
