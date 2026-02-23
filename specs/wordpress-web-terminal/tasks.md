---
spec: wordpress-web-terminal
phase: tasks
total_tasks: 6
created: 2026-02-22T12:00:00Z
generated: auto
---

# Tasks: WordPress Web Terminal

## Phase 1: Make It Work (POC)

Focus: Validate the idea works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create WordPress plugin structure
  - **Do**: Create plugin directory, main PHP file with GeometryOS_WebTerminal class, assets/css/terminal.css, assets/js/terminal.js. Follow ASCII_Desktop_Control pattern.
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/geometry-os-web-terminal.php`, `assets/css/terminal.css`, `assets/js/terminal.js`
  - **Done when**: Plugin appears in WordPress admin plugin list, "GO Terminal" menu item visible
  - **Verify**: `ls wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/` shows 3 files
  - **Commit**: `feat(terminal): add WordPress web terminal plugin with xterm.js`
  - _Requirements: FR-1, FR-9_
  - _Design: Component A, Component B_

- [x] 1.2 Extend Visual Bridge for terminal WebSocket
  - **Do**: Add terminal session tracking (`_terminal_sessions` dict), handle `input`/`resize` message types, add PTY spawn method using `pty.openpty()` + `os.fork()`, add HTTP endpoints for session creation/deletion
  - **Files**: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: Visual Bridge accepts `/terminal?token=xxx` connections, spawns PTY
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('Import OK')"`
  - **Commit**: `feat(bridge): add terminal WebSocket support to Visual Bridge`
  - _Requirements: FR-2, FR-3, FR-5_
  - _Design: Component C_

- [x] 1.3 Connect xterm.js to Visual Bridge
  - **Do**: In terminal.js, create WebSocket connection to `ws://localhost:8768/terminal?token=<token>`, send `input` messages on keypress, receive `output` messages and write to terminal, handle `resize` events
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/assets/js/terminal.js`
  - **Done when**: Terminal displays shell output, responds to keyboard input
  - **Verify**: Open browser console, see WebSocket connected, type `ls` and see output
  - **Commit**: `feat(terminal): connect xterm.js to Visual Bridge WebSocket`
  - _Requirements: FR-2, FR-5_
  - _Design: Component B_

- [x] 1.4 POC Checkpoint
  - **Do**: Start Visual Bridge, activate plugin, access terminal in WordPress admin, verify bidirectional I/O
  - **Done when**: Can execute `echo "Hello from Geometry OS Web Terminal"` and see output
  - **Verify**: Manual test of core flow
  - **Commit**: `feat(terminal): complete POC checkpoint`

## Phase 2: Refactoring

After POC validated, clean up code.

- [x] 2.1 Extract session token generation
  - **Do**: Move token generation to dedicated method, add proper nonce verification, ensure 64-char hex output
  - **Files**: `geometry-os-web-terminal.php`
  - **Done when**: Token generation follows WordPress security patterns
  - **Verify**: Token is 64 chars, varies by user
  - **Commit**: `refactor(terminal): improve session token security`
  - _Design: Security Considerations_

- [x] 2.2 Add error handling and status indicators
  - **Do**: Add connection status dot (green/red), handle WebSocket errors with auto-reconnect, display error messages in terminal
  - **Files**: `assets/js/terminal.js`, `assets/css/terminal.css`
  - **Done when**: Status bar shows connected/disconnected, errors display in red
  - **Verify**: Kill Visual Bridge, see "Disconnected" status and reconnect attempt
  - **Commit**: `refactor(terminal): add error handling and status indicators`
  - _Requirements: AC-1.3, AC-4.2, AC-4.3_

## Phase 3: Testing

- [x] 3.1 Add WordPress plugin unit tests
  - **Do**: Create test file with Test_GeometryOS_WebTerminal class, test plugin activation, session token generation, permission checks
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/tests/test-plugin.php`
  - **Done when**: Tests cover main plugin functionality
  - **Verify**: `cd wordpress_zone/wordpress && php vendor/bin/phpunit wp-content/plugins/geometry-os-web-terminal/tests/`
  - **Commit**: `test(terminal): add WordPress plugin unit tests`
  - _Requirements: AC-3.1_

- [x] 3.2 Add Python integration tests
  - **Do**: Create async test file with WebSocket connection tests, verify terminal spawn, input/output flow
  - **Files**: `systems/visual_shell/api/tests/test_terminal_bridge.py`
  - **Done when**: Tests pass when Visual Bridge running, skip gracefully when not
  - **Verify**: `python -m pytest systems/visual_shell/api/tests/test_terminal_bridge.py -v`
  - **Commit**: `test(terminal): add WebSocket integration tests`
  - _Requirements: FR-2, FR-5_

## Phase 4: Quality Gates

- [x] 4.1 Local quality check
  - **Do**: Run all quality checks locally (PHP lint, Python import, manual terminal test)
  - **Verify**: All commands pass, terminal works in browser
  - **Done when**: No errors
  - **Commit**: `fix(terminal): address lint/type issues` (if needed)

- [ ] 4.2 Add documentation and create PR
  - **Do**: Create README.md with installation, usage, architecture, troubleshooting. Create PR with description.
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-os-web-terminal/README.md`
  - **Verify**: README renders correctly, PR created with `gh pr create`
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: PTY uses Python stdlib instead of Rust API, session token simplified
- **Production TODOs**: Consider Rust API integration for production PTY, add persistent session state
