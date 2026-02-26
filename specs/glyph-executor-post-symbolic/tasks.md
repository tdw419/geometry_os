---
spec: glyph-executor-post-symbolic
phase: tasks
total_tasks: 12
created: 2026-02-26T00:00:00Z
---

# Tasks: GlyphExecutor Post-Symbolic Execution

## Phase 1: Post-Symbolic Shader Foundation

- [ ] 1.1 Create post-symbolic shader skeleton
  - **Do**:
    1. Create `systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl`
    2. Add glyph atlas texture binding (binding 0)
    3. Add atlas dictionary storage buffer (binding 1)
    4. Implement `sample_token_id(pc)` using textureLoad
    5. Implement `holographic_fetch(pc)` returning u32
    6. Add basic main() entry point with PC increment
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl` (CREATE)
  - **Done when**: Shader file exists, holographic fetch returns instruction
  - **Verify**: Load shader in browser, check for WebGPU errors
  - **Commit**: `feat(shader): add post-symbolic skeleton with holographic fetch`
  - **Assignee**: shader-architect

- [ ] 1.2 Complete instruction execution in post-symbolic shader
  - **Do**:
    1. Copy full instruction decode/execute logic from `visual_cpu_riscv.wgsl`
    2. Include all opcode handlers (LUI, AUIPC, JAL, JALR, BRANCH, LOAD, STORE, OP-IMM, OP, SYSTEM)
    3. Include CSR handling functions
    4. Include memory access helpers
    5. Include syscall bridge
    6. Replace all `expanded_code[pc/4]` with `holographic_fetch(pc)`
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl` (MODIFY)
  - **Done when**: All RISC-V opcodes handled, shader compiles
  - **Verify**: Compare instruction coverage with standard shader
  - **Commit**: `feat(shader): complete post-symbolic instruction execution`
  - **Assignee**: shader-architect

## Phase 2: GlyphExecutor.js Motherboard

- [ ] 2.1 Create GlyphExecutor class skeleton
  - **Do**:
    1. Create `systems/visual_shell/web/GlyphExecutor.js`
    2. Add constructor with device, pipeline state, texture atlas properties
    3. Implement `initialize()` method loading post-symbolic shader
    4. Create bind group layout with 4 bindings (texture, dictionary, memory, state)
    5. Create compute pipeline
    6. Add `_loadShader()` helper
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js` (CREATE)
  - **Done when**: Class exports, initialize() creates pipeline
  - **Verify**: `node --check systems/visual_shell/web/GlyphExecutor.js`
  - **Commit**: `feat(glyph-executor): add GlyphExecutor motherboard class`
  - **Assignee**: gpu-engineer

- [ ] 2.2 Add deploy() and execute() methods
  - **Do**:
    1. Add `deploy(textureUrl, kernelId)` method
    2. Implement `_loadMorphologicalTexture()` - fetch .rts.png and .meta.json
    3. Implement `_updateDictionary()` - sync dictionary buffer to GPU
    4. Add `execute(kernelId, cycles)` - dispatch compute pass
    5. Add `readState(kernelId)` - map and read CPU state buffer
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js` (MODIFY)
  - **Done when**: deploy() creates bind group, execute() dispatches
  - **Verify**: Test in browser with WebGPU device
  - **Commit**: `feat(glyph-executor): add deploy and execute methods`
  - **Assignee**: gpu-engineer

- [ ] 2.3 Add resonance validation and continuous execution
  - **Do**:
    1. Add `validateResonance(tileX, tileY)` - check symmetry mask
    2. Add `_sampleTile()` - read pixel from atlas
    3. Add `_checkGeometricIntegrity()` - dot-product validation
    4. Add `startContinuous(kernelId, cyclesPerFrame, onOutput)` - animation loop
    5. Add `stop(kernelId)` - halt execution
    6. Add `_checkUARTOutput()` - read memory at UART region
  - **Files**: `systems/visual_shell/web/GlyphExecutor.js` (MODIFY)
  - **Done when**: Continuous execution runs, UART callback works
  - **Verify**: Run test page, verify continuous execution
  - **Commit**: `feat(glyph-executor): add resonance validation and continuous execution`
  - **Assignee**: gpu-engineer

## Phase 3: Updated Morphological Encoder

- [ ] 3.1 Add symmetry mask calculation to encoder
  - **Do**:
    1. Add `calculate_symmetry_mask(glyph_pixels)` function to `riscv_morphological_encoder.py`
    2. Check horizontal symmetry (top == bottom)
    3. Check vertical symmetry (left == right)
    4. Check rotational symmetry (180 degree)
    5. Return byte with bits: 0x80=full, 0x40=h_sym, 0x20=v_sym, 0x10=r_sym
    6. Include geometric integrity score (0-15) in lower bits
  - **Files**: `riscv_morphological_encoder.py` (MODIFY)
  - **Done when**: Function returns valid mask byte
  - **Verify**: `python3 -c "from riscv_morphological_encoder import calculate_symmetry_mask; print(hex(calculate_symmetry_mask([0]*256)))"`
  - **Commit**: `feat(encoder): add symmetry mask calculation`
  - **Assignee**: encoder-engineer

