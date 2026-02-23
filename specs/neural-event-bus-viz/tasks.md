---
spec: neural-event-bus-viz
phase: tasks
total_tasks: 9
created: 2026-02-23T06:30:00Z
---

# Tasks: Neural Event Bus Visualization

## Overview

MINIMAL SCOPE - Extend existing HUD with NEB event stream. 3 files, ~150 lines total.

## Phase 1: Make It Work (POC)

Focus: Bridge NEB events to HUD. Skip tests, accept hardcoded values.

- [x] 1.1 Create neb_bridge.py - NEB to VisualBridge bridge
  - **Do**:
    1. Create `systems/visual_shell/api/neb_bridge.py`
    2. Implement `NEBBridge` class with `__init__`, `start()`, `_on_event()`
    3. Subscribe to NEB with `**` pattern
    4. Throttle broadcasts to 100ms (10 Hz max)
    5. Build summary payload (events[], topicCounts{}, totalCount)
    6. Call `visual_bridge._broadcast()` with `NEB_EVENT_UPDATE` type
  - **Files**: `systems/visual_shell/api/neb_bridge.py` (create)
  - **Done when**: `python -c "from systems.visual_shell.api.neb_bridge import NEBBridge; print('OK')"` exits 0
  - **Verify**: `python -c "from systems.visual_shell.api.neb_bridge import NEBBridge; print('OK')"`
  - **Commit**: `feat(neb): add NEBBridge for HUD event streaming`
  - _Requirements: FR-1_
  - _Design: NEBBridge Component_

- [x] 1.2 Integrate NEBBridge into VisualBridge.start()
  - **Do**:
    1. Add import for NEBBridge in `visual_bridge.py`
    2. Add `self.neb_bridge = None` in `__init__`
    3. Add `_setup_neb_bridge()` async method
    4. Call `_setup_neb_bridge()` from `start()` after other setup methods
    5. Handle ImportError gracefully (NEBBus may not be available)
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (modify)
  - **Done when**: VisualBridge starts without errors, NEBBridge init logged
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; v=VisualBridge(); print('OK')"`
  - **Commit**: `feat(visual-bridge): integrate NEBBridge startup`
  - _Requirements: FR-1_
  - _Design: Architecture diagram_

- [x] 1.3 Add nebDashboard state to visual_debug_overlay.js
  - **Do**:
    1. Add `nebDashboard` state object in constructor (after other state objects)
    2. Properties: `enabled`, `events[]`, `topicCounts{}`, `totalCount`, `lastUpdate`
    3. Add localStorage restore for `nebDashboard_enabled` in constructor
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js` (modify)
  - **Done when**: No JS errors on page load, state object exists
  - **Verify**: `grep -c "nebDashboard" systems/visual_shell/web/visual_debug_overlay.js` returns >= 5
  - **Commit**: `feat(hud): add NEB dashboard state object`
  - _Requirements: FR-2, FR-6_
  - _Design: NEBDashboard State_

- [x] 1.4 Add NEB_EVENT_UPDATE event listener and handler
  - **Do**:
    1. Add `window.addEventListener('NEB_EVENT_UPDATE', ...)` in `_bindEvents()`
    2. Implement `handleNebUpdate(data)` method
    3. Update state: events, topicCounts, totalCount, lastUpdate
    4. Call `_scheduleRender()` after update
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js` (modify)
  - **Done when**: Event listener registered, handler method exists
  - **Verify**: `grep -c "NEB_EVENT_UPDATE" systems/visual_shell/web/visual_debug_overlay.js` returns >= 2
  - **Commit**: `feat(hud): add NEB event listener and handler`
  - _Requirements: FR-3_
  - _Design: Event Handler_

