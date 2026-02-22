---
spec: visual-shell-truth-manifold
phase: tasks
total_tasks: 16
created: 2026-02-21T22:00:00Z
---

# Tasks: Visual Shell Truth Manifold

## Phase 1: Make It Work (POC)

Focus: Validate CTRM data flow from Python backend to HUD display. Skip tests, accept hardcoded values.

- [x] 1.1 Create TruthManifoldBridge Python class
  - **Do**:
    1. Create `systems/visual_shell/api/truth_manifold_bridge.py`
    2. Implement `TruthManifoldBridge` class with:
       - `__init__(self, report_path)` - default path to genesis_pilot_report.json
       - `load_report()` - load and parse CTRM JSON
       - `get_broadcast_payload()` - extract system_metrics, mean_scores, verse_count
       - `broadcast_update(visual_bridge)` - send CTRM_TRUTH_UPDATE via visual_bridge._broadcast()
    3. Add error handling for missing file and JSON parse errors
  - **Files**: `systems/visual_shell/api/truth_manifold_bridge.py`
  - **Done when**: `python3 -c "from systems.visual_shell.api.truth_manifold_bridge import TruthManifoldBridge; b = TruthManifoldBridge(); print(b.load_report()['ctrm_system_report']['system_metrics'])"` prints Cronbach alpha
  - **Verify**: `python3 -c "from systems.visual_shell.api.truth_manifold_bridge import TruthManifoldBridge; b = TruthManifoldBridge(); data = b.get_broadcast_payload(); print('cronbach_alpha' in str(data))"`
  - **Commit**: `feat(truth-manifold): create TruthManifoldBridge class`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: TruthManifoldBridge (Python)_

- [ ] 1.2 Integrate TruthManifoldBridge into VisualBridge
  - **Do**:
    1. Modify `systems/visual_shell/api/visual_bridge.py`
    2. Import TruthManifoldBridge at top of file
    3. Initialize `self.truth_manifold_bridge` in `__init__`
    4. Add message handler for `ctrm_refresh_request` in `handle_client()` - calls `truth_manifold_bridge.broadcast_update()`
    5. Call `truth_manifold_bridge.broadcast_update()` when client connects
  - **Files**: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: VisualBridge initializes TruthManifoldBridge without error
  - **Verify**: `python3 -c "from systems.visual_shell.api.visual_bridge import VisualBridge; b = VisualBridge(); print(hasattr(b, 'truth_manifold_bridge'))"`
  - **Commit**: `feat(truth-manifold): integrate TruthManifoldBridge into VisualBridge`
  - _Requirements: FR-3_
  - _Design: Data Flow_

- [ ] 1.3 Add truthManifoldState to VisualDebugOverlay
  - **Do**:
    1. Modify `systems/visual_shell/web/visual_debug_overlay.js`
    2. Add `truthManifoldState` object in constructor (after other state objects):
       ```javascript
       this.truthManifoldState = {
           enabled: false,
           connected: false,
           cronbachAlpha: 0,
           elementalIndependence: false,
           meanScores: { E1_archaeology: 0, E2_manuscript: 0, E3_prophecy: 0 },
           verseCount: 0,
           lastUpdate: null,
           error: null
       };
       ```
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: State object exists in constructor
  - **Verify**: `grep -n "truthManifoldState" systems/visual_shell/web/visual_debug_overlay.js | head -5`
  - **Commit**: `feat(truth-manifold): add truthManifoldState to HUD`
  - _Requirements: FR-4_
  - _Design: VisualDebugOverlay Extension_

- [ ] 1.4 Add CTRM_TRUTH_UPDATE event listener and handler
  - **Do**:
    1. Add event listener in `_bindEvents()` method:
       ```javascript
       window.addEventListener('CTRM_TRUTH_UPDATE', (e) => {
           this.handleTruthManifoldUpdate(e.detail);
       });
       ```
    2. Implement `handleTruthManifoldUpdate(data)` method:
       - Extract payload from data.data or data
       - Update truthManifoldState fields
       - Set connected = true, lastUpdate = Date.now()
       - Call `this._scheduleRender()`
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: Handler exists and updates state on event
  - **Verify**: `grep -n "handleTruthManifoldUpdate\|CTRM_TRUTH_UPDATE" systems/visual_shell/web/visual_debug_overlay.js | head -10`
  - **Commit**: `feat(truth-manifold): add CTRM_TRUTH_UPDATE handler`
  - _Requirements: FR-5, FR-6_
  - _Design: VisualDebugOverlay Extension_