- [ ] 3.2 Update pixel encoding with symmetry metadata
  - **Do**:
    1. Add `tile_mode` option to `RISCVMorphologicalEncoder.__init__`
    2. Update `encode_pixel()` to return (R, G, B, A) with A=symmetry_mask
    3. Default A=0xFF for fully executable pixels
    4. A=0x00 for NOP padding
    5. Maintain backwards compatibility with existing textures
  - **Files**: `riscv_morphological_encoder.py` (MODIFY)
  - **Done when**: Pixel encoding includes symmetry in alpha
  - **Verify**: `python3 -m py_compile riscv_morphological_encoder.py`
  - **Commit**: `feat(encoder): add tile mode and symmetry encoding`
  - **Assignee**: encoder-engineer

- [ ] 3.3 Generate holographic test asset
  - **Do**:
    1. Run encoder with tile mode on hello_syscall.bin
    2. Command: `python3 riscv_morphological_encoder.py --tile-mode systems/infinite_map_rs/tests/hello_syscall.bin systems/visual_shell/web/assets/hello_holographic.rts.png`
    3. Verify .rts.png file created
    4. Verify .meta.json has type "riscv-morphological"
    5. Verify dictionary instructions array present
  - **Files**:
    - `systems/visual_shell/web/assets/hello_holographic.rts.png` (CREATE)
    - `systems/visual_shell/web/assets/hello_holographic.rts.png.meta.json` (CREATE)
  - **Done when**: Both files exist with correct format
  - **Verify**: `file systems/visual_shell/web/assets/hello_holographic.rts.png && jq '.type' systems/visual_shell/web/assets/hello_holographic.rts.png.meta.json`
  - **Commit**: `test(assets): add holographic test asset`
  - **Assignee**: encoder-engineer

## Phase 4: Integration Test

- [ ] 4.1 Create GlyphExecutor test HTML page
  - **Do**:
    1. Create `systems/visual_shell/web/test_glyph_executor.html`
    2. Add Init WebGPU button
    3. Add Load Holographic button
    4. Add Start/Stop continuous execution buttons
    5. Add UART output div
    6. Add status indicator
    7. Import GlyphExecutor.js module
    8. Wire up all button handlers
    9. Add error handling with try/catch
  - **Files**: `systems/visual_shell/web/test_glyph_executor.html` (CREATE)
  - **Done when**: Page loads without JS errors, buttons wired
  - **Verify**: Open in browser, check console for errors
  - **Commit**: `test(glyph-executor): add integration test page`
  - **Assignee**: integration-engineer

- [ ] 4.2 End-to-end verification
  - **Do**:
    1. Start local server: `cd systems/visual_shell/web && python3 -m http.server 8080`
    2. Open http://localhost:8080/test_glyph_executor.html
    3. Click "Init WebGPU"
    4. Click "Load Holographic"
    5. Click "Start"
    6. Verify UART output appears (e.g., "Hello" text)
    7. Click "Stop" and verify execution halts
    8. Document results in .progress.md
  - **Files**: N/A (browser testing)
  - **Done when**: UART output shows expected text
  - **Verify**: Manual verification - document in .progress.md
  - **Commit**: `feat(glyph-executor): complete E2E verification`
  - **Assignee**: integration-engineer

## Phase 5: Quality Gates

- [ ] 5.1 Syntax verification
  - **Do**:
    1. Run `node --check systems/visual_shell/web/GlyphExecutor.js`
    2. Run `python3 -m py_compile riscv_morphological_encoder.py`
    3. Verify all checks pass (exit code 0)
    4. Fix any errors found
  - **Files**: (all modified files)
  - **Done when**: All syntax checks pass
  - **Verify**: Run each command, verify exit 0
  - **Commit**: `fix: address syntax issues` (only if fixes needed)
  - **Assignee**: test-engineer

- [ ] 5.2 Create pull request
  - **Do**:
    1. Create feature branch: `git checkout -b feat/glyph-executor-post-symbolic`
    2. Stage all files: `git add systems/visual_shell/web/GlyphExecutor.js systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl systems/visual_shell/web/test_glyph_executor.html systems/visual_shell/web/assets/hello_holographic.* riscv_morphological_encoder.py`
    3. Commit with message
    4. Push: `git push -u origin feat/glyph-executor-post-symbolic`
    5. Create PR: `gh pr create --title "feat(glyph-executor): add post-symbolic holographic execution" --body "..."`
  - **Files**: N/A (git operations)
  - **Done when**: PR created, URL returned
  - **Verify**: `gh pr view --json url`
  - **Commit**: None (PR creation)
  - **Assignee**: test-engineer

## Execution Context

### Agent Team

The `glyph-executor-team` (apps/openspec/openspec/teams/glyph-executor-team.yaml) provides:
- **shader-architect**: WGSL compute shader implementation
- **gpu-engineer**: GlyphExecutor.js JavaScript class
- **encoder-engineer**: Python encoder updates
- **integration-engineer**: Test pages and E2E verification
- **test-engineer**: Quality gates and PR creation

### Dependencies

- Phase 1.1 → Phase 1.2 (shader skeleton → full execution)
- Phase 2.1 → Phase 2.2 → Phase 2.3 (GlyphExecutor incremental)
- Phase 3.1 → Phase 3.2 → Phase 3.3 (encoder incremental)
- Phase 2.3 + Phase 3.3 → Phase 4.1 (test page needs executor + asset)
- Phase 4.1 → Phase 4.2 (E2E needs test page)
- Phase 4.2 → Phase 5.1 → Phase 5.2 (quality gates after E2E)

### Parallel Execution

Tasks that can run in parallel:
- Phase 1.1-1.2 (shader) || Phase 2.1-2.3 (executor) || Phase 3.1-3.3 (encoder)
- After all three tracks complete, run Phase 4 (integration)
- Then Phase 5 (quality gates)
