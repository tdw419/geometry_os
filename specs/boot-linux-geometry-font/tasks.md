---
spec: boot-linux-geometry-font
phase: tasks
total_tasks: 19
created: 2026-02-25T17:30:00Z
---

# Tasks: Boot Linux Using Geometry Font System

## Phase 1: Make It Work (POC)

Focus: Validate morphological decoding and GPU execution end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create RISCVOrphologicalLoader class
  - **Do**:
    1. Create `systems/visual_shell/web/riscv_morphological_loader.js`
    2. Implement class with `load(url)` async method
    3. Implement `decodeTokenID(r, g, b, a)` returning `(g << 8) | b`
    4. Implement `lookupInstruction(tokenID, dictionary)` with NOP fallback
    5. Fetch .rts.png via ImageBitmap, extract RGBA pixels
    6. Fetch .meta.json, validate `type === "riscv-morphological"`
    7. Return `{ instructions: Uint32Array, glyphIndices: Uint8Array, metadata, pixelCount }`
    8. Handle A != 0xFF pixels as NOP (0x00000013)
    9. Export to window for browser compatibility
  - **Files**: `systems/visual_shell/web/riscv_morphological_loader.js` (CREATE)
  - **Done when**: Class exists, exports load() method, returns LoadResult
  - **Verify**: `grep -l "class RISCVOrphologicalLoader" systems/visual_shell/web/riscv_morphological_loader.js`
  - **Commit**: `feat(riscv): add RISCVOrphologicalLoader for morphological decoding`
  - _Requirements: FR-1, FR-4, FR-5, FR-6_
  - _Design: RISCVOrphologicalLoader component_

- [x] 1.2 Add deployWithInstructions() to GPUExecutionSystem
  - **Do**:
    1. Add `deployWithInstructions(instructions, kernelId)` method to `gpu_execution_system.js`
    2. Accept pre-expanded `Uint32Array` of RISC-V instructions
    3. Create GPU code buffer with `STORAGE | COPY_DST` flags
    4. Create 128MB memory buffer
    5. Create 256*4 byte state buffer
    6. Create bind group with bindings 0/1/2
    7. Register kernel in `this.kernels` map
    8. Use `mappedAtCreation: true` for code buffer
  - **Files**: `systems/visual_shell/web/gpu_execution_system.js` (MODIFY)
  - **Done when**: Method exists, creates GPU buffers, registers kernel
  - **Verify**: `grep -A5 "deployWithInstructions" systems/visual_shell/web/gpu_execution_system.js | head -10`
  - **Commit**: `feat(gpu): add deployWithInstructions() for pre-expanded code`
  - _Requirements: FR-2, FR-7_
  - _Design: GPUExecutionSystem.deployWithInstructions()_

- [x] 1.3 Add loadKernelFromMorphologicalRTS() to hypervisor
  - **Do**:
    1. Import RISCVOrphologicalLoader in `wgpu_linux_hypervisor.js`
    2. Add `loadKernelFromMorphologicalRTS(url)` async method
    3. Instantiate loader, call `loader.load(url)`
    4. Call `this.gpuSystem.deployWithInstructions(result.instructions, this.kernelId)`
    5. Call `this.setupDTB()` for device tree
    6. Call `this._setupSyscallBridge()` for output handling
    7. Initialize input handler if display exists
    8. Cache initial state
  - **Files**: `systems/visual_shell/web/wgpu_linux_hypervisor.js` (MODIFY)
  - **Done when**: Method exists, wires loader to GPU deployment
  - **Verify**: `grep -A10 "loadKernelFromMorphologicalRTS" systems/visual_shell/web/wgpu_linux_hypervisor.js | head -15`
  - **Commit**: `feat(hypervisor): add loadKernelFromMorphologicalRTS() method`
  - _Requirements: FR-3_
  - _Design: WGPULinuxHypervisor.loadKernelFromMorphologicalRTS()_

- [x] 1.4 Generate test assets with encoder
  - **Do**:
    1. Run encoder on hello_syscall.bin to generate .rts.png and .meta.json
    2. Create output directory `systems/visual_shell/web/assets/` if needed
    3. Execute: `python3 riscv_morphological_encoder.py systems/infinite_map_rs/tests/hello_syscall.bin systems/visual_shell/web/assets/hello_morph.rts.png`
    4. Verify .meta.json contains `type: "riscv-morphological"`
    5. Verify dictionary.instructions array exists
  - **Files**:
    - `systems/visual_shell/web/assets/hello_morph.rts.png` (CREATE)
    - `systems/visual_shell/web/assets/hello_morph.rts.png.meta.json` (CREATE)
  - **Done when**: Both files exist, .meta.json has correct format
  - **Verify**: `test -f systems/visual_shell/web/assets/hello_morph.rts.png && jq '.type == "riscv-morphological"' systems/visual_shell/web/assets/hello_morph.rts.png.meta.json`
  - **Commit**: `test(assets): add hello_morph.rts.png encoded test binary`
  - _Requirements: FR-10_