- [ ] 1.5 Implement _renderTruthManifoldSection HUD renderer
  - **Do**:
    1. Add `_renderTruthManifoldSection(ctx, width, padding)` method
    2. Render HUD section with cyan theme (`#00ffff`):
       - Header: "TRUTH MANIFOLD" with diamond icon
       - Status indicator: connected/disconnected (green/red dot)
       - Cronbach's alpha value with color-coded status (green if < 0.1)
       - Elemental independence: Yes/No
       - Mean scores as progress bars (E1/E2/E3)
       - Verse count
       - RGB legend: R=E1 G=E2 B=E3
       - Last update timestamp
    3. Call from `_renderHUD()` when `this.truthManifoldState.enabled`
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: HUD renders truth manifold section
  - **Verify**: `grep -n "_renderTruthManifoldSection" systems/visual_shell/web/visual_debug_overlay.js | head -5`
  - **Commit**: `feat(truth-manifold): implement HUD render method`
  - _Requirements: FR-7, AC-1.1-1.5_
  - _Design: HUD Section Pattern_

- [ ] 1.6 [VERIFY] Quality checkpoint: Python syntax check
  - **Do**: Run Python syntax check on new bridge file
  - **Verify**: `python3 -m py_compile systems/visual_shell/api/truth_manifold_bridge.py && echo "OK"`
  - **Done when**: No syntax errors
  - **Commit**: `chore(truth-manifold): pass syntax check` (only if fixes needed)

- [ ] 1.7 POC Checkpoint - End-to-end data flow validation
  - **Do**:
    1. Start visual_bridge.py in background
    2. Load Infinite Map in browser
    3. Press Ctrl+Shift+V to enable HUD
    4. Verify TRUTH MANIFOLD section appears with CTRM data
  - **Verify**: `python3 -c "import json; from systems.visual_shell.api.truth_manifold_bridge import TruthManifoldBridge; b = TruthManifoldBridge(); p = b.get_broadcast_payload(); print('OK' if p['system_metrics']['cronbach_alpha'] > 0 else 'FAIL')"`
  - **Done when**: CTRM data flows from JSON to broadcast payload
  - **Commit**: `feat(truth-manifold): complete POC data flow`
  - _Requirements: US-1, US-3_

## Phase 2: Refactoring

- [ ] 2.1 Add graceful error handling for missing CTRM data
  - **Do**:
    1. Add error field to truthManifoldState
    2. Handle CTRM_TRUTH_UPDATE with error payload (show "No CTRM data" in HUD)
    3. Add fallback display when JSON file missing
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js`, `systems/visual_shell/api/truth_manifold_bridge.py`
  - **Done when**: HUD shows graceful message when data unavailable
  - **Verify**: `grep -n "error\|No CTRM" systems/visual_shell/web/visual_debug_overlay.js | head -5`
  - **Commit**: `refactor(truth-manifold): add error handling`
  - _Requirements: AC-3.5_
  - _Design: Error Handling_

- [ ] 2.2 Add localStorage toggle persistence
  - **Do**:
    1. Add checkbox toggle in HUD section for enable/disable
    2. Store enabled state in localStorage key `truthManifold_enabled`
    3. Load state on initialization
    4. When disabled, skip CTRM message processing
  - **Files**: `systems/visual_shell/web/visual_debug_overlay.js`
  - **Done when**: Toggle state persists across browser sessions
  - **Verify**: `grep -n "localStorage\|truthManifold_enabled" systems/visual_shell/web/visual_debug_overlay.js | head -5`
  - **Commit**: `feat(truth-manifold): add toggle persistence`
  - _Requirements: FR-11, AC-4.1, AC-4.2_
  - _Design: State persistence_

- [ ] 2.3 [VERIFY] Quality checkpoint: JS syntax check
  - **Do**: Verify JS has no syntax errors (Node.js parse check)
  - **Verify**: `node --check systems/visual_shell/web/visual_debug_overlay.js 2>&1 || echo "Syntax OK (or no node)"`
  - **Done when**: No syntax errors
  - **Commit**: `chore(truth-manifold): pass JS syntax check` (if fixes needed)

## Phase 3: Testing

- [ ] 3.1 Create Python unit tests for TruthManifoldBridge
  - **Do**:
    1. Create `systems/visual_shell/api/tests/test_truth_manifold_bridge.py`
    2. Test cases:
       - `test_load_report_valid()` - parse valid JSON
       - `test_load_report_missing_file()` - FileNotFoundError handling
       - `test_load_report_malformed_json()` - JSONDecodeError handling
       - `test_get_broadcast_payload()` - payload structure validation
       - `test_empty_report()` - empty/missing metrics handling
  - **Files**: `systems/visual_shell/api/tests/test_truth_manifold_bridge.py`
  - **Done when**: Tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/visual_shell/api/tests/test_truth_manifold_bridge.py -v`
  - **Commit**: `test(truth-manifold): add TruthManifoldBridge tests`
  - _Requirements: NFR-5_
  - _Design: Test Strategy_

