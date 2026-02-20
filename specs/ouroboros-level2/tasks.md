---
spec: ouroboros-level2
phase: tasks
total_tasks: 19
created: 2026-02-20
---

# Implementation Tasks: Ouroboros Level 2 - Interactive UI

## Execution Context

| Interview Question | Response |
|--------------------|----------|
| Testing depth | Standard - unit + integration tests |
| Deployment | Standard CI/CD pipeline (no special requirements) |
| Execution priority | Quality first - thorough from the start |

## Overview

Extends the render-only Shotcut clone pipeline (Ouroboros Level 1) with full mouse/keyboard interactivity via WidgetInteractionManager (JS) and enhanced UITransmuter (Python). Hybrid architecture: CPU hit-testing for click dispatch, GPU uniforms for real-time visual feedback.

**Approach**: POC-first workflow with Quality gates integrated throughout.

## Phase 1: Make It Work (POC)

Focus: Validate interactive UI works end-to-end. Skip extensive testing, accept hardcoded values.

### Task 1.1: [x] Create WidgetInteractionManager Class Skeleton
**Do**:
1. Create `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`
2. Implement class constructor accepting `(canvas, device, uniformBuffer, widgets, callbacks)`
3. Add private fields: `_hoveredWidget`, `_focusedIndex`, `_mousePressed`, `_clickableWidgets`
4. Implement `_getCanvasCoords(e)` to normalize mouse position to canvas pixels
5. Export class as ES module

**Files**:
- Create: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Class instantiates without error, constructor sets all fields

**Verify**: `node -e "import('./conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js').then(m => console.log(typeof m.WidgetInteractionManager))"`

**Commit**: `feat(shotcut): add WidgetInteractionManager class skeleton`

_Requirements: FR-1, US-6, AC-6.1_
_Design: WidgetInteractionManager component_

### Task 1.2: [x] Implement hitTest() Method
**Do**:
1. Add `hitTest(x, y)` method to WidgetInteractionManager
2. Iterate widgets array, check if (x,y) is inside each bbox `[x1, y1, x2, y2]`
3. Return first matching widget (topmost) or null
4. Handle edge cases: empty widgets array, null/undefined coords

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: hitTest returns correct widget for known coordinates

**Verify**: `cd conductor/tracks/shotcut-on-the-map && node -e "import('./widget_interaction_manager.js').then(m => { const w = new m.WidgetInteractionManager({canvas:{},device:{},uniformBuffer:{},widgets:[{bbox:[10,10,50,50],action:'test'}]}); console.log(w.hitTest(30,30)?.action) })"`

**Commit**: `feat(shotcut): implement hitTest method in WidgetInteractionManager`

_Requirements: FR-1, AC-6.2_
_Design: WidgetInteractionManager.hitTest()_

### Task 1.3: [x] Implement Event Handlers (mousemove, mousedown, mouseup)
**Do**:
1. Add `_onMouseMove(e)`, `_onMouseDown(e)`, `_onMouseUp(e)` methods
2. Bind event listeners in constructor, store references in `_boundHandlers`
3. mousemove: call `hitTest()`, update `_hoveredWidget`, call `onHover` callback
4. mousedown: set `_mousePressed = true`, update cursor style
5. mouseup: set `_mousePressed = false`, call `onClick` callback if widget under cursor
6. Add `destroy()` method to remove event listeners

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Event handlers fire correctly, callbacks invoked

**Verify**: Manual - load HTML file, move mouse, see console logs for hover/click

**Commit**: `feat(shotcut): add mouse event handlers to WidgetInteractionManager`

_Requirements: FR-1, US-1, US-2, US-3, AC-1.1, AC-2.1, AC-3.1_
_Design: WidgetInteractionManager event flow_

### Task 1.4: [x] Implement updateMouse() and Uniform Buffer Updates
**Do**:
1. Add `updateMouse(x, y, pressed)` method
2. Create `_updateUniformBuffer()` that writes Float32Array to GPU buffer
3. Layout: `[time, mouse_pressed, mouse_x, mouse_y, resolution_x, resolution_y, focused_widget, pad]`
4. Call `_updateUniformBuffer()` from mouse event handlers
5. Handle case where `uniformBuffer.write()` isn't available (mock mode)

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Uniform buffer writes correct 32-byte array

