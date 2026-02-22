---
spec: desktop-agent-service
phase: tasks
total_tasks: 28
created: 2026-02-22T00:30:00Z
---

# Tasks: Desktop Agent Service

## Execution Context

**Interview Decisions:**
- Testing depth: Standard - unit tests for safety paths, integration for Track Board and WebMCP
- Deployment: Standard CI/CD pipeline (tests pass -> merge to main)
- Priority: Ship fast - POC first, polish later
- Reliability: High required (safety-critical)
- macOS: Deferred to future phase
- Clipboard: Included (pyperclip)
- Multi-monitor: Included (coordinate mapping)

**Quality Commands** (from research.md):
- Lint: `make lint`
- Type check: `make check`
- Tests: `pytest systems/ai_gui/tests/` and `pytest tests/test_desktop_agent/`
- Local CI: `make format-check && make lint && make check`

---

## Phase 1: Make It Work (POC)

Focus: Validate unified desktop control works end-to-end via WebMCP. Skip tests, accept hardcoded values.

### 1.1 Package Structure

- [x] 1.1 Create systems/desktop_agent/ package structure
  - **Do**:
    1. Create directory: `mkdir -p systems/desktop_agent/backends systems/desktop_agent/safety`
    2. Create `systems/desktop_agent/__init__.py` with version and exports
    3. Create `systems/desktop_agent/backends/__init__.py`
    4. Create `systems/desktop_agent/safety/__init__.py`
  - **Files**:
    - `systems/desktop_agent/__init__.py`
    - `systems/desktop_agent/backends/__init__.py`
    - `systems/desktop_agent/safety/__init__.py`
  - **Done when**: `python3 -c "from systems.desktop_agent import __version__; print(__version__)"` succeeds
  - **Verify**: `python3 -c "from systems.desktop_agent import __version__"`
  - **Commit**: `feat(desktop-agent): create package structure`
  - _Requirements: FR-1, FR-4_

### 1.2 Extend BaseBackend Interface

- [x] 1.2 Extend BaseBackend with desktop control methods
  - **Do**:
    1. Open `systems/ai_gui/backends/base.py`
    2. Add abstract methods: `connect(config)`, `disconnect()`, `get_windows()`, `focus_window(window_id)`, `get_clipboard()`, `set_clipboard(text)`, `exec_command(cmd, timeout)`
    3. Add dataclasses: `ConnectionConfig`, `WindowInfo`, `CommandResult`
  - **Files**: `systems/ai_gui/backends/base.py`
  - **Done when**: `python3 -c "from systems.ai_gui.backends.base import BaseBackend; print('ok')"` succeeds with new methods
  - **Verify**: `python3 -c "from systems.ai_gui.backends.base import ConnectionConfig, WindowInfo, CommandResult; print('ok')"`
  - **Commit**: `feat(ai-gui): extend BaseBackend with desktop control methods`
  - _Requirements: FR-1, FR-10_
  - _Design: BaseBackend Extensions_

### 1.3 SafetySanitizer Implementation

- [ ] 1.3 Implement SafetySanitizer with blocked lists
  - **Do**:
    1. Create `systems/desktop_agent/safety/sanitizer.py`
    2. Define `BLOCKED_KEYS`, `BLOCKED_COMBOS`, `BLOCKED_COMMANDS` regex patterns
    3. Implement `validate_key_event(event)` returning ValidationResult
    4. Implement `validate_command(cmd)` returning ValidationResult
    5. Implement `is_blocked_combo(modifiers, key)` helper
  - **Files**: `systems/desktop_agent/safety/sanitizer.py`
  - **Done when**: Can import and use SafetySanitizer to block "rm -rf /" and Ctrl+Alt+Del
  - **Verify**: `python3 -c "from systems.desktop_agent.safety.sanitizer import SafetySanitizer; s=SafetySanitizer(); r=s.validate_command('rm -rf /'); assert not r.valid"`
  - **Commit**: `feat(desktop-agent): implement SafetySanitizer`
  - _Requirements: FR-5_
  - _Design: SafetySanitizer_

