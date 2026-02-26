---
spec: spatial-mmu
phase: tasks
total_tasks: 6
created: 2026-02-25T20:10:00Z
generated: auto
---

# Tasks: spatial-mmu

## Phase 1: Make It Work (POC)

Focus: Verify existing MMU components and fix critical security gap.

- [ ] 1.1 Verify 64-register state buffer configuration
  - **Do**: Check REGS_PER_CORE=64 in visual_cpu_riscv.wgsl line 19, verify CSR indices 46-49 defined
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Done when**: `grep "REGS_PER_CORE.*64"` and `grep "CSR_GUEST_BASE.*46"` both return matches
  - **Verify**: `grep -E "REGS_PER_CORE|CSR_GUEST_BASE|CSR_GUEST_SIZE|CSR_GEOM_CACHE|CSR_TRANS_FLAGS" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Commit**: `verify(mmu): confirm 64-register state with Tectonic CSRs`
  - _Requirements: FR-1, FR-2, FR-3, FR-4, FR-5_
  - _Design: Component A_

- [ ] 1.2 Verify Morton encoding functions exist
  - **Do**: Check phys_to_morton function at lines 213-228, verify bit manipulation logic
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Done when**: `grep "phys_to_morton" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl` returns function definition
  - **Verify**: `grep -A 15 "fn phys_to_morton" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Commit**: `verify(mmu): confirm Morton Z-curve encoding for texture locality`
  - _Requirements: FR-6_
  - _Design: Component B_

- [ ] 1.3 Verify guest bounds checking in translate_address
  - **Do**: Check lines 289-294 for GUEST_BASE/SIZE bounds check after Sv32 translation
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Done when**: Bounds check code present with CSR_GUEST_BASE and CSR_GUEST_SIZE
  - **Verify**: `grep -A 6 "Tectonic Bounds Check" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Commit**: `verify(mmu): confirm guest region bounds checking`
  - _Requirements: FR-7_
  - _Design: Component C_

- [ ] 1.4 Add MMU translation to instruction fetch (SECURITY CRITICAL)
  - **Do**: Modify instruction fetch at line 360 to go through translate_address with ACCESS_EXEC
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Code Change**:
    ```wgsl
    // BEFORE (line 360):
    let inst = expanded_code[pc];

    // AFTER:
    let pc_paddr = translate_address(pc * 4u, ACCESS_EXEC, base_idx);
    if (pc_paddr == 0xFFFFFFFFu) {
        cpu_states[base_idx + 32u] = trap_enter(base_idx, CAUSE_INST_PAGE_FAULT, pc * 4u, pc);
        return;
    }
    let inst = expanded_code[pc_paddr / 4u];
    ```
  - **Done when**: Shader compiles, instruction fetch uses MMU translation
  - **Verify**: Open test_tectonic_mmu.html, check for WebGPU compilation errors
  - **Commit**: `fix(mmu): add MMU translation to instruction fetch for security`
  - _Requirements: FR-8, AC-2.1, AC-2.2, AC-2.3_
  - _Design: Component A_

- [ ] 1.5 Verify dirty/access bit tracking in translate_address
  - **Do**: Check A bit (0x40) and D bit (0x80) are set in both megapage and leaf PTE paths
  - **Files**: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Done when**: Both paths update PTE with A/D bits before returning
  - **Verify**: `grep -E "0x40u|0x80u" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`
  - **Commit**: `verify(mmu): confirm A/D bit tracking for transmutation triggers`
  - _Requirements: FR-9, FR-10_
  - _Design: Component D_

- [ ] 1.6 POC Checkpoint
  - **Do**: Run existing test_tectonic_mmu.html, verify all tests pass
  - **Done when**: Test page loads, WebGPU initializes, privilege trap and spatial isolation tests pass
  - **Verify**: Open `systems/visual_shell/web/test_tectonic_mmu.html` in browser
  - **Commit**: `test(mmu): verify POC checkpoint - all MMU tests pass`

## Phase 2: Refactoring

After POC validated, extend test coverage.

- [ ] 2.1 Add instruction fetch protection test
  - **Do**: Add test case to test_tectonic_mmu.html for instruction fetch page fault
  - **Files**: `systems/visual_shell/web/test_tectonic_mmu.html`
  - **Test Code**:
    ```javascript
    // Test 3: Instruction Fetch Protection
    defineTest('Instruction Fetch: Non-executable page triggers fault', async (device, log) => {
        // Create page with X=0, attempt to fetch from it
        // Expect CAUSE_INST_PAGE_FAULT (12)
    });
    ```
  - **Done when**: New test renders and passes
  - **Verify**: Refresh test page, verify new test shows PASS
  - **Commit**: `test(mmu): add instruction fetch protection test`
  - _Requirements: AC-2.3_

- [ ] 2.2 Verify GPUExecutionSystem accessor methods
  - **Do**: Check setGuestBase, setGuestSize, setGeometryCacheBase, getTransmutationFlags exist
  - **Files**: `systems/visual_shell/web/gpu_execution_system.js`
  - **Done when**: All four methods present in class
  - **Verify**: `grep -E "setGuestBase|setGuestSize|setGeometryCacheBase|getTransmutationFlags" systems/visual_shell/web/gpu_execution_system.js`
  - **Commit**: `verify(mmu): confirm Tectonic register accessor methods`
  - _Requirements: FR-11, AC-5.1, AC-5.2, AC-5.3_
  - _Design: Component E_

## Phase 3: Testing

- [ ] 3.1 Run full MMU test suite
  - **Do**: Open test_tectonic_mmu.html, run all tests, capture results
  - **Files**: `systems/visual_shell/web/test_tectonic_mmu.html`
  - **Done when**: All tests show PASS status
  - **Verify**: Visual inspection of test results in browser
  - **Commit**: `test(mmu): all MMU validation tests pass`

- [ ] 3.2 Test backward compatibility with bare mode
  - **Do**: Run test with satp_mode=0, verify direct physical access works
  - **Files**: `systems/visual_shell/web/test_tectonic_mmu.html`
  - **Done when**: Bare mode test passes
  - **Verify**: Check test output for bare mode verification
  - **Commit**: `test(mmu): verify backward compatibility with bare mode`
  - _Requirements: NFR-4_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all verification commands, check shader compilation
  - **Verify**:
    ```bash
    grep "REGS_PER_CORE.*64" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
    grep "phys_to_morton" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
    grep "CSR_GUEST_BASE" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
    grep "translate_address.*ACCESS_EXEC" systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
    ```
  - **Done when**: All grep commands return matches
  - **Commit**: `chore(mmu): quality gate verification`

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green (if CI configured)
  - **Done when**: PR ready for review

## Notes

- **POC shortcuts taken**: Verification tasks check existing code, only 1.4 requires new code
- **Production TODOs**: Consider adding Morton-based texture cache in future phase
- **Security Priority**: Task 1.4 is CRITICAL - instruction fetch bypass is security vulnerability
