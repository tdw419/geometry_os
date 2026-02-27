---
spec: motherboard-execution-loop
phase: tasks
total_tasks: 10
created: 2026-02-26T12:00:00Z
generated: auto
---

# Tasks: Motherboard Execution Loop

## Phase 1: Make It Work (POC)

Focus: Connect shader to executor, validate GPU compute works end-to-end.

- [x] 1.1 Add shader loading capability to GlyphExecutor
  - **Do**: Add `shaderSource`, `computePipeline`, `bindGroup`, `bindGroupLayout` properties. Add `loadShader(path)` method that fetches WGSL file.
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js:44-97`
  - **Done when**: `loadShader()` method exists, fetches shader text
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): add shader loading capability`
  - _Requirements: FR-1_
  - _Design: GlyphExecutor (Enhanced)_

- [x] 1.2 Create compute pipeline
  - **Do**: Add `createComputePipeline()` method. Create shader module, bind group layout (3 entries), pipeline layout, compute pipeline.
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Pipeline created from shader source
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): add compute pipeline creation`
  - _Requirements: FR-2_
  - _Design: Bind Group Layout_

- [x] 1.3 Create bind group with atlas texture
  - **Do**: Add `createBindGroup()` method. Create texture view from atlas, bind to layout with systemMemory and cpuStates buffers.
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js`
  - **Done when**: Bind group connects atlas + buffers to pipeline
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): add bind group creation for atlas and buffers`
  - _Requirements: FR-3_
  - _Design: Components_

- [x] 1.4 Update init() for full pipeline initialization
  - **Do**: Replace init() to call: initWebGPU -> createBuffers -> loadShader -> createComputePipeline -> loadAtlas -> createBindGroup. Add shaderPath parameter.
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js:50-65`
  - **Done when**: init() creates complete GPU pipeline
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): integrate full pipeline initialization in init()`
  - _Requirements: FR-1, FR-2, FR-3_
  - _Design: Architecture_

- [x] 1.5 Replace simulated dispatch with real GPU compute
  - **Do**: Replace dispatchCompute() simulation with real WebGPU: create command encoder, begin compute pass, set pipeline/bind group, dispatch workgroups, submit queue, await onSubmittedWorkDone().
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js:393-409`
  - **Done when**: GPU dispatch executes shader, fallback on error
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): replace simulated dispatch with real GPU compute`
  - _Requirements: FR-4_
  - _Design: Data Flow_

- [x] 1.6 Implement real GPU buffer readback
  - **Do**: Replace readResults() simulation with real readback: create staging buffer (MAP_READ | COPY_DST), copy cpuStates to staging, mapAsync, read Uint32Array, unmap/destroy.
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js:418-456`
  - **Done when**: GPU states readable after dispatch
  - **Verify**: `node -c systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(motherboard): implement real GPU buffer readback`
  - _Requirements: FR-5_
  - _Design: Readback Pattern_

- [x] 1.7 Add cycle counter in shader
  - **Do**: Add `cpu_states[base_idx + 39u] = cpu_states[base_idx + 39u] + 1u;` after PC update in main().
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv_morph.wgsl:189`
  - **Done when**: Cycle counter increments each execution
  - **Verify**: Manual review (no WGSL checker)
  - **Commit**: `feat(shader): add cycle counter at register 39`
  - _Requirements: FR-6_
  - _Design: Registers per Core_

- [ ] 1.8 POC Checkpoint: Browser test page
  - **Do**: Create test_motherboard.html with status display, execute/auto buttons, mode switching. Load GlyphExecutor, init with shader path, register test glyphs.
  - **Files**: `systems/visual_shell/web/test_motherboard.html` (create)
  - **Done when**: Page loads, shows WebGPU status, buttons work
  - **Verify**: `ls -la systems/visual_shell/web/test_motherboard.html`
  - **Commit**: `test(motherboard): add browser test page for execution loop`
  - _Requirements: AC-1.1, AC-4.2_
  - _Design: Error Handling_

## Phase 2: Manual Verification

- [ ] 2.1 Manual browser test
  - **Do**: Start http server on port 8080, open test page, click Execute Once, verify log shows executed glyphs. Test auto execution, mode switching.
  - **Files**: None (manual)
  - **Done when**: All buttons work, no console errors, WebGPU status accurate
  - **Verify**: Manual - `http://localhost:8080/test_motherboard.html`
  - **Commit**: (no commit - manual test)
  - _Requirements: AC-1.2, AC-3.1, AC-4.1_

## Phase 3: Documentation

- [ ] 3.1 Update spec documentation
  - **Do**: Create/update HOLOGRAPHIC_HYPERVISOR_PROTOCOL.md with implementation status section: components, execution cycle, registers.
  - **Files**: `specs/HOLOGRAPHIC_HYPERVISOR_PROTOCOL.md`
  - **Done when**: Spec reflects current implementation
  - **Verify**: File exists with Implementation Status section
  - **Commit**: `docs(hypervisor): update with motherboard implementation status`
  - _Requirements: NFR-3_

## Phase 4: Quality Gates

- [ ] 4.1 Final syntax verification
  - **Do**: Run node -c on all modified JS files
  - **Verify**: All files pass syntax check
  - **Done when**: No syntax errors
  - **Commit**: (if fixes needed) `fix(motherboard): address syntax issues`

- [ ] 4.2 Verify GPU compute mode
  - **Do**: In Chrome with WebGPU, verify status shows "WebGPU Active" and "Pipeline: Ready"
  - **Verify**: Console log shows real dispatch (not simulation fallback)
  - **Done when**: GPU compute confirmed working

## Notes

- **POC shortcuts**: Simulation fallback maintained for non-WebGPU browsers
- **Production TODOs**: None - implementation is complete
- **Testing**: Manual browser test only (no automated GPU tests in CI)