### 1.4 LocalBackend Core

- [ ] 1.4 Implement LocalBackend with X11/xdotool support
  - **Do**:
    1. Create `systems/desktop_agent/backends/local_backend.py`
    2. Implement `__init__` with display detection (`_detect_display_server`)
    3. Implement `connect()` using mss for screenshot validation
    4. Implement `disconnect()` (no-op for local)
    5. Implement `send_input()` using xdotool subprocess calls
    6. Implement `capture_frame()` using mss library
    7. Implement `get_windows()` using wmctrl
    8. Implement `focus_window()` using wmctrl
    9. Stub `get_clipboard()`, `set_clipboard()` for later
    10. Stub `exec_command()` for later (needs Track Board)
  - **Files**: `systems/desktop_agent/backends/local_backend.py`
  - **Done when**: Can connect to local display, capture screenshot, and list windows
  - **Verify**: `python3 -c "from systems.desktop_agent.backends.local_backend import LocalBackend; import asyncio; b=LocalBackend(); print(asyncio.run(b.connect(None)) or 'ok')"`
  - **Commit**: `feat(desktop-agent): implement LocalBackend with xdotool/mss`
  - _Requirements: FR-1_
  - _Design: LocalBackend_

### 1.5 TrackBoardClient Wrapper

- [ ] 1.5 Implement async TrackBoardClient wrapper
  - **Do**:
    1. Create `systems/desktop_agent/safety/track_client.py`
    2. Wrap `wordpress_zone/track_manager.py` TrackManager in async interface
    3. Implement `claim()`, `heartbeat()`, `release()` as async methods
    4. Implement `start_heartbeat_loop()` for background 5-min heartbeats
    5. Handle `WordPressUnavailableError` gracefully with local-only fallback
  - **Files**: `systems/desktop_agent/safety/track_client.py`
  - **Done when**: Can claim/release desktop-agent track via async interface
  - **Verify**: `python3 -c "from systems.desktop_agent.safety.track_client import TrackBoardClient; import asyncio; c=TrackBoardClient(); print(asyncio.run(c.claim()) or 'claimed')"`
  - **Commit**: `feat(desktop-agent): implement async TrackBoardClient`
  - _Requirements: FR-6_
  - _Design: TrackBoardClient_

### 1.6 SessionManager

- [ ] 1.6 Implement SessionManager for multi-session tracking
  - **Do**:
    1. Create `systems/desktop_agent/session_manager.py`
    2. Define `DesktopSession` dataclass with id, backend_type, backend, created_at, last_activity, track_claimed
    3. Implement `create(type, config)` - creates session, enforces max 5 sessions
    4. Implement `get(session_id)` - retrieve session
    5. Implement `list()` - list all sessions
    6. Implement `destroy(session_id)` - cleanup and release track
    7. Implement `cleanup_stale()` - remove sessions inactive >10 min
  - **Files**: `systems/desktop_agent/session_manager.py`
  - **Done when**: Can create, list, and destroy sessions with max limit enforcement
  - **Verify**: `python3 -c "from systems.desktop_agent.session_manager import SessionManager; m=SessionManager(); print('ok')"`
  - **Commit**: `feat(desktop-agent): implement SessionManager`
  - _Requirements: FR-8_
  - _Design: SessionManager_

### 1.7 DesktopAgentService Orchestrator

