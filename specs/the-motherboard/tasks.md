---
spec: the-motherboard
phase: tasks
total_tasks: 14
created: 2026-02-26
generated: auto
---

# Tasks: The Motherboard

## Phase 1: Make It Work (POC)

Focus: Validate the idea works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create GlyphExecutor skeleton
  - **Do**: Create `systems/visual_shell/web/GlyphExecutor.js` with class skeleton, constructor, async init(), placeholder methods
  - **Files**: Create: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: File exists, class exports correctly, console shows creation log
  - **Verify**: `node -e "const {GlyphExecutor} = require('./systems/visual_shell/web/GlyphExecutor.js'); new GlyphExecutor();"`
  - **Commit**: `feat(motherboard): add GlyphExecutor skeleton`
  - _Requirements: FR-1_
  - _Design: GlyphExecutor component_

- [x] 1.2 Implement WebGPU initialization
  - **Do**: Add `initWebGPU()` method with adapter/device acquisition, add `createBuffers()` for systemMemory and cpuStates buffers
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: WebGPU device acquired, buffers created with correct sizes
  - **Verify**: Browser console shows "WebGPU device acquired" and "Buffers created"
  - **Commit**: `feat(motherboard): add WebGPU buffer creation`
  - _Requirements: FR-1, FR-12_
  - _Design: WebGPU Bind Group Layout_

- [x] 1.3 Implement atlas texture loading
  - **Do**: Add `loadAtlas(atlasPath)` method that fetches image, creates GPUTexture, copies via copyExternalImageToTexture
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Atlas loads from `/assets/universal_font.rts.png`, texture dimensions logged
  - **Verify**: Browser console shows "Atlas loaded: WxH"
  - **Commit**: `feat(motherboard): add atlas texture loading`
  - _Requirements: FR-12_
  - _Design: GlyphExecutor.atlasTexture_

- [x] 1.4 Implement glyph registration
  - **Do**: Add `registerGlyph(x, y, sprite, atlasX, atlasY)`, `unregisterGlyph(x, y)`, `getExecutionState(x, y)`, `getActiveGlyphs()` methods
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Glyphs can be registered, registry Map populated, coreId assigned
  - **Verify**: Console log shows "Glyph registered at (x,y), core N"
  - **Commit**: `feat(motherboard): add glyph registration methods`
  - _Requirements: FR-2, FR-3_
  - _Design: GlyphEntry interface_

- [x] 1.5 Implement execution loop
  - **Do**: Add `execute()` method with syncCPUIStates, dispatchCompute (simulated), readResults, updateVisualFeedback
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Calling execute() updates executionCount and lastResult for registered glyphs
  - **Verify**: Console shows "Executed N glyphs" after execute()
  - **Commit**: `feat(motherboard): add execution loop`
  - _Requirements: FR-4_
  - _Design: Data Flow steps 2-5_

- [x] 1.6 Integrate GlyphExecutor with InfiniteMap
  - **Do**: Add GlyphExecutor initialization in InfiniteMap constructor, add `placeExecutableGlyph()`, `executeGlyphs()`, `createGlyphSprite()` methods, add Ctrl+Enter keyboard shortcut
  - **Files**: Modify: `systems/visual_shell/web/infinite_map.js`
  - **Done when**: `map.placeExecutableGlyph(10, 10, 65)` creates sprite and registers it
  - **Verify**: Console shows "GlyphExecutor integrated with InfiniteMap"
  - **Commit**: `feat(motherboard): integrate GlyphExecutor with InfiniteMap`
  - _Requirements: FR-10, FR-11_
  - _Design: InfiniteMap Extension_

- [ ] 1.7 Create test page
  - **Do**: Create `test_motherboard.html` with PixiJS app, control panel (Execute, Clear buttons), glyph palette, map click handler
  - **Files**: Create: `systems/visual_shell/web/test_motherboard.html`
  - **Done when**: Page loads, clicking map places glyphs, Execute button triggers execution
  - **Verify**: Open file in browser, click map, see glyph placed
  - **Commit**: `feat(motherboard): add test page`
  - _Requirements: US-1, US-2_
  - _Design: Test harness in plan_

- [ ] 1.8 POC Checkpoint
  - **Do**: Verify end-to-end flow works: place glyph -> execute -> see visual change
  - **Done when**: Full cycle demonstrable in test page
  - **Verify**: Manual test: place 'A' glyph, press Ctrl+Enter, see glow effect
  - **Commit**: `feat(motherboard): complete POC`

## Phase 2: Refactoring

- [ ] 2.1 Add visual glow effect
  - **Do**: Enhance `updateVisualFeedback()` with alpha blend, scale pulse for active glyphs
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Active glyphs have subtle glow/pulse, halted glyphs show red tint
  - **Verify**: Visual inspection in test page
  - **Commit**: `refactor(motherboard): add visual glow effect`
  - _Requirements: FR-7, FR-8, FR-9_
  - _Design: Visual feedback via sprite props_

- [ ] 2.2 Add auto-execution mode
  - **Do**: Add `startAutoExecution(fps)`, `stopAutoExecution()`, `toggleAutoExecution()` methods, add Auto button to test page
  - **Files**: Modify: `systems/visual_shell/web/GlyphExecutor.js`, `systems/visual_shell/web/test_motherboard.html`
  - **Done when**: Auto mode runs at specified FPS, can toggle on/off
  - **Verify**: Click Auto, glyphs continuously execute and glow
  - **Commit**: `refactor(motherboard): add auto-execution mode`
  - _Requirements: FR-5_
  - _Design: Execution timing via setInterval_

## Phase 3: Testing

- [ ] 3.1 Add unit tests for GlyphExecutor
  - **Do**: Create `tests/test_glyph_executor.js` with tests for constructor, registration, unregistration, active glyphs
  - **Files**: Create: `systems/visual_shell/web/tests/test_glyph_executor.js`
  - **Done when**: All tests pass in browser console via `runGlyphExecutorTests()`
  - **Verify**: `runGlyphExecutorTests()` in browser console shows "All tests passed!"
  - **Commit**: `test(motherboard): add GlyphExecutor unit tests`
  - _Requirements: AC-1.2, AC-1.4_

- [ ] 3.2 Add WebGPU mock for testing
  - **Do**: Add mockGPU object in test file for non-browser testing
  - **Files**: Modify: `systems/visual_shell/web/tests/test_glyph_executor.js`
  - **Done when**: Tests can run without real WebGPU
  - **Verify**: Node can execute test file without errors
  - **Commit**: `test(motherboard): add WebGPU mock`

## Phase 4: Quality Gates

- [ ] 4.1 Add documentation
  - **Do**: Create `docs/motherboard.md` with overview, quick start, API reference, visual feedback guide
  - **Files**: Create: `docs/motherboard.md`
  - **Done when**: Documentation covers all public APIs
  - **Verify**: Read through doc, verify code examples match implementation
  - **Commit**: `docs(motherboard): add usage documentation`

- [ ] 4.2 Final verification and cleanup
  - **Do**: Run full test cycle, verify all acceptance criteria met, clean up console logs
  - **Done when**: All ACs from requirements.md verified
  - **Verify**: Manual checklist of all AC items
  - **Commit**: `fix(motherboard): final cleanup`

## Notes

- **POC shortcuts taken**: dispatchCompute is simulated, no real shader dispatch yet
- **Production TODOs**: Implement actual compute pipeline with visual_cpu_riscv_morph.wgsl, add bind group creation
- **Key files to watch**: infinite_map.js may have merge conflicts if modified elsewhere