**Verify**: `cd conductor/tracks/shotcut-on-the-map && node -e "import('./widget_interaction_manager.js').then(m => { const buf = {write: (o,d) => console.log(Array.from(new Float32Array(d.buffer)))}; const w = new m.WidgetInteractionManager({canvas:{},device:{},uniformBuffer:buf,widgets:[]}); w.updateMouse(100,200,true) })"`

**Commit**: `feat(shotcut): implement uniform buffer updates in WidgetInteractionManager`

_Requirements: FR-1, FR-3, AC-6.3_
_Design: Uniform Buffer Layout_

### Task 1.5: [x] Enhance UITransmuter - Add mouse_pressed and focused_widget to Uniforms
**Do**:
1. Modify `_generate_uniforms()` in `ui_transmuter.py`
2. Change struct to: `time: f32, mouse_pressed: f32, mouse: vec2f, resolution: vec2f, focused_widget: f32, pad: f32`
3. Update docstring to note 32-byte layout
4. Run existing tests to ensure no regression

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/ui_transmuter.py`

**Done when**: Generated WGSL contains new uniform fields

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -c "from ui_transmuter import UITransmuter; t = UITransmuter(); wgsl = t.transmute({'widgets':[]}); print('mouse_pressed' in wgsl and 'focused_widget' in wgsl)"`

**Commit**: `feat(shotcut): add mouse_pressed and focused_widget to Uniforms struct`

_Requirements: FR-2, FR-3_
_Design: UITransmuter Enhancement_

### Task 1.6: [x] Enhance UITransmuter - Add Hover Logic for All Widget Types
**Do**:
1. Create `_generate_interaction_helpers()` method with `is_hovered()`, `is_focused()`, `is_pressed()` WGSL functions
2. Modify `_generate_widget_sdf()` to add hover logic for ALL widget types (clip, playhead, unknown - not just panel)
3. Hover logic: `let widget_hover = distance(uv, ui.mouse / ui.resolution) < hover_threshold;`
4. Color brightening: `if (hover) { color += vec4f(0.08); }`

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/ui_transmuter.py`

**Done when**: Generated WGSL contains hover logic for all 5 widget types

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -c "from ui_transmuter import UITransmuter; t = UITransmuter(); wgsl = t.transmute({'widgets':[{'type':'clip','bbox':[0,0,100,100]},{'type':'playhead','bbox':[50,0,55,200]},{'type':'button','bbox':[0,0,50,30]}]}); print('clip_0_hover' in wgsl and 'playhead_0_hover' in wgsl)"`

**Commit**: `feat(shotcut): add hover logic for all widget types in UITransmuter`

_Requirements: FR-2, US-1, AC-1.1_
_Design: UITransmuter Interaction Logic_

### Task 1.7: [x] Add Pressed State Logic for Clickable Widgets
**Do**:
1. Modify `_generate_widget_sdf()` in UITransmuter
2. For widgets with `action` field, add pressed state logic
3. Pressed: `if (hover && ui.mouse_pressed > 0.5) { color -= vec4f(0.05); }`
4. Only clickable widgets (buttons, menus with actions) get pressed state

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/ui_transmuter.py`

**Done when**: Generated WGSL darkens clickable widgets when pressed

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -c "from ui_transmuter import UITransmuter; t = UITransmuter(); wgsl = t.transmute({'widgets':[{'type':'button','bbox':[0,0,50,30],'action':'click'}]}); print('mouse_pressed' in wgsl)"`

**Commit**: `feat(shotcut): add pressed state logic for clickable widgets`

_Requirements: FR-5, US-3, AC-3.1_
_Design: Click Animation Feedback_

### Task 1.8: [x] Create Interactive Test HTML
**Do**:
1. Copy `render_test.html` to `interactive_test.html`
2. Import WidgetInteractionManager as ES module
3. Load widget data from JSON file (or embed sample data)
4. Initialize WidgetInteractionManager with canvas, device, uniformBuffer, widgets
5. Add callbacks: `onHover`, `onClick` that log to console
6. Add status div showing current hovered/clicked widget