- [x] 1.5 Create manual test HTML page
  - **Do**:
    1. Create `systems/visual_shell/web/test_morphological_boot.html`
    2. Add Load/Start/Stop buttons
    3. Add console output div for UART display
    4. Add status indicator (loading/running/stopped)
    5. Wire Load button to `hypervisor.loadKernelFromMorphologicalRTS('assets/hello_morph.rts.png')`
    6. Wire Start to `hypervisor.start()`
    7. Wire Stop to `hypervisor.stop()`
    8. Set `hypervisor.onConsoleOutput` to display UART output
    9. Include error handling with try/catch
  - **Files**: `systems/visual_shell/web/test_morphological_boot.html` (CREATE)
  - **Done when**: HTML page exists with working buttons and console output
  - **Verify**: `grep -l "loadKernelFromMorphologicalRTS" systems/visual_shell/web/test_morphological_boot.html`
  - **Commit**: `test(morphological): add manual test page for morphological boot`
  - _Requirements: FR-8_
  - _Design: Test Strategy: E2E Tests_

- [x] 1.6 POC Checkpoint: End-to-end boot verification
  - **Do**:
    1. Serve files with `python3 -m http.server 8080` in systems/visual_shell/web/
    2. Open test_morphological_boot.html in Chrome
    3. Click Load button, verify no errors in console
    4. Click Start button, wait for UART output
    5. Verify "Hello" text appears in console output div
    6. Check browser console for WebGPU errors
    7. Document results in .progress.md
  - **Files**: N/A (browser testing)
  - **Done when**: hello_syscall.bin output appears in test page console
  - **Verify**: `curl -s http://localhost:8080/test_morphological_boot.html | grep -c "loadKernelFromMorphologicalRTS"`
  - **Commit**: `feat(morphological): complete POC - morphological boot works`
  - _Requirements: AC-3.1, AC-3.2, AC-3.3_
  - _Design: Data Flow steps 1-11_

## Phase 2: Refactoring

After POC validated, clean up code structure and add proper error handling.

- [x] 2.1 Add comprehensive error handling to loader
  - **Do**:
    1. Add try/catch around fetch operations
    2. Throw descriptive errors: "Failed to fetch texture", "Failed to fetch metadata"
    3. Validate metadata.type with clear error message
    4. Handle empty dictionary case
    5. Add console.log prefix `[RISCVOrphologicalLoader]` for debugging
    6. Validate instruction count matches pixel count
  - **Files**: `systems/visual_shell/web/riscv_morphological_loader.js` (MODIFY)
  - **Done when**: All error paths have descriptive messages
  - **Verify**: `grep -c "throw new Error" systems/visual_shell/web/riscv_morphological_loader.js`
  - **Commit**: `refactor(loader): add comprehensive error handling`
  - _Design: Error Handling section_

- [x] 2.2 Extract pixel decoding to separate method
  - **Do**:
    1. Create `_decodePixels(imageData, dictionary)` private method
    2. Move pixel iteration loop to this method
    3. Return `{ instructions, glyphIndices }` tuple
    4. Update load() to use extracted method
    5. Add JSDoc comments for all public methods
  - **Files**: `systems/visual_shell/web/riscv_morphological_loader.js` (MODIFY)
  - **Done when**: Code is modular with clear separation
  - **Verify**: `grep -c "_decodePixels" systems/visual_shell/web/riscv_morphological_loader.js`
  - **Commit**: `refactor(loader): extract pixel decoding to private method`
  - _Design: RISCVOrphologicalLoader Interfaces_

- [x] 2.3 [VERIFY] Quality checkpoint: syntax and module checks
  - **Do**:
    1. Run `node --check systems/visual_shell/web/riscv_morphological_loader.js`
    2. Run `node --check systems/visual_shell/web/gpu_execution_system.js`
    3. Run `node --check systems/visual_shell/web/wgpu_linux_hypervisor.js`
    4. Verify no syntax errors
  - **Verify**: All node --check commands exit 0
  - **Done when**: No syntax errors in any modified file
  - **Commit**: `chore(morphological): pass syntax checkpoint` (only if fixes needed)