- [ ] 1.7 Implement DesktopAgentService main orchestrator
  - **Do**:
    1. Create `systems/desktop_agent/service.py`
    2. Implement `__init__` with SessionManager, SafetySanitizer, TrackBoardClient
    3. Implement `connect(type, config)` - creates session, claims track, connects backend
    4. Implement `disconnect(session_id)` - destroys session, releases track
    5. Implement `screenshot(session_id)` - delegate to backend
    6. Implement `input(session_id, event)` - validate via sanitizer, delegate to backend
    7. Implement `exec_command(session_id, cmd, timeout)` - validate via sanitizer, requires track
    8. Implement `get_clipboard(session_id)` and `set_clipboard(session_id, text)`
    9. Implement `list_windows(session_id)` and `focus_window(session_id, window_id)`
  - **Files**: `systems/desktop_agent/service.py`
  - **Done when**: Can connect, screenshot, and disconnect through service layer
  - **Verify**: `python3 -c "from systems.desktop_agent.service import DesktopAgentService; s=DesktopAgentService(); print('ok')"`
  - **Commit**: `feat(desktop-agent): implement DesktopAgentService orchestrator`
  - _Requirements: FR-1, FR-2, FR-4, FR-6, FR-9, FR-10_
  - _Design: DesktopAgentService_

### 1.8 WebMCP Tools - desktop_connect/disconnect

- [ ] 1.8 Add desktop_connect and desktop_disconnect WebMCP tools
  - **Do**:
    1. Open `systems/visual_shell/web/webmcp_bridge.js`
    2. Add `#registerDesktopConnect()` method with tool schema
    3. Add `#registerDesktopDisconnect()` method with tool schema
    4. Call these from existing registration flow
    5. Tools call Python backend via WebSocket to DesktopAgentService
  - **Files**: `systems/visual_shell/web/webmcp_bridge.js`
  - **Done when**: WebMCP tools visible in browser console: `window.geometryOSApp.webmcp.listTools().includes('desktop_connect')`
  - **Verify**: `grep -c "desktop_connect" systems/visual_shell/web/webmcp_bridge.js` returns > 0
  - **Commit**: `feat(webmcp): add desktop_connect and desktop_disconnect tools`
  - _Requirements: FR-4_
  - _Design: WebMCP Tools_

### 1.9 WebMCP Tools - desktop_screenshot/input/type/click

- [ ] 1.9 Add desktop control WebMCP tools (screenshot, input, type, click)
  - **Do**:
    1. Add `#registerDesktopScreenshot()` with rate limit 60/min
    2. Add `#registerDesktopInput()` with rate limit 100/min
    3. Add `#registerDesktopType()` with rate limit 30/min
    4. Add `#registerDesktopClick()` with rate limit 100/min
    5. Wire to DesktopAgentService via WebSocket
  - **Files**: `systems/visual_shell/web/webmcp_bridge.js`
  - **Done when**: All 4 tools registered and callable from WebMCP
  - **Verify**: `grep -c "desktop_screenshot\|desktop_input\|desktop_type\|desktop_click" systems/visual_shell/web/webmcp_bridge.js` returns >= 4
  - **Commit**: `feat(webmcp): add desktop control tools`
  - _Requirements: FR-4, FR-7_
  - _Design: WebMCP Tools_

### 1.10 WebMCP Tools - desktop_exec/clipboard/windows

- [ ] 1.10 Add desktop utility WebMCP tools (exec, clipboard, list_windows, focus_window)
  - **Do**:
    1. Add `#registerDesktopExec()` with rate limit 10/min, safety validation
    2. Add `#registerDesktopClipboard()` with rate limit 30/min
    3. Add `#registerDesktopListWindows()` with rate limit 30/min
    4. Add `#registerDesktopFocusWindow()` with rate limit 30/min
    5. Wire to DesktopAgentService via WebSocket
  - **Files**: `systems/visual_shell/web/webmcp_bridge.js`
  - **Done when**: All 10 desktop_* tools registered in WebMCP
  - **Verify**: `grep -c "name: 'desktop_" systems/visual_shell/web/webmcp_bridge.js` returns >= 10
  - **Commit**: `feat(webmcp): add desktop utility tools`
  - _Requirements: FR-4, FR-7_
  - _Design: WebMCP Tools_

### 1.11 WebSocket Bridge for Desktop Agent