**Files**:
- Create: `conductor/tracks/shotcut-on-the-map/interactive_test.html`

**Done when**: Page loads, hover/click events logged to console

**Verify**: Manual - open HTML in Chrome, check console for hover/click logs

**Commit**: `feat(shotcut): create interactive_test.html with WidgetInteractionManager`

_Requirements: FR-4_
_Design: Interactive Test HTML_

### Task 1.9: [x] POC Checkpoint - End-to-End Interaction Verification
**Do**:
1. Run extraction_pipeline on sample screenshot to get widgets.json
2. Run ui_transmuter on widgets.json to generate interactive.wgsl
3. Load interactive_test.html with generated shader
4. Verify: hover highlights widgets, click darkens button, cursor changes
5. Document any issues in `.progress.md`

**Files**:
- Generate: `conductor/tracks/shotcut-on-the-map/shotcut_widgets.json`
- Generate: `conductor/tracks/shotcut-on-the-map/shotcut_interactive.wgsl`

**Done when**: Hover/click/keyboard all work visually in browser

**Verify**: Manual - load HTML, observe hover highlighting, click darkening

**Commit**: `feat(shotcut): complete POC checkpoint with working interactions`

_Requirements: All US-1 through US-6_
_Design: Full integration_

## Phase 2: Refactoring

After POC validated, clean up code structure.

### Task 2.1: [x] Implement Keyboard Navigation (focusNext/focusPrev)
**Do**:
1. Add `focusNext()` and `focusPrev()` methods to WidgetInteractionManager
2. Filter widgets to `clickableWidgets` (those with action)
3. focusNext: `_focusedIndex = (_focusedIndex + 1) % clickableWidgets.length`
4. focusPrev: `_focusedIndex = (_focusedIndex - 1 + length) % length` (wrap)
5. Call `updateFocusedIndex()` to write to uniform buffer
6. Call `onFocus` callback with new focused widget
7. Handle edge case: no clickable widgets

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Tab cycles through clickable widgets, focus index updates

**Verify**: `cd conductor/tracks/shotcut-on-the-map && node -e "import('./widget_interaction_manager.js').then(m => { const w = new m.WidgetInteractionManager({canvas:{},device:{},uniformBuffer:{},widgets:[{bbox:[0,0,10,10],action:'a'},{bbox:[10,0,20,10],action:'b'}]}); w.focusNext(); console.log(w.focusedIndex) })"`

**Commit**: `feat(shotcut): implement keyboard navigation with focusNext/focusPrev`

_Requirements: FR-6, US-4, AC-4.1, AC-4.2, AC-4.3, AC-4.4_
_Design: Keyboard Navigation_

### Task 2.2: [x] Add Keyboard Event Handler
**Do**:
1. Add `_onKeyDown(e)` method to WidgetInteractionManager
2. Bind keydown listener in constructor
3. Tab key (e.key === 'Tab'): call `focusNext()`, preventDefault
4. Shift+Tab: call `focusPrev()`, preventDefault
5. Enter key: if focused widget, call `onClick(focusedWidget)`
6. Update `_boundHandlers` to include keydown

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Tab/Shift+Tab/Enter work in interactive_test.html

**Verify**: Manual - load HTML, press Tab, observe focus indicator

**Commit**: `feat(shotcut): add keyboard event handler for Tab navigation`

_Requirements: FR-6, US-4, AC-4.5_
_Design: Keyboard Event Handler_

### Task 2.3: [x] Add Focus Indicator in WGSL
**Do**:
1. Modify `_generate_widget_sdf()` in UITransmuter
2. For each widget, add focus check: `let widget_focused = i32(ui.focused_widget) == index;`
3. When focused and near edge (d < 0.005): set outline color `vec4f(0.2, 0.6, 1.0, 1.0)`
4. Apply to all widget types

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/ui_transmuter.py`

**Done when**: Focused widget shows blue glow outline

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -c "from ui_transmuter import UITransmuter; t = UITransmuter(); wgsl = t.transmute({'widgets':[{'type':'button','bbox':[0,0,50,30]}]}); print('focused_widget' in wgsl and '0.2, 0.6, 1.0' in wgsl)"`

