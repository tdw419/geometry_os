# Architecture Research

**Domain:** PixelRTS Commit-to-File
**Researched:** 2026-03-09
**Confidence:** HIGH

## System Overview

```
                                    COMMIT-TO-FILE ARCHITECTURE
                                    ============================

┌─────────────────────────────────────────────────────────────────────────────┐
│                              CLI LAYER                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐                                                        │
│  │ pixelrts commit │ ──→ Creates .rts.png snapshot file from running VM     │
│  └────────┬────────┘                                                        │
└───────────┼─────────────────────────────────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                         COORDINATION LAYER                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌────────────────────┐      ┌─────────────────────────────────────────┐   │
│  │  MultiBootManager  │ ──→  │  NEW: SnapshotCommitter                 │   │
│  │  (existing)        │      │  - Orchestrates commit pipeline         │   │
│  │  - owns BootBridge │      │  - Calls VMSnapshotManager              │   │
│  │  - manages VMs     │      │  - Calls qemu-img convert               │   │
│  └────────┬───────────┘      │  - Calls PixelRTSEncoder                │   │
│           │                  └─────────────────────────────────────────┘   │
└───────────┼─────────────────────────────────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                           BOOT LAYER                                         │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌────────────────────┐      ┌─────────────────────────────────────────┐   │
│  │    BootBridge      │ ──→  │     VMSnapshotManager (existing)        │   │
│  │  - owns QemuBoot   │      │     - create_snapshot() → savevm        │   │
│  │  - owns MountHelper│      │     - list_snapshots() → info snapshots │   │
│  │  - create_snapshot │      │     - SnapshotResult with metadata      │   │
│  └────────┬───────────┘      └─────────────────────────────────────────┘   │
│           │                                                                  │
│           ▼                                                                  │
│  ┌────────────────────┐      ┌─────────────────────────────────────────┐   │
│  │     QemuBoot       │ ──→  │     QEMU Monitor Commands               │   │
│  │  - send_monitor_   │      │     - savevm <tag>  (internal snapshot) │   │
│  │    command()       │      │     - info snapshots (list internal)    │   │
│  │  - boot/stop       │      │                                          │   │
│  └────────────────────┘      └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
            │
            ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                         ENCODING LAYER                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│  ┌────────────────────┐      ┌─────────────────────────────────────────┐   │
│  │  qemu-img convert  │ ──→  │     PixelRTSEncoder (existing)          │   │
│  │  -l snapshot_name  │      │     - encode(data, metadata)            │   │
│  │  -O qcow2          │      │     - Hilbert curve mapping             │   │
│  │  → extracted.qcow2 │      │     - PNG tEXt chunks for metadata      │   │
│  └────────┬───────────┘      └─────────────────────────────────────────┘   │
│           │                                                                  │
│           ▼                                                                  │
│  ┌────────────────────┐                                                     │
│  │  Output: .rts.png  │  ← New snapshot file with embedded qcow2 data      │
│  └────────────────────┘                                                     │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

| Component | Responsibility | Existing/New |
|-----------|----------------|--------------|
| **CLI (`pixelrts commit`)** | Parse arguments, invoke MultiBootManager | NEW |
| **SnapshotCommitter** | Orchestrate: snapshot → extract → encode | NEW |
| **VMSnapshotManager** | Create internal QEMU snapshots via monitor | EXISTING |
| **BootBridge** | Provide access to QemuBoot + VMSnapshotManager | EXISTING |
| **QemuBoot** | Execute qemu-img commands, manage QEMU process | EXISTING (extend) |
| **PixelRTSEncoder** | Encode binary data to .rts.png format | EXISTING |
| **SnapshotStorage** | Persist snapshot metadata to JSON | EXISTING |

## Commit Pipeline Flow

### Data Flow

```
┌──────────────────────────────────────────────────────────────────────────┐
│                        COMMIT PIPELINE                                    │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  1. CREATE INTERNAL SNAPSHOT                                             │
│     ┌─────────────┐     ┌─────────────────┐     ┌──────────────────┐    │
│     │ Running VM  │ ──→ │ savevm <tag>    │ ──→ │ Internal snapshot│    │
│     │ (qcow2)     │     │ via monitor     │     │ embedded in qcow2│    │
│     └─────────────┘     └─────────────────┘     └──────────────────┘    │
│                                                                          │
│  2. EXTRACT SNAPSHOT TO SEPARATE FILE                                    │
│     ┌──────────────────┐     ┌─────────────────────────────────────┐    │
│     │ qemu-img convert │ ──→ │ Extract snapshot to separate qcow2  │    │
│     │ -l <tag>         │     │ -l snapshot_name source.qcow2 out   │    │
│     │ -O qcow2         │     │                                     │    │
│     └──────────────────┘     └─────────────────────────────────────┘    │
│                                                                          │
│  3. ENCODE TO PIXELRTS                                                   │
│     ┌─────────────────┐     ┌─────────────────────────────────────┐    │
│     │ Read qcow2 file │ ──→ │ PixelRTSEncoder.encode(data, meta)  │    │
│     │ as binary       │     │ → .rts.png with Hilbert encoding    │    │
│     └─────────────────┘     └─────────────────────────────────────┘    │
│                                                                          │
│  4. PERSIST METADATA                                                     │
│     ┌─────────────────┐     ┌─────────────────────────────────────┐    │
│     │ SnapshotMetadata│ ──→ │ SnapshotStorage.save_metadata()     │    │
│     │ (tag, date, etc)│     │ → /tmp/pixelrts/snapshots/...       │    │
│     └─────────────────┘     └─────────────────────────────────────┘    │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