- [ ] 1.5 Implement _renderNEBDashboard() method
  - **Do**:
    1. Add `_renderNEBDashboard(ctx, width, padding)` method
    2. Follow `_renderSwarmHealth` pattern for positioning/stacking
    3. Draw background, border, title "NEB EVENT STREAM"
    4. Render topic counts row (top 5 prefixes)
    5. Render last 10 events (time, truncated topic)
    6. Call from `_renderHUD()` after Swarm Health section
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js` (modify)
  - **Done when**: Method exists, call added to `_renderHUD`
  - **Verify**: `grep -c "_renderNEBDashboard" systems/visual_shell/web/visual_debug_overlay.js` returns >= 2
  - **Commit**: `feat(hud): add NEB dashboard render method`
  - _Requirements: FR-4_
  - _Design: Render Method_

- [ ] 1.6 Add Ctrl+Shift+N keyboard toggle
  - **Do**:
    1. Add handler in `_bindKeyboard()` for `e.key === 'N'` with Ctrl+Shift
    2. Implement `toggleNEBDashboard()` method
    3. Toggle `nebDashboard.enabled`
    4. Persist to localStorage (`nebDashboard_enabled`)
    5. Log toggle state to console
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js` (modify)
  - **Done when**: Shortcut works, state toggles, localStorage updated
  - **Verify**: `grep -c "Ctrl+Shift+N\|toggleNEBDashboard" systems/visual_shell/web/visual_debug_overlay.js` returns >= 2
  - **Commit**: `feat(hud): add Ctrl+Shift+N toggle for NEB dashboard`
  - _Requirements: FR-5, FR-6_
  - _Design: Keyboard Toggle_

- [ ] 1.7 POC Checkpoint - Manual E2E Verification
  - **Do**:
    1. Start VisualBridge: `python systems/visual_shell/api/visual_bridge.py`
    2. Publish test NEB event from Python REPL
    3. Open browser with visual shell, toggle HUD (Ctrl+Shift+V)
    4. Toggle NEB dashboard (Ctrl+Shift+N)
    5. Verify event appears in dashboard
  - **Done when**: Events visible in HUD within 500ms of publish
  - **Verify**: Manual - see design.md Manual Tests section
  - **Commit**: `feat(neb-viz): complete POC`

## Phase 2: Refactoring

Minimal - scope is intentionally small.

- [ ] 2.1 Add error handling to NEBBridge
  - **Do**:
    1. Wrap NEBBus import in try/except
    2. Log warning if NEBBus unavailable
    3. Handle event callback exceptions gracefully
  - **Files**: `systems/visual_shell/api/neb_bridge.py` (modify)
  - **Done when**: No crashes when NEBBus unavailable
  - **Verify**: `python -c "from systems.visual_shell.api.neb_bridge import NEBBridge; print('OK')"`
  - **Commit**: `refactor(neb): add error handling to NEBBridge`
  - _Design: Error Handling_

## Phase 3: Testing

- [ ] 3.1 Unit tests for NEBBridge
  - **Do**:
    1. Create `tests/visual_shell/test_neb_bridge.py`
    2. Test throttle logic (100ms debounce)
    3. Test event summarization (events[], topicCounts{})
    4. Mock NEBBus and VisualBridge for isolation
  - **Files**: `tests/visual_shell/test_neb_bridge.py` (create)
  - **Done when**: `pytest tests/visual_shell/test_neb_bridge.py -v` passes
  - **Verify**: `pytest tests/visual_shell/test_neb_bridge.py -v`
  - **Commit**: `test(neb): add NEBBridge unit tests`
  - _Design: Test Strategy_

- [ ] 3.2 [VERIFY] Quality checkpoint: lint && test
  - **Do**: Run flake8 on new Python file, run related tests
  - **Verify**: `flake8 systems/visual_shell/api/neb_bridge.py && pytest tests/swarm/test_neb*.py -v`
  - **Done when**: No lint errors, NEB tests pass
  - **Commit**: `chore(neb): pass quality checkpoint`

## Phase 4: Quality Gates

- [ ] 4.1 Local quality verification
  - **Do**: Run all quality commands locally
  - **Verify**:
    - `flake8 systems/visual_shell/api/neb_bridge.py`
    - `pytest tests/visual_shell/test_neb_bridge.py -v` (if created)
    - `pytest tests/swarm/test_neb*.py -v`
  - **Done when**: All commands pass
  - **Commit**: None (unless fixes needed)

## Notes

- **POC shortcuts**: No initial tests, minimal error handling, hardcoded colors
- **Production TODOs**: Add semantic event filtering UI, event history replay, ripple canvas rendering
- **Testing approach**: Manual E2E for POC, unit tests for bridge logic
- **Performance**: 10 Hz throttle, 10 events max in browser, topic counts server-side

## Unresolved Questions

None - scope is minimal and well-defined.