**Commit**: `feat(shotcut): add focus indicator glow in WGSL`

_Requirements: FR-6, US-4, AC-4.5_
_Design: Focus Visual Indicator_

### Task 2.4: [x] Implement Cursor State Management
**Do**:
1. Add `_updateCursor()` private method to WidgetInteractionManager
2. In `_onMouseMove`: check if hovered widget has action
3. If clickable: `canvas.style.cursor = 'pointer'`
4. If not clickable or null: `canvas.style.cursor = 'default'`
5. Handle canvas reference (store in constructor)

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/widget_interaction_manager.js`

**Done when**: Cursor changes to pointer over clickable widgets

**Verify**: Manual - load HTML, hover over button, observe pointer cursor

**Commit**: `feat(shotcut): implement cursor state management`

_Requirements: FR-7, US-5, AC-5.1, AC-5.2, AC-5.3_
_Design: Cursor State Management_

### Task 2.5: [VERIFY] Quality Checkpoint
**Do**:
1. Run Python lint: `cd conductor/tracks/shotcut-on-the-map && python3 -m flake8 ui_transmuter.py extraction_pipeline.py --max-line-length=100`
2. Run Python tests: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/ -v`
3. Verify no regressions in existing tests

**Files**:
- None (verification only)

**Done when**: No lint errors, all tests pass

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/ -v --tb=short 2>&1 | tail -5`

**Commit**: `chore(shotcut): pass quality checkpoint after refactoring` (only if fixes needed)

## Phase 3: Testing

### Task 3.1: [x] Write Unit Tests for WidgetInteractionManager
**Do**:
1. Create `conductor/tracks/shotcut-on-the-map/tests/test_widget_interaction_manager.js`
2. Test: hitTest returns correct widget for known coords
3. Test: hitTest returns null for coords outside all widgets
4. Test: focusNext cycles through clickable widgets
5. Test: focusPrev cycles backwards
6. Test: focusNext wraps from last to first
7. Test: focusPrev wraps from first to last
8. Use Node.js with ES modules

**Files**:
- Create: `conductor/tracks/shotcut-on-the-map/tests/test_widget_interaction_manager.js`

**Done when**: All 7 tests pass

**Verify**: `cd conductor/tracks/shotcut-on-the-map && node tests/test_widget_interaction_manager.js`

**Commit**: `test(shotcut): add unit tests for WidgetInteractionManager`

_Requirements: FR-1, AC-6.1-6.5_
_Design: Test Strategy - Unit (JS)_

### Task 3.2: [x] Write Unit Tests for Enhanced UITransmuter
**Do**:
1. Create `conductor/tracks/shotcut-on-the-map/tests/test_ui_transmuter_interaction.py`
2. Test: generated WGSL contains mouse_pressed in Uniforms
3. Test: generated WGSL contains focused_widget in Uniforms
4. Test: all widget types include hover logic
5. Test: clickable widgets include pressed logic
6. Test: focused widget includes glow logic
7. Test: uniform buffer is 32 bytes (8 floats)

**Files**:
- Create: `conductor/tracks/shotcut-on-the-map/tests/test_ui_transmuter_interaction.py`

**Done when**: All 7 tests pass with pytest

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/test_ui_transmuter_interaction.py -v`

**Commit**: `test(shotcut): add unit tests for UITransmuter interaction features`

_Requirements: FR-2, FR-3, FR-5, FR-6_
_Design: Test Strategy - Unit (Python)_

### Task 3.3: [x] Write Integration Test for Full Pipeline
**Do**:
1. Create `conductor/tracks/shotcut-on-the-map/tests/test_interactive_integration.py`
2. Test: extraction_pipeline + ui_transmuter produces valid WGSL with interaction
3. Test: get_clickable_regions() output matches WidgetInteractionManager expected format
4. Test: end-to-end: screenshot -> widgets -> wgsl -> (mock) render
5. Use sample screenshot from `screenshots/` directory

