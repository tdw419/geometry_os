---
phase: 16-boot-from-committed
plan: 02
subsystem: boot
tags: [kernel, initrd, preservation, pixelrts, metadata, offsets]

# Dependency graph
requires:
  - phase: 16-01
    provides: CommittedFileBooter expects kernel/initrd offsets in metadata
provides:
  - SnapshotExporter captures original kernel/initrd from booted container
  - Metadata includes kernel/initrd offsets for CommittedFileBooter extraction
  - Combined data encoding (qcow2 + kernel + initrd) in single .rts.png
affects:
  - 16-03 (boot from committed file)

# Tech tracking
tech-stack:
  added: []
  patterns:
    - Combined binary encoding with offset metadata
    - Boot file extraction via FUSE mount helper

key-files:
  created: []
  modified:
    - systems/pixel_compiler/boot/snapshot_exporter.py
    - tests/unit/test_snapshot_exporter.py

key-decisions:
  - "Combined data approach: Store kernel/initrd appended to qcow2 data with offsets in metadata"
  - "Size limit: 100MB combined for kernel/initrd to avoid huge files"
  - "Graceful degradation: If extraction fails, continue with disk-only commit"

patterns-established:
  - "Offset metadata pattern: metadata['offsets'] contains kernel/initrd with offset/size/sha256"
  - "has_kernel/has_initrd boolean flags in metadata for quick checks"

# Metrics
duration: 12min
completed: 2026-03-09
---

# Phase 16 Plan 02: Preserve Original Kernel/Initrd in Commit Summary

**Extended SnapshotExporter to capture and store original kernel/initrd from booted containers in committed files, enabling CommittedFileBooter to boot vm-snapshot files with exact boot compatibility.**

## Performance

- **Duration:** 12 min
- **Started:** 2026-03-09T12:35:59Z
- **Completed:** 2026-03-09T12:48:00Z
- **Tasks:** 2
- **Files modified:** 2

## Accomplishments
- Added `_extract_original_boot_files()` method to read kernel/initrd from mounted FUSE filesystem
- Extended `_encode_to_rts()` to combine qcow2 + kernel + initrd with offset metadata
- Added `ExportStage.EXTRACTING_BOOT_FILES` for progress reporting
- Implemented size limit check (100MB combined) with graceful skip
- Added comprehensive test coverage for all kernel/initrd preservation scenarios

## Task Commits

Each task was committed atomically:

1. **Task 1: Extend SnapshotExporter to capture kernel/initrd** - `995838e` (feat)
2. **Task 2: Add tests for kernel/initrd preservation** - `2abd71e` (test)

## Files Created/Modified
- `systems/pixel_compiler/boot/snapshot_exporter.py` - Extended with kernel/initrd extraction and combined encoding
- `tests/unit/test_snapshot_exporter.py` - Added 13 new tests for kernel/initrd preservation

## Decisions Made
- **Combined data approach**: Store kernel/initrd appended to qcow2 data with offsets in metadata, rather than separate files or segments
- **Size limit**: 100MB combined for kernel/initrd to prevent huge committed files
- **Metadata structure**: `metadata["offsets"]["kernel"]` and `metadata["offsets"]["initrd"]` with offset/size/sha256, plus `has_kernel`/`has_initrd` boolean flags

## Deviations from Plan

None - plan executed exactly as written.

## Issues Encountered
None - implementation followed plan specification precisely.

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- SnapshotExporter now captures kernel/initrd with offsets matching CommittedFileBooter expectations
- Ready for 16-03 to test full boot-from-committed workflow
- CommittedFileBooter from 16-01 expects `metadata["offsets"]` with kernel/initrd keys

---
*Phase: 16-boot-from-committed*
*Plan: 02*
*Completed: 2026-03-09*