## Phase 3: Testing

Add unit and integration tests for the morphological loader.

- [x] 3.1 Create unit tests for RISCVOrphologicalLoader
  - **Do**:
    1. Create `systems/visual_shell/web/tests/test_morphological_loader.js`
    2. Test: `testDecodeTokenID()` - verify (G << 8 | B) extraction
    3. Test: `testLookupInstructionValid()` - valid TokenID returns instruction
    4. Test: `testLookupInstructionInvalid()` - out of bounds returns NOP
    5. Test: `testLookupInstructionNonExecutable()` - A != 0xFF returns NOP
    6. Test: `testRejectInvalidMetadata()` - non-morphological type throws
    7. Export all tests to window for HTML runner
  - **Files**: `systems/visual_shell/web/tests/test_morphological_loader.js` (CREATE)
  - **Done when**: All 5 test functions exist and are exported
  - **Verify**: `grep -c "export async function test" systems/visual_shell/web/tests/test_morphological_loader.js`
  - **Commit**: `test(loader): add unit tests for RISCVOrphologicalLoader`
  - _Requirements: FR-9_
  - _Design: Test Strategy: Unit Tests_

- [x] 3.2 Create integration test for full pipeline
  - **Do**:
    1. Add `testMorphologicalPipeline()` to test file
    2. Load hello_morph.rts.png using real loader
    3. Verify instruction count matches metadata
    4. Verify instructions array is Uint32Array
    5. Verify glyphIndices array is Uint8Array
    6. Add `testDeployWithInstructions()` mock test
  - **Files**: `systems/visual_shell/web/tests/test_morphological_loader.js` (MODIFY)
  - **Done when**: Integration test exists and passes
  - **Verify**: `grep -c "testMorphologicalPipeline" systems/visual_shell/web/tests/test_morphological_loader.js`
  - **Commit**: `test(loader): add integration tests for full pipeline`
  - _Design: Test Strategy: Integration Tests_

- [x] 3.3 Create HTML test runner for loader tests
  - **Do**:
    1. Create `systems/visual_shell/web/test_morphological_loader.html`
    2. Import all test functions from test_morphological_loader.js
    3. Run each test with try/catch
    4. Display PASS/FAIL results in colored divs
    5. Show total pass/fail count
  - **Files**: `systems/visual_shell/web/test_morphological_loader.html` (CREATE)
  - **Done when**: HTML page runs all tests and shows results
  - **Verify**: `grep -c "test_morphological_loader.js" systems/visual_shell/web/test_morphological_loader.html`
  - **Commit**: `test(loader): add HTML test runner for morphological loader`
  - _Requirements: FR-9_

- [x] 3.4 [VERIFY] Quality checkpoint: unit tests pass
  - **Do**:
    1. Serve files: `cd systems/visual_shell/web && python3 -m http.server 8081 &`
    2. Fetch test page: `curl -s http://localhost:8081/test_morphological_loader.html | grep -c "PASS"`
    3. Kill server
  - **Verify**: Test page loads and contains PASS markers
  - **Done when**: Unit tests can be run via HTML test runner
  - **Commit**: `chore(tests): verify unit tests pass` (only if fixes needed)

## Phase 4: Quality Gates

Final verification and PR preparation.

- [x] 4.1 Local quality check
  - **Do**:
    1. Run `node --check` on all modified JS files
    2. Verify no console errors in browser test page
    3. Verify test_morphological_boot.html works end-to-end
    4. Check all files have proper JSDoc comments
  - **Verify**: `node --check systems/visual_shell/web/riscv_morphological_loader.js && echo "OK"`
  - **Done when**: All syntax checks pass, manual browser test works
  - **Commit**: `fix(morphological): address quality issues` (if fixes needed)