- [ ] 1.11 Create WebSocket bridge for Desktop Agent Service
  - **Do**:
    1. Create `systems/desktop_agent/bridge.py` - WebSocket server on port 8770
    2. Handle tool requests: {"tool": "desktop_connect", "params": {...}}
    3. Route to DesktopAgentService methods
    4. Return JSON responses with {success, data, error, code}
    5. Integrate with existing Visual Bridge pattern from `systems/visual_shell/api/visual_bridge.py`
  - **Files**: `systems/desktop_agent/bridge.py`
  - **Done when**: Can curl the WebSocket endpoint and get valid response
  - **Verify**: `python3 -c "import socket; s=socket.socket(); s.settimeout(1); result=s.connect_ex(('localhost', 8770)); print('ok' if result==0 else 'not running')"`
  - **Commit**: `feat(desktop-agent): add WebSocket bridge`
  - _Requirements: FR-4_
  - _Design: DesktopAgentService_

### 1.12 V1 Quality Checkpoint

- [ ] V1 [VERIFY] Quality checkpoint: make lint && make check
  - **Do**: Run quality commands and verify all pass
  - **Verify**: `make lint && make check` exits 0
  - **Done when**: No lint errors, no type errors
  - **Commit**: `chore(desktop-agent): pass quality checkpoint V1` (only if fixes needed)

### 1.13 POC Checkpoint

- [ ] 1.13 POC Checkpoint - End-to-end validation
  - **Do**:
    1. Start Desktop Agent Bridge: `python3 systems/desktop_agent/bridge.py &`
    2. Open browser to Visual Shell
    3. Execute `desktop_connect({type: "local"})` via WebMCP
    4. Execute `desktop_screenshot()` and verify base64 image returned
    5. Execute `desktop_input({type: "click", x: 100, y: 100})`
    6. Execute `desktop_disconnect()`
  - **Done when**: Full connect -> screenshot -> input -> disconnect cycle works
  - **Verify**: `curl -s http://localhost:8770/health | grep -q "ok"`
  - **Commit**: `feat(desktop-agent): complete POC`

---

## Phase 2: Refactoring

Clean up code structure, add error handling, improve modularity.

### 2.1 Extend VNCBackend

- [ ] 2.1 Extend VNCBackend with connect() and exec_command()
  - **Do**:
    1. Open `systems/ai_gui/backends/vnc_backend.py`
    2. Add `connect(config: VNCConnectionConfig)` for connecting to existing VNC servers
    3. Add `exec_command(cmd, timeout)` using SSH to VNC host or QEMU guest agent
    4. Add `get_clipboard()` and `set_clipboard()` stubs (VNC clipboard is complex)
    5. Add `get_windows()` and `focus_window()` stubs (remote limitations)
  - **Files**: `systems/ai_gui/backends/vnc_backend.py`
  - **Done when**: VNCBackend passes all new BaseBackend abstract methods
  - **Verify**: `python3 -c "from systems.ai_gui.backends.vnc_backend import VNCBackend; print('ok')"`
  - **Commit**: `feat(vnc-backend): add connect and exec_command methods`
  - _Requirements: FR-2_
  - _Design: VNCBackend (Extended)_

### 2.2 Clipboard Integration

- [ ] 2.2 Implement clipboard support via pyperclip
  - **Do**:
    1. Add `pyperclip` to requirements
    2. Implement `LocalBackend.get_clipboard()` using `pyperclip.paste()`
    3. Implement `LocalBackend.set_clipboard(text)` using `pyperclip.copy(text)`
    4. Handle Unicode text correctly
    5. Return error for non-text clipboard content
  - **Files**: `systems/desktop_agent/backends/local_backend.py`
  - **Done when**: Can get/set clipboard text through LocalBackend
  - **Verify**: `python3 -c "import pyperclip; pyperclip.copy('test'); print(pyperclip.paste())"`
  - **Commit**: `feat(desktop-agent): add clipboard support`
  - _Requirements: FR-11_
  - _Design: LocalBackend_

