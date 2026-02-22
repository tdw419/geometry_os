---
spec: semantic-geometric-terminal
phase: tasks
total_tasks: 7
created: 2026-02-20
generated: auto
---

# Tasks: semantic-geometric-terminal

## Phase 1: Make It Work (POC)

Focus: Validate WordPress to terminal flow works end-to-end.

- [ ] 1.1 Add write_notification method to GeometricTerminalBuffer
  - **Do**: Add `write_notification(msg, fg_color)` and `write_notification_with_time(msg, timestamp, fg_color)` methods to GeometricTerminalBuffer impl. Include `get_timestamp()` helper.
  - **Files**: `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs`
  - **Done when**: Methods exist, format `[HH:MM:SS] Message` with timestamp in dim gray (8) and message in specified color with bold.
  - **Verify**: `cd systems/infinite_map_rs && cargo test --features hypervisor test_write_notification --no-fail-fast`
  - **Commit**: `feat(geometric-terminal): add write_notification for semantic events`
  - _Requirements: FR-1, FR-6_
  - _Design: GeometricTerminalBuffer.write_notification_

- [ ] 1.2 Create SemanticNotificationBridge Python class
  - **Do**: Create `NotificationEvent` dataclass with auto-color assignment and `SemanticNotificationBridge` class with `format_for_terminal()` and `to_terminal_opcode()` methods. Include HTML stripping.
  - **Files**: `systems/visual_shell/api/semantic_notification_bridge.py`
  - **Done when**: Class formats events to 80-char terminal lines with correct color coding.
  - **Verify**: `python3 tests/test_semantic_notification_bridge.py`
  - **Commit**: `feat(semantic-bridge): add WordPress to terminal notification bridge`
  - _Requirements: FR-2, FR-5, FR-7, AC-3.1-3.4_
  - _Design: SemanticNotificationBridge_

- [ ] 1.3 Connect Visual Bridge to Semantic Notifications
  - **Do**: Import SemanticNotificationBridge in visual_bridge.py, initialize in `__init__`, enhance wordpress_publish handler to create NotificationEvent and broadcast terminal_notification opcode.
  - **Files**: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: WordPress publish events trigger both browser broadcast and terminal notification.
  - **Verify**: `python3 -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('Import OK')"`
  - **Commit**: `feat(visual-bridge): connect WordPress to geometric terminal notifications`
  - _Requirements: FR-3_
  - _Design: Data Flow steps 3-5_

- [ ] 1.4 POC Checkpoint
  - **Do**: Run unit tests and verify import chain works.
  - **Done when**: All Python imports succeed, tests pass.
  - **Verify**: `python3 tests/test_semantic_notification_bridge.py && python3 -c "from systems.visual_shell.api.semantic_notification_bridge import SemanticNotificationBridge; print('OK')"`
  - **Commit**: `feat(semantic-terminal): complete POC`

## Phase 2: Refactoring

- [ ] 2.1 Add Rust terminal notification handler
  - **Do**: Add `TerminalNotification { text, color, flags }` to VisualCommand enum in glass_ram/bridge.rs. Add handler in app.rs WebSocket message processing section.
  - **Files**: `systems/infinite_map_rs/src/glass_ram/bridge.rs`, `systems/infinite_map_rs/src/app.rs`
  - **Done when**: Rust app compiles and handles terminal_notification WebSocket messages.
  - **Verify**: `cd systems/infinite_map_rs && cargo build --features hypervisor 2>&1 | tail -20`
  - **Commit**: `feat(rust-app): add terminal notification handler for semantic events`
  - _Requirements: FR-3_
  - _Design: Data Flow step 6_

- [ ] 2.2 Add damage tracking to notifications
  - **Do**: Add `write_notification_tracked(msg, fg_color) -> Option<DirtyRect>` method that calls write_notification and returns the dirty rectangle.
  - **Files**: `systems/infinite_map_rs/src/terminal_clone/geometric_bridge.rs`
  - **Done when**: Method returns DirtyRect covering notification line.
  - **Verify**: `cd systems/infinite_map_rs && cargo test --features hypervisor test_notification_returns_dirty_rect 2>&1 | tail -10`
  - **Commit**: `feat(geometric-bridge): add damage tracking for notifications`
  - _Requirements: FR-4, AC-2.1, AC-2.2_
  - _Design: DamageTracker Integration_

## Phase 3: Testing

- [ ] 3.1 Unit tests for SemanticNotificationBridge
  - **Do**: Create `tests/test_semantic_notification_bridge.py` with tests for: event creation, category colors, terminal formatting, HTML stripping.
  - **Files**: `tests/test_semantic_notification_bridge.py`
  - **Done when**: 4 tests pass covering color assignment, formatting, HTML strip.
  - **Verify**: `python3 tests/test_semantic_notification_bridge.py`
  - **Commit**: `test(semantic-bridge): add unit tests`
  - _Requirements: AC-1.2, AC-3.1-3.4_

- [ ] 3.2 End-to-end integration test
  - **Do**: Create `tests/test_semantic_terminal_e2e.py` with WebSocket test that sends wordpress_publish and receives terminal_notification.
  - **Files**: `tests/test_semantic_terminal_e2e.py`
  - **Done when**: Test sends event and verifies terminal_notification broadcast received.
  - **Verify**: `python3 tests/test_semantic_terminal_e2e.py`
  - **Commit**: `test: add E2E test for semantic-terminal integration`
  - _Requirements: FR-3, AC-1.1_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all tests: Python unit, Python E2E, Rust unit.
  - **Verify**:
    - `python3 tests/test_semantic_notification_bridge.py`
    - `cd systems/infinite_map_rs && cargo test --features hypervisor test_write_notification`
    - `cd systems/infinite_map_rs && cargo build --features hypervisor`
  - **Done when**: All commands pass without errors.
  - **Commit**: `fix(semantic-terminal): address test issues` (if needed)

- [ ] 4.2 Documentation
  - **Do**: Create `docs/SEMANTIC_GEOMETRIC_TERMINAL.md` with usage examples and update MEMORY.md with new component entry.
  - **Files**: `docs/SEMANTIC_GEOMETRIC_TERMINAL.md`
  - **Done when**: Documentation covers data flow, color codes, usage examples.
  - **Verify**: Manual review of docs.
  - **Commit**: `docs: add semantic-geometric terminal documentation`

## Notes

- **POC shortcuts**: Direct WebSocket broadcast, no queuing
- **Production TODOs**: Add message queue for high-volume events, persistent notification history
- **Test coverage**: 9+ tests total (2 Rust inline, 4 Python unit, 2 Python E2E, 1 integration)
