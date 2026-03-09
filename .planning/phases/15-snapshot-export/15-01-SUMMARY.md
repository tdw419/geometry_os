---
phase: 15-snapshot-export
plan: 01
subsystem: pixel_compiler/boot
tags: [qemu-img, snapshot, extraction, qcow2]
completed: 2026-03-09
duration: 5 min
---

# Phase 15 Plan 01: QemuImgWrapper for qemu-img Operations Summary

**One-liner:** Created QemuImgWrapper class providing clean Python API for qemu-img operations, specifically extracting QEMU internal snapshots to standalone qcow2 files for PixelRTS encoding.

## What Was Built

### QemuImgWrapper Class

A wrapper class for qemu-img CLI operations located at `systems/pixel_compiler/boot/qemu_img_wrapper.py`:

- **is_available()** - Checks if qemu-img is available in PATH or as absolute path
- **get_version()** - Returns qemu-img version string
- **list_snapshots(qcow2_path)** - Lists internal snapshots in a qcow2 file
- **extract_snapshot(source, tag, output, timeout)** - Extracts snapshot to standalone qcow2

### Supporting Classes

- **QemuImgError** - Exception class for qemu-img operation failures
- **SnapshotExtractResult** - Dataclass with success status, paths, size, and error message

### Test Coverage

17 unit tests covering:
- Availability checking (in PATH, not in PATH, absolute path)
- Snapshot extraction (success, failures, timeout)
- Snapshot listing (parsing, empty output, errors)
- Version retrieval
- Error handling patterns

## Dependencies

### Requires
- Python 3.12+
- qemu-img binary (available in PATH)

### Provides
- `QemuImgWrapper` - Clean API for qemu-img operations
- `SnapshotExtractResult` - Structured extraction results
- `QemuImgError` - Typed exception for errors

### Affects
- Phase 15-02: SnapshotCommitter will use QemuImgWrapper.extract_snapshot()
- Phase 15-03: SnapshotExporter will use extracted qcow2 files

## Files Modified

| File | Action | Lines | Purpose |
|------|--------|-------|---------|
| systems/pixel_compiler/boot/qemu_img_wrapper.py | Created | 315 | QemuImgWrapper class |
| tests/unit/test_qemu_img_wrapper.py | Created | 266 | Unit tests |

## Key Decisions

1. **Result dataclass pattern** - Following vm_snapshot.py pattern of returning result dataclasses instead of raising exceptions for operation failures
2. **Path validation** - Validate source file exists before extraction to provide clear error messages
3. **Directory creation** - Automatically create output directory if needed
4. **Regex parsing** - Use same pattern as VMSnapshotManager for parsing snapshot list output

## Deviations from Plan

None - plan executed exactly as written.

## Next Phase Readiness

- QemuImgWrapper is ready for use by SnapshotCommitter
- Test coverage is comprehensive (17 tests)
- No blockers identified

## Commits

- `5a5d176aae3` - feat(15-01): create QemuImgWrapper for qemu-img operations
- `1880703820a` - test(15-01): add unit tests for QemuImgWrapper