### 2.3 Command Execution with Safety

- [ ] 2.3 Implement command execution with timeout and Track Board
  - **Do**:
    1. Implement `LocalBackend.exec_command(cmd, timeout)` using asyncio subprocess
    2. Enforce timeout with `asyncio.wait_for()`
    3. Kill process on timeout
    4. Wire SafetySanitizer to validate command before execution
    5. Require Track Board claim for exec operations
  - **Files**: `systems/desktop_agent/backends/local_backend.py`, `systems/desktop_agent/service.py`
  - **Done when**: Can execute "ls -la" and get stdout, blocked commands rejected
  - **Verify**: `python3 -c "from systems.desktop_agent.backends.local_backend import LocalBackend; import asyncio; b=LocalBackend(); r=asyncio.run(b.exec_command('echo test', 5)); print(r.stdout.strip())"`
  - **Commit**: `feat(desktop-agent): add command execution with safety`
  - _Requirements: FR-5, FR-14_
  - _Design: SafetySanitizer, TrackBoardClient_

### 2.4 Error Handling Standardization

- [ ] 2.4 Standardize error responses with error codes
  - **Do**:
    1. Create `systems/desktop_agent/errors.py` with error code enum
    2. Define error codes: TRACK_CONFLICT, RATE_LIMIT, BLOCKED_INPUT, BLOCKED_COMMAND, SESSION_NOT_FOUND, BACKEND_ERROR, WORDPRESS_UNAVAILABLE, WAYLAND_LIMITED, COMMAND_TIMEOUT
    3. Create `DesktopAgentError` exception class
    4. Update all service methods to return structured errors
  - **Files**: `systems/desktop_agent/errors.py`, `systems/desktop_agent/service.py`
  - **Done when**: All error responses include {success: false, error: string, code: string}
  - **Verify**: `python3 -c "from systems.desktop_agent.errors import DesktopAgentError, ErrorCode; print('ok')"`
  - **Commit**: `feat(desktop-agent): standardize error responses`
  - _Requirements: FR-10_
  - _Design: Error Handling_

### 2.5 V2 Quality Checkpoint

- [ ] V2 [VERIFY] Quality checkpoint: make lint && make check
  - **Do**: Run quality commands and verify all pass
  - **Verify**: `make lint && make check` exits 0
  - **Done when**: No lint errors, no type errors
  - **Commit**: `chore(desktop-agent): pass quality checkpoint V2` (only if fixes needed)

---

## Phase 3: Testing

Add unit tests for safety-critical paths, integration tests for Track Board and WebMCP.

### 3.1 SafetySanitizer Unit Tests

- [ ] 3.1 Unit tests for SafetySanitizer
  - **Do**:
    1. Create `tests/test_desktop_agent/__init__.py`
    2. Create `tests/test_desktop_agent/test_sanitizer.py`
    3. Test BLOCKED_KEYS rejection (SysRq)
    4. Test BLOCKED_COMBOS rejection (Ctrl+Alt+Del, Ctrl+Alt+Backspace)
    5. Test BLOCKED_COMMANDS rejection (rm -rf /, mkfs, dd if=, shutdown)
    6. Test valid input/command acceptance
    7. Target >80% coverage on sanitizer module
  - **Files**: `tests/test_desktop_agent/__init__.py`, `tests/test_desktop_agent/test_sanitizer.py`
  - **Done when**: `pytest tests/test_desktop_agent/test_sanitizer.py -v` passes all tests
  - **Verify**: `pytest tests/test_desktop_agent/test_sanitizer.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add SafetySanitizer unit tests`
  - _Requirements: FR-5, NFR-11_
  - _Design: Test Strategy_

### 3.2 SessionManager Unit Tests

