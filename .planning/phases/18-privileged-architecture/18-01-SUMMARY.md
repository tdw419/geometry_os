---
phase: 18-privileged-architecture
plan: 01
subsystem: riscv-cpu
tags: [riscv, webgpu, wgsl, sbi, privileged-mode, csr, m-mode]

# Dependency graph
requires:
  - phase: 17-core-execution-foundation
    provides: GPU execution framework, CoreExecutionVerifier staging pattern
provides:
  - M-mode CSR definitions in shader (indices 50-59)
  - MSTATUS bit position constants
  - SbiBridge JavaScript handler for GPU-to-JS communication
affects: [18-02, 18-03, trap-handling, kernel-boot]

# Tech tracking
tech-stack:
  added: []
  patterns: [staging-buffer-readback, sbi-bridge-pattern]

key-files:
  created:
    - systems/visual_shell/web/SbiBridge.js
  modified:
    - systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl

key-decisions:
  - "M-mode CSRs at indices 50-59 (sequential after Tectonic extensions at 46-49)"
  - "SBI bridge uses same staging buffer pattern as CoreExecutionVerifier"

patterns-established:
  - "Staging buffer pattern for async GPU readback: create buffer, copy, submit, await mapAsync, copy data, destroy"
  - "SBI memory layout: FLAG at 0x05010000, EID at +4, FID at +8, ARGS at +12, RET at +36"

# Metrics
duration: 3min
completed: 2026-03-01
---

# Phase 18 Plan 01: M-mode CSR Constants and SBI Bridge Summary

**M-mode CSR definitions (indices 50-59) and SbiBridge handler for console/reset/base SBI extensions**

## Performance

- **Duration:** 3 min
- **Started:** 2026-03-01T03:17:40Z
- **Completed:** 2026-03-01T03:20:29Z
- **Tasks:** 2
- **Files modified:** 2

## Accomplishments
- Added 10 M-mode CSR constants to shader (CSR_MSTATUS through CSR_MIP)
- Added MSTATUS bit position constants (MIE, MPIE, MPP_MASK)
- Created SbiBridge.js with Console (0x01), System Reset (0x08), and Base (0x10) extension support
- Implemented staging buffer pattern for GPU memory readback

## Task Commits

Each task was committed atomically:

1. **Task 1: Add M-mode CSR constants to shader** - `24f3e2f` (feat)
2. **Task 2: Create SbiBridge.js handler class** - `aa4ef02` (feat)

## Files Created/Modified
- `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl` - Added M-mode CSR constants at indices 50-59
- `systems/visual_shell/web/SbiBridge.js` - New SBI bridge handler class

## Decisions Made
- M-mode CSRs placed at indices 50-59, following Tectonic extensions (46-49) and S-mode CSRs (34-45)
- SbiBridge uses staging buffer pattern from CoreExecutionVerifier for async GPU readback
- Console putchar outputs to browser console.log with newline-triggered flush
- System reset is logged but does not actually reset (browser cannot reboot)

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- M-mode CSR constants ready for trap handling implementation in next plan
- SbiBridge ready for integration with visual shell execution loop
- _get_csr_index() needs to be updated in 18-02 to map M-mode CSR addresses to indices 50-59

---
*Phase: 18-privileged-architecture*
*Completed: 2026-03-01*