### Key Integration Points

| Integration Point | Existing Component | New Integration |
|-------------------|-------------------|-----------------|
| Create snapshot | `VMSnapshotManager.create_snapshot()` | Called by SnapshotCommitter |
| Extract snapshot | `qemu-img convert -l <tag>` | NEW: Add to QemuBoot or SnapshotCommitter |
| Encode to PNG | `PixelRTSEncoder.encode()` | Called by SnapshotCommitter |
| Store metadata | `SnapshotStorage.save_metadata()` | Called by SnapshotCommitter |
| CLI command | `pixelrts snapshot` (existing) | NEW: `pixelrts commit` |

## Integration with Existing Architecture

### Existing Components (No Modification)

1. **VMSnapshotManager** (`systems/pixel_compiler/boot/vm_snapshot.py`)
   - Already provides `create_snapshot(tag)` → `savevm`
   - Already provides `list_snapshots()` → `info snapshots`
   - Returns `SnapshotResult` with `VMSnapshotMetadata`

2. **BootBridge** (`systems/pixel_compiler/boot/boot_bridge.py`)
   - Already exposes `_snapshot_manager` property
   - Already has `create_snapshot(tag)` method
   - Composition: wraps QemuBoot + MountHelper

3. **PixelRTSEncoder** (`systems/pixel_compiler/pixelrts_v2_core.py`)
   - Already provides `encode(data, metadata, grid_size)`
   - Returns PNG bytes with Hilbert-encoded data
   - Metadata stored in tEXt chunks

4. **SnapshotStorage** (`systems/pixel_compiler/boot/snapshot_storage.py`)
   - Already provides `save_metadata(container, metadata)`
   - Persists to `/tmp/pixelrts/snapshots/<container>/metadata.json`

### New Components

1. **SnapshotCommitter** (`systems/pixel_compiler/boot/snapshot_committer.py`)
   ```python
   class SnapshotCommitter:
       """Orchestrates commit pipeline: snapshot → extract → encode"""

       def __init__(self, boot_bridge: BootBridge):
           self.bridge = boot_bridge

       def commit(self, tag: str, output_path: Path) -> CommitResult:
           # 1. Create internal snapshot
           snap_result = self.bridge.create_snapshot(tag)

           # 2. Extract snapshot to qcow2
           qcow2_path = self._extract_snapshot(tag)

           # 3. Encode to .rts.png
           rts_png = self._encode_to_rts(qcow2_path, output_path)

           # 4. Persist metadata
           self._save_metadata(tag, rts_png)

           return CommitResult(success=True, path=rts_png)
   ```

2. **qemu-img extract wrapper** (in QemuBoot or SnapshotCommitter)
   ```python
   def extract_snapshot(self, tag: str, output_path: Path) -> Path:
       """Extract internal snapshot to separate qcow2 file."""
       cmd = [
           "qemu-img", "convert",
           "-l", tag,                    # Snapshot parameter
           "-O", "qcow2",                # Output format
           str(self.image_path),         # Source qcow2
           str(output_path)              # Output file
       ]
       subprocess.run(cmd, check=True)
       return output_path
   ```

3. **CLI Command** (`pixelrts_v2/tools/pixelrts.py`)
   ```python
   def cmd_commit(self, container: str, tag: str, output: str) -> int:
       """Commit snapshot to .rts.png file."""
       # Get BootBridge from MultiBootManager
       bridge = self.manager.get_container(container)
       committer = SnapshotCommitter(bridge)
       result = committer.commit(tag, Path(output))
       # ...
   ```

## Recommended Build Order

Based on dependencies and existing architecture:

### Phase 1: qemu-img Extract Wrapper
**Files:** Extend `QemuBoot` or create new module
**Dependencies:** None (standalone)
**Deliverable:** Function to extract internal snapshot to separate qcow2

```
qemu-img convert -l <snapshot_name> -O qcow2 source.qcow2 output.qcow2
```