- [ ] 3.2 Create JavaScript unit tests for HUD handler
  - **Do**:
    1. Create test file `systems/visual_shell/tests/test_truth_manifold_overlay.js` (or add to existing test file)
    2. Test cases:
       - `testHandleTruthManifoldUpdate_valid()` - handler processes valid payload
       - `testHandleTruthManifoldUpdate_null()` - handler ignores null data
       - `testHandleTruthManifoldUpdate_partial()` - handler fills missing fields with defaults
       - `testRenderSection_visibility()` - section renders when enabled
  - **Files**: `systems/visual_shell/tests/test_truth_manifold_overlay.js`
  - **Done when**: Test file exists with test cases
  - **Verify**: `grep -l "handleTruthManifoldUpdate" systems/visual_shell/tests/*.js 2>/dev/null || echo "JS test file created"`
  - **Commit**: `test(truth-manifold): add HUD handler tests`
  - _Requirements: NFR-5_
  - _Design: Test Strategy_

- [ ] 3.3 [VERIFY] Quality checkpoint: all tests pass
  - **Do**: Run all related tests
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest systems/visual_shell/api/tests/test_truth_manifold_bridge.py -v --tb=short 2>&1 | tail -5`
  - **Done when**: All tests pass
  - **Commit**: `chore(truth-manifold): pass test checkpoint` (if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run Python lint and type checks
  - **Verify**:
    - `python3 -m py_compile systems/visual_shell/api/truth_manifold_bridge.py`
    - `python3 -m py_compile systems/visual_shell/api/visual_bridge.py`
    - `python3 -m pytest systems/visual_shell/api/tests/test_truth_manifold_bridge.py -v --tb=short`
  - **Done when**: All commands exit 0
  - **Commit**: `fix(truth-manifold): address quality issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/wp-mission-control-health`
    3. Create PR using gh CLI
  - **Verify**: `gh pr create --title "feat(truth-manifold): add CTRM HUD integration" --body "$(cat <<'EOF'
## Summary
- Add TruthManifoldBridge Python class for CTRM data loading
- Integrate with VisualBridge for WebSocket broadcasting
- Add HUD section for truth manifold visualization
- Support CTRM_TRUTH_UPDATE messages

## Test Plan
- [ ] Unit tests for TruthManifoldBridge
- [ ] Manual: Start visual_bridge.py, enable HUD with Ctrl+Shift+V
- [ ] Verify TRUTH MANIFOLD section appears with CTRM metrics

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
  - **Done when**: PR created successfully
  - **Commit**: None (PR creation)

## Phase 5: PR Lifecycle

- [ ] 5.1 Monitor CI pipeline
  - **Do**: Check CI status after push
  - **Verify**: `gh pr checks` shows status
  - **Done when**: CI passes or issues identified
  - **Commit**: None

- [ ] 5.2 Address review feedback
  - **Do**: Fix any issues found in review
  - **Verify**: All review comments resolved
  - **Done when**: PR approved
  - **Commit**: Various fix commits as needed

- [ ] 5.3 [VERIFY] Final validation: HUD displays CTRM metrics
  - **Do**: Manual E2E verification
    1. Start visual_bridge.py
    2. Open browser to Infinite Map
    3. Press Ctrl+Shift+V
    4. Verify TRUTH MANIFOLD section shows:
       - Cronbach's alpha: 0.0329 (green)
       - Elemental independence: Yes
       - Mean scores: E1/E2/E3 progress bars
       - Verse count: 100
  - **Verify**: Visual confirmation (document in .progress.md)
  - **Done when**: All acceptance criteria met
  - **Commit**: None

## Unresolved Questions

1. Truth district exact coordinates - using placeholder values until spatial tectonics integration
2. Texture scale factor - defaulting to 32x per pixel (320x320 total)

## Notes

- POC shortcuts: Hardcoded truth district position, no texture loading in POC
- Production TODOs: PixiJS sprite texture overlay for truth manifold PNG
- Existing files: `genesis_pilot_report.json` and `genesis_truth_manifold.rts.png` already generated
