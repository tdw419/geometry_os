# Phase 15 Plan 02: Snapshot Committer Summary

---
phase: 15-snapshot-export
plan: 02
subsystem: pixel_compiler/boot
tags: [snapshot, commit, vm-pause, qemu, extraction]
completed: 2026-03-09
duration: 7m 39s
---

## One-Liner

SnapshotCommitter orchestrates VM pause/resume and snapshot extraction with guaranteed VM resume on failure.

## Objective

Create SnapshotCommitter class that orchestrates VM pause/resume and snapshot extraction to ensure consistent snapshot state by pausing the VM before extraction and resuming after completion.

## What Was Built

### SnapshotCommitter Class

**File:** `systems/pixel_compiler/boot/snapshot_committer.py` (402 lines)

Core class that manages the commit pipeline with guaranteed cleanup:

```python
class CommitStage(Enum):
    IDLE = "idle"
    CREATING_SNAPSHOT = "creating_snapshot"
    PAUSING_VM = "pausing_vm"
    EXTRACTING = "extracting"
    RESUMING_VM = "resuming_vm"
    COMPLETE = "complete"
    FAILED = "failed"

class SnapshotCommitter:
    def commit(self, output_path: Path, tag: Optional[str] = None) -> CommitResult:
        # Pipeline:
        # 1. Auto-generate tag if None: commit-{YYYYMMDD-HHMMSS}
        # 2. _create_snapshot(tag) - raise SnapshotError on failure
        # 3. _pause_vm() - raise SnapshotError on failure
        # 4. Extract via QemuImgWrapper.extract_snapshot() to temp dir, then rename
        # 5. _resume_vm() ALWAYS (in finally block)
        # 6. Return CommitResult
```

### Key Design Decisions

1. **VM Always Resumed**: The `_resume_vm()` call is in a `finally` block to guarantee VM resume even if extraction fails.

2. **Atomic Output**: Extract to temp file first, then rename to final output path to avoid partial files.

3. **Auto-Generated Tags**: If no tag provided, generate `commit-{YYYYMMDD-HHMMSS}` format.

4. **Progress Callback**: Supports optional callback for progress updates at each pipeline stage.

### Test Coverage

**File:** `tests/unit/test_snapshot_committer.py` (467 lines)

19 tests covering:
- Full pipeline success
- Order verification (snapshot before pause)
- VM pause before extraction
- VM resume after success
- VM resume after extraction failure
- VM not resumed if snapshot creation fails (wasn't paused)
- Auto-generated tag format
- Custom tag usage
- Progress callback at each stage
- Error handling for unbooted VM
- Output directory creation

## Key Links

| From | To | Via | Pattern |
|------|----|----|---------|
| `SnapshotCommitter.commit` | `VMSnapshotManager.create_snapshot` | `boot_bridge.create_snapshot(tag)` | `create_snapshot` |
| `SnapshotCommitter._pause_vm` | `QemuBoot.send_monitor_command` | `qemu.send_monitor_command('stop')` | `send_monitor_command.*stop` |
| `SnapshotCommitter._resume_vm` | `QemuBoot.send_monitor_command` | `qemu.send_monitor_command('cont')` | `send_monitor_command.*cont` |
| `SnapshotCommitter._extract_snapshot` | `QemuImgWrapper.extract_snapshot` | `qemu_img.extract_snapshot(...)` | `extract_snapshot` |

## Decisions Made

1. **Pipeline Order**: create_snapshot -> pause_vm -> extract -> resume_vm
   - Rationale: Snapshot must exist before extraction, VM must be paused during extraction to ensure consistent state

2. **Temp File Pattern**: Extract to `.qcow2.tmp` then rename
   - Rationale: Avoid partial files on failure, atomic rename is fast

3. **Progress Object Mutation**: Progress object is mutated in place
   - Note: Callbacks should capture stage at call time, not store reference

## Files Modified

| File | Action | Lines |
|------|--------|-------|
| `systems/pixel_compiler/boot/snapshot_committer.py` | Created | 402 |
| `tests/unit/test_snapshot_committer.py` | Created | 467 |

## Commits

| Hash | Message |
|------|---------|
| `508d101` | feat(15-02): create SnapshotCommitter class for commit pipeline |
| `3b096af` | test(15-02): add unit tests for SnapshotCommitter |

## Verification Results

```
$ python3 -c "from systems.pixel_compiler.boot.snapshot_committer import SnapshotCommitter, CommitStage, CommitResult; print('SnapshotCommitter imported successfully')"
SnapshotCommitter imported successfully

$ python3 -m pytest tests/unit/test_snapshot_committer.py -v
19 passed in 0.25s
```

## Next Phase Readiness

**Ready for 15-03**: SnapshotExporter with PixelRTS encoding

The SnapshotCommitter provides the `commit()` method that:
- Returns `CommitResult` with `output_path` to extracted qcow2
- Handles VM lifecycle (pause/resume)
- Can be wrapped by SnapshotExporter to add PixelRTS encoding

**Integration Point**: SnapshotExporter will call `SnapshotCommitter.commit()` to get the extracted qcow2, then encode it to PixelRTS format.

## Deviations from Plan

None - plan executed exactly as written.

## Authentication Gates

None.