- [ ] 3.2 Unit tests for SessionManager
  - **Do**:
    1. Create `tests/test_desktop_agent/test_session_manager.py`
    2. Test session creation with mock backend
    3. Test max sessions limit (5 max)
    4. Test session destroy and cleanup
    5. Test stale session cleanup (>10 min inactivity)
    6. Test session list and get operations
  - **Files**: `tests/test_desktop_agent/test_session_manager.py`
  - **Done when**: `pytest tests/test_desktop_agent/test_session_manager.py -v` passes all tests
  - **Verify**: `pytest tests/test_desktop_agent/test_session_manager.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add SessionManager unit tests`
  - _Requirements: FR-8_
  - _Design: Test Strategy_

### 3.3 LocalBackend Unit Tests

- [ ] 3.3 Unit tests for LocalBackend
  - **Do**:
    1. Create `tests/test_desktop_agent/test_local_backend.py`
    2. Mock xdotool, mss, wmctrl subprocess calls
    3. Test connect/disconnect flow
    4. Test send_input with various event types
    5. Test capture_frame returns PNG bytes
    6. Test get_windows returns window list
    7. Test exec_command with timeout
  - **Files**: `tests/test_desktop_agent/test_local_backend.py`
  - **Done when**: `pytest tests/test_desktop_agent/test_local_backend.py -v` passes all tests
  - **Verify**: `pytest tests/test_desktop_agent/test_local_backend.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add LocalBackend unit tests`
  - _Requirements: FR-1_
  - _Design: Test Strategy_

### 3.4 TrackBoardClient Unit Tests

- [ ] 3.4 Unit tests for TrackBoardClient
  - **Do**:
    1. Create `tests/test_desktop_agent/test_track_client.py`
    2. Mock TrackManager responses
    3. Test claim/release flow
    4. Test heartbeat loop
    5. Test WordPress unavailable fallback
    6. Test conflict detection
  - **Files**: `tests/test_desktop_agent/test_track_client.py`
  - **Done when**: `pytest tests/test_desktop_agent/test_track_client.py -v` passes all tests
  - **Verify**: `pytest tests/test_desktop_agent/test_track_client.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add TrackBoardClient unit tests`
  - _Requirements: FR-6_
  - _Design: Test Strategy_

### 3.5 DesktopAgentService Integration Tests

- [ ] 3.5 Integration tests for DesktopAgentService
  - **Do**:
    1. Create `tests/test_desktop_agent/test_service_integration.py`
    2. Test full connect -> input -> screenshot -> disconnect cycle
    3. Test blocked input rejection (Ctrl+Alt+Del)
    4. Test blocked command rejection (rm -rf /)
    5. Test Track Board claim on connect
    6. Test multi-session conflict detection
  - **Files**: `tests/test_desktop_agent/test_service_integration.py`
  - **Done when**: `pytest tests/test_desktop_agent/test_service_integration.py -v` passes all tests
  - **Verify**: `pytest tests/test_desktop_agent/test_service_integration.py -v --tb=short`
  - **Commit**: `test(desktop-agent): add DesktopAgentService integration tests`
  - _Requirements: FR-4, FR-5, FR-6_
  - _Design: Test Strategy_

### 3.6 V3 Quality Checkpoint

- [ ] V3 [VERIFY] Quality checkpoint: make lint && make check && pytest tests/test_desktop_agent/
  - **Do**: Run quality commands and all desktop agent tests
  - **Verify**: `make lint && make check && pytest tests/test_desktop_agent/ -v` exits 0
  - **Done when**: No lint errors, no type errors, all tests pass
  - **Commit**: `chore(desktop-agent): pass quality checkpoint V3` (only if fixes needed)

---

## Phase 4: Quality Gates

Final verification, documentation, and CI integration.

### 4.1 Local Quality Check

- [ ] 4.1 Local quality check - full CI suite
  - **Do**: Run ALL quality checks locally
  - **Verify**: All commands must pass:
    - Format check: `make format-check`
    - Lint: `make lint`
    - Type check: `make check`
    - Tests: `pytest tests/test_desktop_agent/ -v --cov=systems/desktop_agent --cov-report=term-missing`
  - **Done when**: All commands pass with no errors, coverage >80%
  - **Commit**: `fix(desktop-agent): address lint/type issues` (if fixes needed)