### Phase 2: SnapshotCommitter Class
**Files:** `systems/pixel_compiler/boot/snapshot_committer.py`
**Dependencies:** Phase 1, existing VMSnapshotManager, PixelRTSEncoder
**Deliverable:** `commit()` method that orchestrates full pipeline

### Phase 3: CLI Integration
**Files:** `pixelrts_v2/tools/pixelrts.py`
**Dependencies:** Phase 2, MultiBootManager
**Deliverable:** `pixelrts commit <container> <tag> --output <file>`

### Phase 4: Metadata Enhancement
**Files:** `SnapshotStorage`, `SnapshotMetadata`
**Dependencies:** Phase 2
**Deliverable:** Track committed snapshot files, file paths, checksums

## Architectural Patterns

### Pattern 1: Composition Over Inheritance

**What:** SnapshotCommitter composes existing components rather than extending them.
**When:** Always - minimizes changes to existing tested code.
**Trade-offs:** Slightly more indirection, but better testability and isolation.

```python
# GOOD: Composition
class SnapshotCommitter:
    def __init__(self, bridge: BootBridge):
        self.bridge = bridge  # Use existing interface

    def commit(self, tag: str, output: Path):
        self.bridge.create_snapshot(tag)  # Delegates to VMSnapshotManager
        # ...

# BAD: Inheritance
class BootBridgeWithCommit(BootBridge):
    def commit(self, tag: str, output: Path):
        # Duplicates logic, harder to test
```

### Pattern 2: Pipeline with Result Types

**What:** Each pipeline stage returns a typed result object.
**When:** Multi-step operations with potential failure points.
**Trade-offs:** More boilerplate, but explicit error handling.

```python
@dataclass
class CommitResult:
    success: bool
    snapshot_path: Optional[Path] = None
    qcow2_path: Optional[Path] = None
    rts_png_path: Optional[Path] = None
    error_message: Optional[str] = None
    metadata: Optional[VMSnapshotMetadata] = None
```

### Pattern 3: Temp File Management

**What:** Use temp directory for intermediate qcow2, clean up after encoding.
**When:** Pipeline produces intermediate artifacts.
**Trade-offs:** Requires cleanup logic, but avoids polluting workspace.

```python
def commit(self, tag: str, output: Path) -> CommitResult:
    with tempfile.TemporaryDirectory() as tmpdir:
        qcow2_path = Path(tmpdir) / f"{tag}.qcow2"
        self._extract_snapshot(tag, qcow2_path)
        # qcow2_path auto-cleaned when exiting context
        return self._encode_to_rts(qcow2_path, output)
```

## Anti-Patterns to Avoid

### Anti-Pattern 1: Modifying Running VM Disk

**What people do:** Try to copy qcow2 while VM is running.
**Why it's wrong:** Corrupts disk image, undefined behavior.
**Do this instead:** Use `savevm` to create consistent internal snapshot, then extract with `qemu-img convert -l`.

### Anti-Pattern 2: Skipping Internal Snapshot

**What people do:** Try to read qcow2 directly without `savevm`.
**Why it's wrong:** Inconsistent state, may miss in-memory changes.
**Do this instead:** Always create internal snapshot first with `VMSnapshotManager.create_snapshot()`.

### Anti-Pattern 3: Large Temp Files in /tmp

**What people do:** Extract multi-GB qcow2 to /tmp without cleanup.
**Why it's wrong:** Fills up temp partition, crashes system.
**Do this instead:** Use `tempfile.TemporaryDirectory()` context manager for auto-cleanup, or allow configurable temp location.

### Anti-Pattern 4: Blocking CLI on Long Operations

**What people do:** Synchronous commit with no progress feedback.
**Why it's wrong:** User thinks CLI is hung for multi-GB snapshots.
**Do this instead:** Show progress: "Creating snapshot...", "Extracting...", "Encoding...".

## File Size Considerations

| VM Memory | Internal Snapshot Size | Extracted qcow2 | .rts.png Size | Time Estimate |
|-----------|----------------------|-----------------|---------------|---------------|
| 512M | ~500MB | ~500MB | ~500MB | ~5s |
| 2G | ~2GB | ~2GB | ~2GB | ~15s |
| 8G | ~8GB | ~8GB | ~8GB | ~60s |

**Note:** PixelRTS encoding adds minimal overhead (<1%) but requires sufficient RAM for Hilbert LUT generation.

## Sources

- [QEMU qemu-img Documentation](https://www.qemu.org/docs/master/tools/qemu-img.html) - Confirmed `-l SNAPSHOT_PARAM` option for snapshot extraction
- Existing codebase: `vm_snapshot.py`, `boot_bridge.py`, `pixelrts_v2_core.py`, `snapshot_storage.py`

---
*Architecture research for: PixelRTS Commit-to-File*
*Researched: 2026-03-09*
