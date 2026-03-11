---
phase: 16-boot-from-committed
plan: 04
subsystem: vm-boot
tags: [pixelrts, binary-extraction, kernel, initrd, offsets, hash-verification]

# Dependency graph
requires:
  - phase: 16-01
    provides: CommittedFileBooter basic structure
  - phase: 16-02
    provides: SnapshotExporter kernel/initrd preservation with combined data encoding
  - phase: 16-03
    provides: CLI integration
provides:
  - Binary extraction of kernel/initrd from combined payload
  - disk_size trimming for qcow2 extraction
  - SHA256 hash verification during extraction
affects:
  - future phases that boot committed files with embedded kernel/initrd

# Tech tracking
tech-stack:
  added: []
  patterns:
    - Offset-based binary extraction from combined payload
    - SHA256 hash verification for integrity
    - disk_size metadata for qcow2 trimming

key-files:
  created: []
  modified:
    - systems/pixel_compiler/boot/committed_boot.py
    - tests/unit/test_committed_boot.py

key-decisions:
  - "Extract kernel/initrd from combined binary using offset metadata"
  - "Trim qcow2 to disk_size bytes (combined data = qcow2 + kernel + initrd)"
  - "Verify SHA256 hash during extraction if present in metadata"
  - "Return None if kernel/initrd not stored (graceful degradation)"

patterns-established:
  - "Store decoder instance after decode for later extraction operations"
  - "Separate _extract_kernel and _extract_initrd methods for clarity"

# Metrics
duration: 14min
completed: 2026-03-09
---

# Phase 16 Plan 04: Fix Kernel/Initrd Extraction from Committed Files Summary

**CommittedFileBooter now correctly extracts kernel/initrd from the committed file's binary data using offset metadata, and trims qcow2 extraction to disk_size bytes**

## Performance

- **Duration:** 14 min
- **Started:** 2026-03-09T13:24:10Z
- **Completed:** 2026-03-09T13:38:15Z
- **Tasks:** 4
- **Files modified:** 2

## Accomplishments
- CommittedFileBooter stores decoder and metadata after decode for later extraction
- extract_qcow2() trims to disk_size bytes from metadata
- _extract_kernel() extracts bytes using offset metadata with hash verification
- _extract_initrd() extracts bytes using offset metadata with hash verification
- boot() uses extracted kernel/initrd with QEMU
- 42 unit tests covering all extraction paths

## Task Commits

Each task was committed atomically:

1. **Task 1: Store decoder and metadata after decode** - `b14e8de` (feat)
2. **Task 2: Add _extract_kernel and _extract_initrd methods** - `a72d632` (feat)
3. **Task 3: Update boot() to use extracted kernel/initrd** - `14cd21a` (feat)
4. **Task 4: Add tests for kernel/initrd extraction** - `0129ef3` (test)

## Files Created/Modified
- `systems/pixel_compiler/boot/committed_boot.py` - Added _decoder, _decoded_metadata, _decoded_data instance variables; modified extract_qcow2() to trim and store; added _extract_kernel() and _extract_initrd() methods; updated boot() to use extraction
- `tests/unit/test_committed_boot.py` - Added 14 new tests for kernel/initrd extraction, disk_size trimming, and full roundtrip; fixed existing tests to provide proper mock metadata

## Decisions Made
- Store decoder instance after decode to enable multiple extraction operations
- Use offset metadata from SnapshotExporter to locate kernel/initrd in combined binary
- Trim qcow2 to disk_size bytes since combined data includes kernel/initrd appended
- Verify SHA256 hash during extraction if present in metadata
- Gracefully handle missing kernel/initrd (return None, log warning)

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Fixed existing tests not providing proper mock metadata**

- **Found during:** Task 4 test execution
- **Issue:** Existing tests test_boot_success and test_boot_qemu_failure mocked PixelRTSDecoder but didn't set up get_metadata() return value, causing hash verification errors
- **Fix:** Added mock_decoder.get_metadata.return_value with proper offsets dict (empty for no kernel/initrd)
- **Files modified:** tests/unit/test_committed_boot.py
- **Commit:** 0129ef3

## Issues Encountered
- Existing tests needed mock metadata to work with new extraction logic

## User Setup Required

None - no external service configuration required.

## Next Phase Readiness
- CommittedFileBooter now fully supports booting committed files with embedded kernel/initrd
- Full roundtrip working: SnapshotExporter creates combined binary -> CommittedFileBooter extracts all pieces
- Phase 16 complete - ready for Phase 17 (final verification)

## Key Truths Verified

1. **CommittedFileBooter extracts qcow2 trimmed to disk_size bytes** - extract_qcow2() reads disk_size from metadata and slices decoded_data[:disk_size]
2. **CommittedFileBooter extracts kernel bytes using offsets from metadata** - _extract_kernel() reads offsets.kernel.offset and size, extracts bytes
3. **CommittedFileBooter extracts initrd bytes using offsets from metadata** - _extract_initrd() reads offsets.initrd.offset and size, extracts bytes
4. **CommittedFileBooter writes extracted kernel/initrd to temp files** - Both methods write to output_dir/kernel and output_dir/initrd
5. **CommittedFileBooter uses extracted kernel/initrd with QEMU boot** - boot() calls _extract_kernel() and _extract_initrd() and passes paths to QemuBoot

---
*Phase: 16-boot-from-committed*
*Completed: 2026-03-09*