### 4.2 Create PR and Verify CI

- [ ] 4.2 Create PR and verify CI passes
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current | grep -v main`
    2. Push branch: `git push -u origin feat/ai-skills-system` (or current branch)
    3. Create PR: `gh pr create --title "feat(desktop-agent): unified desktop control service" --body "$(cat <<'EOF'
## Summary
- Unified Desktop Agent Service for AI-controlled desktop access
- 10 WebMCP tools: connect, disconnect, screenshot, input, type, click, exec, clipboard, list_windows, focus_window
- Safety integration via Track Board and SafetySanitizer
- LocalBackend with xdotool/mss for Linux X11 control

## Test Plan
- [ ] Run `pytest tests/test_desktop_agent/ -v` - all tests pass
- [ ] Run `make lint && make check` - no errors
- [ ] Manual: Connect to local desktop via Visual Shell, take screenshot

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
    4. Verify CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks green, PR ready for review
  - **Commit**: None

---

## Phase 5: PR Lifecycle

Continuous PR validation until all completion criteria met.

### 5.1 CI Monitoring and Fixing

- [ ] 5.1 Monitor CI and fix any failures
  - **Do**:
    1. Check CI status: `gh pr checks`
    2. If any check fails, read failure details
    3. Fix issues locally
    4. Push fixes: `git push`
    5. Re-verify: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks passing
  - **Commit**: `fix(desktop-agent): resolve CI failures` (if needed)

### 5.2 Code Review Resolution

- [ ] 5.2 Address code review comments
  - **Do**:
    1. Check for review comments: `gh pr view --comments`
    2. Address each comment with code changes or replies
    3. Push fixes or mark conversations resolved
  - **Verify**: All review comments addressed
  - **Done when**: No unresolved review comments
  - **Commit**: `fix(desktop-agent): address review feedback` (if needed)

### 5.3 Final Validation

- [ ] V4 [VERIFY] Final validation - full local CI
  - **Do**: Run complete local CI suite including all tests
  - **Verify**:
    - `make format-check && make lint && make check` exits 0
    - `pytest tests/test_desktop_agent/ -v` exits 0
    - `pytest systems/ai_gui/tests/ -v` exits 0 (no regressions)
  - **Done when**: Build succeeds, all tests pass, no regressions
  - **Commit**: None

### 5.4 AC Checklist Verification

- [ ] V5 [VERIFY] Verify all acceptance criteria met
  - **Do**: Programmatically verify each P0 acceptance criteria:
    - AC-1.1: `grep -r "desktop_connect" systems/visual_shell/web/webmcp_bridge.js`
    - AC-2.4: `grep -r "BLOCKED_COMBOS" systems/desktop_agent/safety/sanitizer.py`
    - AC-4.2: `grep -r "BLOCKED_COMMANDS" systems/desktop_agent/safety/sanitizer.py`
    - AC-7.1: `grep -r "claim" systems/desktop_agent/service.py`
  - **Verify**: All grep commands find matches
  - **Done when**: All P0 acceptance criteria confirmed via code inspection
  - **Commit**: None

---

## Unresolved Questions

1. **RDP implementation timing**: P1 scope - skeleton not included in P0
2. **Session recording storage**: Deferred to P1 enhancement
3. **Emergency stop mechanism**: Not implemented in P0 - future work

## Notes

**POC shortcuts taken:**
- Wayland support limited (xdotool primary)
- VNC clipboard stubbed (complex protocol)
- RDP backend deferred to P1
- Session state in-memory only
- No session recording/audit

**Production TODOs (P1/P2):**
- RDPBackend for Windows remote control
- Full Wayland support via ydotool/grim
- VNC clipboard integration
- Session persistence (Redis/file)
- Session recording with playback
- macOS support via pyobjc
- Multi-monitor coordinate mapping refinement
