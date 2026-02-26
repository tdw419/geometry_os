---
spec: geometric-font-terminal
phase: tasks
total_tasks: 8
created: 2026-02-26T06:00:00Z
generated: auto
---

# Tasks: geometric-font-terminal

## Phase 1: Make It Work (POC)

Focus: Enhance geo_term.html with state panel and glyph visualization. Validate end-to-end execution.

- [x] 1.1 Add State Panel to Terminal UI
  - **Do**: Modify geo_term.html to add side panel showing PC, accumulator, halted status, output buffer. Add CSS for layout.
  - **Files**: `systems/visual_shell/web/geo_term.html`
  - **Done when**: State panel visible with PC, ACC, HALT, OUTPUT fields
  - **Verify**: Open geo_term.html in browser, verify panel displays
  - **Commit**: `feat(geo-term): add execution state panel`
  - _Requirements: FR-4_
  - _Design: Terminal UI component_

- [x] 1.2 Add PixiJS Glyph Visualization Canvas
  - **Do**: Add PixiJS canvas for rendering typed code as geometric glyphs. Use GeometryFont.createText() to render current input.
  - **Files**: `systems/visual_shell/web/geo_term.html`
  - **Done when**: Typed characters appear as geometric glyphs in canvas
  - **Verify**: Type in terminal, see glyphs render in real-time
  - **Commit**: `feat(geo-term): add glyph visualization canvas`
  - _Requirements: FR-2, FR-7_
  - _Design: Rendering Layer_

- [x] 1.3 Connect State Panel to Execution Results
  - **Do**: After gpu.run(), call readState() and update state panel with PC, accumulator, halted values. Handle async timing.
  - **Files**: `systems/visual_shell/web/geo_term.html`
  - **Done when**: State panel updates after each command execution
  - **Verify**: Run `+ 10 #`, see ACC=10 in panel
  - **Commit**: `feat(geo-term): connect state panel to GPU execution`
  - _Requirements: FR-3, FR-4_
  - _Design: Data Flow steps 7-9_

- [x] 1.4 Display PRINT Output in History
  - **Do**: After execution, check outputPtr. If > 0, call readOutput() and display values in history with "OUT:" prefix.
  - **Files**: `systems/visual_shell/web/geo_term.html`
  - **Done when**: `+ 10 ! #` shows "OUT: 10" in history
  - **Verify**: Run `+ 5 + 5 ! #`, see "OUT: 10" in history
  - **Commit**: `feat(geo-term): display PRINT output in history`
  - _Requirements: FR-5, FR-6_
  - _Design: Output Panel_

- [x] 1.5 POC Checkpoint
  - **Do**: Verify complete flow: type command, see glyphs, execute on GPU, see state update, see output
  - **Done when**: Can run `+ 10 + 20 ! #` and see ACC=30, OUT: 30
  - **Verify**: Manual test in browser
  - **Commit**: `feat(geo-term): complete POC`

## Phase 2: Refactoring

- [x] 2.1 Extract Terminal Class from HTML
  - **Do**: Create GeometricTerminal.js class encapsulating UI state, PixiJS setup, and execution logic. Keep geo_term.html as thin entry point.
  - **Files**: `systems/visual_shell/web/GeometricTerminal.js`, `systems/visual_shell/web/geo_term.html`
  - **Done when**: GeometricTerminal class manages all terminal logic, HTML only imports and initializes
  - **Verify**: Type check passes, terminal still works
  - **Commit**: `refactor(geo-term): extract GeometricTerminal class`
  - _Design: Component Architecture_

## Phase 3: Testing

- [ ] 3.1 Add Browser Console Tests
  - **Do**: Add self-test function that runs sample programs and verifies output. Call from browser console with `terminal.test()`.
  - **Files**: `systems/visual_shell/web/GeometricTerminal.js`
  - **Done when**: `terminal.test()` runs 3 test cases: ADD only, ADD+PRINT, ADD+SUB+PRINT
  - **Verify**: Run `terminal.test()` in console, see "PASS" for all tests
  - **Commit**: `test(geo-term): add browser console tests`
  - _Requirements: AC-1.1 through AC-5.8_

## Phase 4: Quality Gates

- [ ] 4.1 Manual Browser Verification
  - **Do**: Open geo_term.html in Chrome, verify all opcodes work
  - **Verify**: Test each opcode: `+ 10`, `- 5`, `!`, `#`, `? 0`, `= 0`, `> 0`
  - **Done when**: All 8 opcodes produce expected results
  - **Commit**: `fix(geo-term): address any issues found` (if needed)

- [ ] 4.2 WebGPU Compatibility Check
  - **Do**: Add graceful error message when WebGPU unavailable
  - **Files**: `systems/visual_shell/web/geo_term.html`
  - **Done when**: Non-WebGPU browsers show "WebGPU required" message
  - **Verify**: Test in Firefox (no WebGPU), see error message
  - **Commit**: `feat(geo-term): add WebGPU compatibility check`
  - _Requirements: NFR-2_

## Notes

- **POC shortcuts taken**: All logic in HTML file initially, no module separation
- **Production TODOs**: Move to proper ES modules, add TypeScript types, add E2E tests with Playwright