**Files**:
- Create: `conductor/tracks/shotcut-on-the-map/tests/test_interactive_integration.py`

**Done when**: Integration tests pass

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/test_interactive_integration.py -v`

**Commit**: `test(shotcut): add integration tests for interactive pipeline`

_Requirements: FR-8_
_Design: Test Strategy - Integration_

### Task 3.4: [VERIFY] Quality Checkpoint - Full Test Suite
**Do**:
1. Run all Python tests: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/ -v`
2. Run all JS tests: `cd conductor/tracks/shotcut-on-the-map && node tests/test_widget_interaction_manager.js`
3. Verify all pass with no errors

**Files**:
- None (verification only)

**Done when**: All tests pass

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -m pytest tests/ -v 2>&1 | grep -E "(PASSED|FAILED|ERROR|passed|failed)"`

**Commit**: `chore(shotcut): pass test suite checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

### Task 4.1: Local Quality Check
**Do**:
1. Run Python lint: `python3 -m flake8 conductor/tracks/shotcut-on-the-map/*.py --max-line-length=100 --exclude=__pycache__`
2. Run all tests: `python3 -m pytest conductor/tracks/shotcut-on-the-map/tests/ -v`
3. Fix any issues found
4. Run JS test: `node conductor/tracks/shotcut-on-the-map/tests/test_widget_interaction_manager.js`

**Files**:
- Modify as needed to fix lint/test issues

**Done when**: All lint checks pass, all tests pass

**Verify**: `cd conductor/tracks/shotcut-on-the-map && python3 -m flake8 *.py --max-line-length=100 && python3 -m pytest tests/ -v --tb=line 2>&1 | tail -3`

**Commit**: `fix(shotcut): address lint and test issues` (if fixes needed)

### Task 4.2: Create PR and Verify CI
**Do**:
1. Check current branch: `git branch --show-current`
2. If on main/master, create feature branch: `git checkout -b feat/ouroboros-level2-interactive-ui`
3. Push branch: `git push -u origin <branch-name>`
4. Create PR: `gh pr create --title "feat(shotcut): Ouroboros Level 2 - Interactive UI" --body "Add hover highlighting, click detection, keyboard navigation to Shotcut clone"`
5. Wait for CI: `gh pr checks --watch`
6. Fix any CI failures

**Files**:
- None (git operations)

**Done when**: All CI checks green, PR ready for review

**Verify**: `gh pr checks` shows all checks passing

**Commit**: None (PR creation)

### Task 4.3: Documentation Update
**Do**:
1. Update `conductor/tracks/shotcut-on-the-map/VISUAL_EXTRACTION_README.md`
2. Add section: "Interactive UI (Ouroboros Level 2)"
3. Document WidgetInteractionManager API
4. Document UITransmuter interaction enhancements
5. Add usage examples

**Files**:
- Modify: `conductor/tracks/shotcut-on-the-map/VISUAL_EXTRACTION_README.md`

**Done when**: README documents all new features

**Verify**: `grep -c "Ouroboros Level 2" conductor/tracks/shotcut-on-the-map/VISUAL_EXTRACTION_README.md`

**Commit**: `docs(shotcut): update README with Ouroboros Level 2 features`

_Requirements: NFR-5_
_Design: Code Maintainability_

## Task Summary

| Phase | Count | Focus |
|-------|-------|-------|
| 1 | 9 | POC - Core implementation |
| 2 | 5 | Refactoring + Keyboard + Cursor |
| 3 | 4 | Testing (Unit + Integration) |
| 4 | 3 | Quality Gates + CI + Docs |
| **Total** | **21** | |

## Notes

**POC Shortcuts**:
- Manual verification for browser-based interactions
- Sample widget data embedded in HTML initially
- No automated browser tests (Playwright deferred)

**Production TODOs**:
- Add Playwright E2E tests for browser automation
- Add accessibility (ARIA) attributes
- Add touch event support
- Performance benchmarking with 136+ widgets