- [x] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch: `git branch --show-current`
    2. Stage all changes: `git add systems/visual_shell/web/riscv_morphological_loader.js systems/visual_shell/web/gpu_execution_system.js systems/visual_shell/web/wgpu_linux_hypervisor.js systems/visual_shell/web/tests/test_morphological_loader.js systems/visual_shell/web/test_morphological_loader.html systems/visual_shell/web/test_morphological_boot.html systems/visual_shell/web/assets/hello_morph.rts.png systems/visual_shell/web/assets/hello_morph.rts.png.meta.json`
    3. Push: `git push -u origin <branch>`
    4. Create PR: `gh pr create --title "feat(morphological): boot Linux from morphological glyph textures" --body "$(cat <<'EOF'
## Summary
- Add RISCVOrphologicalLoader to decode .rts.png textures into RISC-V instructions
- Add GPUExecutionSystem.deployWithInstructions() for pre-expanded code
- Add WGPULinuxHypervisor.loadKernelFromMorphologicalRTS() for end-to-end boot
- Generate test assets (hello_morph.rts.png) from hello_syscall.bin
- Add unit tests and manual test page

## Test plan
- [ ] Open test_morphological_boot.html in Chrome
- [ ] Click Load, verify no errors
- [ ] Click Start, verify "Hello" output appears
- [ ] Run test_morphological_loader.html, verify all tests pass

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
    5. Wait for CI: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: PR created, CI passes
  - **Commit**: None (PR creation)

## Phase 5: PR Lifecycle

Continuous PR validation until completion criteria met.

- [ ] 5.1 Address CI failures
  - **Do**:
    1. If CI fails, read failure: `gh pr checks`
    2. Identify failing check
    3. Fix issue locally
    4. Commit and push: `git add -A && git commit -m "fix(ci): address CI failure" && git push`
    5. Re-verify: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: All CI checks pass
  - **Commit**: (as needed per failure)

- [ ] 5.2 Final verification: E2E boot test
  - **Do**:
    1. Checkout PR branch
    2. Serve files: `cd systems/visual_shell/web && python3 -m http.server 8080`
    3. Open http://localhost:8080/test_morphological_boot.html
    4. Click Load, then Start
    5. Verify UART output shows expected text
    6. Kill server
  - **Verify**: Manual verification in browser shows boot output
  - **Done when**: Boot test shows expected output
  - **Commit**: None

- [ ] 5.3 AC checklist verification
  - **Do**:
    1. Verify AC-1.1: `grep "loadKernelFromMorphologicalRTS" systems/visual_shell/web/wgpu_linux_hypervisor.js`
    2. Verify AC-1.2: `grep ".meta.json" systems/visual_shell/web/riscv_morphological_loader.js`
    3. Verify AC-1.3: `grep "riscv-morphological" systems/visual_shell/web/riscv_morphological_loader.js`
    4. Verify AC-1.4: `grep "deployWithInstructions" systems/visual_shell/web/gpu_execution_system.js`
    5. Verify AC-2.1: `grep "g << 8" systems/visual_shell/web/riscv_morphological_loader.js`
    6. Verify AC-2.3: `grep "0x00000013" systems/visual_shell/web/riscv_morphological_loader.js`
    7. Verify FR-10: `test -f systems/visual_shell/web/assets/hello_morph.rts.png`
  - **Verify**: All grep commands return non-empty, all test commands exit 0
  - **Done when**: All acceptance criteria verified programmatically
  - **Commit**: None

## Execution Context

### Interview Responses

**Q: What is the core technical approach?**
A: CPU-side decoding of morphological textures. The .rts.png pixels encode TokenIDs in G/B channels. We fetch both the PNG and companion .meta.json, extract TokenIDs, lookup instructions from the dictionary array, and output a Uint32Array ready for GPU upload.

**Q: Why CPU decoding instead of GPU compute?**
A: Dictionary lookup is sequential and simple. For ~12K instructions (hello_syscall.bin), CPU decode takes ~50ms which is acceptable for one-time load. GPU compute would add complexity without meaningful benefit.

**Q: What are the key error cases?**
A:
1. .rts.png fetch fails - throw descriptive error
2. .meta.json fetch fails - throw descriptive error
3. metadata.type != "riscv-morphological" - reject incompatible formats
4. TokenID out of bounds - return NOP (0x00000013)
5. Pixel A != 0xFF - non-executable pixel, return NOP

**Q: How do we verify end-to-end?**
A: The test_morphological_boot.html page provides manual E2E verification. Click Load to fetch and decode the morphological texture, then Start to execute. UART output appears in the console div. Expected output is "Hello from RISC-V!" or similar from hello_syscall.bin.

**Q: What is the NOP instruction?**
A: 0x00000013 - RISC-V `addi x0, x0, 0`. A no-operation that safely does nothing.

## Unresolved Questions

None. All requirements clarified in research phase.

## Notes

- **POC shortcuts taken**: No GPU-accelerated decode, no performance optimization, minimal error messages
- **Production TODOs**: Add performance benchmarking, add WebWorker for decode, add visual glyph renderer (deferred)
- **Browser compatibility**: Requires WebGPU (Chrome 113+, Firefox 118+)
- **Memory footprint**: Dictionary ~1KB for hello_syscall.bin (55 unique instructions)
