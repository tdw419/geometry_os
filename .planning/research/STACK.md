# Stack Research: Commit-to-File

**Domain:** VM Snapshot Persistence
**Researched:** 2026-03-09
**Confidence:** HIGH (based on official QEMU docs and existing codebase analysis)

## Recommended Stack

### Core Technologies (NEW for commit-to-file)

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| `qemu-img` (subprocess) | QEMU 8.0+ | Extract snapshot from qcow2 to standalone image | Official QEMU tool for snapshot operations; `-s` flag extracts internal snapshots to new files |
| `tempfile.TemporaryDirectory` | stdlib | Intermediate storage during extraction | Safe temp file handling with automatic cleanup; avoids polluting workspace |
| `shutil.copy2` | stdlib | Copy extracted qcow2 to final location | Preserves metadata; atomic for local filesystems |

### Existing Stack (Integration Points)

| Technology | Version | Purpose | How Commit-to-File Uses It |
|------------|---------|---------|----------------------------|
| `VMSnapshotManager` | existing | Create/list/delete QEMU snapshots | Source of snapshot tags to extract |
| `PixelRTSEncoder` | existing | Encode binary data to PNG with Hilbert curve | Encodes extracted qcow2 into .rts.png format |
| `PixelRTSMetadata` | existing | PNG tEXt chunk metadata | Stores snapshot provenance in output file |
| `BootBridge` | existing | Orchestrates FUSE mount + QEMU boot | Provides access to VMSnapshotManager |
| `subprocess.run()` | stdlib | Execute qemu-img commands | Already used throughout codebase |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| `pathlib.Path` | stdlib | Path manipulation | All file operations |
| `dataclasses` | stdlib | Result types | `CommitResult`, `CommitProgress` data structures |
| `logging` | stdlib | Progress reporting | Extraction progress, error handling |

## Installation

No new dependencies required. Commit-to-file uses:
- **stdlib only**: `subprocess`, `tempfile`, `shutil`, `pathlib`, `dataclasses`, `logging`
- **External tool**: `qemu-img` (part of QEMU package, already required for VM operations)

Verify qemu-img availability:
```bash
qemu-img --version  # Should be 8.0+ for best snapshot support
```

## Architecture: Commit-to-File Pipeline

```
1. VM Running with Internal Snapshot
   |
   V  [qemu-img convert -s snapshot_tag]
2. Extracted qcow2 (temp file)
   |
   V  [PixelRTSEncoder.encode()]
3. PNG bytes with Hilbert-encoded qcow2
   |
   V  [Add tEXt metadata: source, snapshot_tag, timestamp]
4. Final .rts.png file
```

### Key Integration: SnapshotFileCommitter

New module at `systems/pixel_compiler/boot/snapshot_committer.py`:

```python
class SnapshotFileCommitter:
    """
    Extracts QEMU internal snapshot to standalone .rts.png file.

    Pipeline:
    1. Validate snapshot exists via VMSnapshotManager.list_snapshots()
    2. Extract snapshot via: qemu-img convert -s <tag> -O qcow2 <source> <temp>
    3. Encode qcow2 to PNG via PixelRTSEncoder
    4. Write to final destination
    """

    def commit_to_file(
        self,
        bridge: BootBridge,
        snapshot_tag: str,
        output_path: Path,
        compress: bool = True
    ) -> CommitResult:
        ...
```

## Alternatives Considered

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| `qemu-img convert -s` | QEMU `migrate file:` | Use migrate for external VMState without disk; convert -s is simpler for internal snapshots |
| `qemu-img convert -s` | `virsh snapshot-dumpxml` + manual extraction | Use virsh only if managing VMs via libvirt; direct qemu-img is simpler |
| qcow2 in PNG | Raw disk in PNG | qcow2 preserves compression and metadata; raw would bloat file size 2-10x |
| subprocess `qemu-img` | python-qemu-img bindings | subprocess is battle-tested in codebase; no additional dependency |

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| `savevm` to create external file | savevm creates internal snapshots in qcow2, not standalone files | `qemu-img convert -s` to extract |
| `qemu-img snapshot -a` | This applies/reverts a snapshot, does not extract it | `qemu-img convert -s` |
| Manual qcow2 parsing | qcow2 format is complex; re-implementing extraction is error-prone | Trust qemu-img tool |
| In-memory extraction for large VMs | 2GB+ VMs can exhaust memory during encoding | Stream via temp file |

## Stack Patterns by Variant

**If VM uses qcow2 with internal snapshots (CURRENT DESIGN):**
- Use `qemu-img convert -s <tag> -O qcow2 <source.qcow2> <output.qcow2>`
- Then encode qcow2 to PNG
- This is the standard QEMU snapshot workflow

**If VM uses external snapshots (backing chain):**
- Use `qemu-img convert -O qcow2 <top_snapshot.qcow2> <flattened.qcow2>`
- No `-s` needed; the top snapshot IS the state
- Flatten backing chain into single file

**If VM uses VMState-only snapshots (no disk):**
- Use `migrate "file:/path/to/vmstate"` from QEMU monitor
- Store .vmstate file directly in PNG
- Cannot boot directly; needs original disk + vmstate

## Version Compatibility

| Package | Compatible With | Notes |
|---------|-----------------|-------|
| qemu-img 8.0+ | All qcow2 versions | Supports `-s` snapshot extraction |
| qemu-img 7.x | qcow2 v3 | Works but slower for large images |
| QEMU 6.x | qcow2 v2/v3 | `-s` option available but less tested |
| Python 3.10+ | All stdlib modules | dataclasses, pathlib fully featured |

## Command Reference

### qemu-img snapshot extraction:
```bash
# List snapshots in qcow2
qemu-img snapshot -l disk.qcow2

# Extract specific snapshot to new file
qemu-img convert -s snapshot_tag -O qcow2 source.qcow2 output.qcow2

# Extract to raw format (larger but universal)
qemu-img convert -s snapshot_tag -O raw source.qcow2 output.raw
```

### Integration with existing code:
```python
# In SnapshotFileCommitter
result = subprocess.run(
    ["qemu-img", "convert", "-s", snapshot_tag, "-O", "qcow2",
     str(qcow2_path), str(temp_qcow2)],
    capture_output=True,
    text=True,
    timeout=300  # 5 min for large images
)
```

## Sources

- [QEMU Official Docs - VM Snapshots](https://www.qemu.org/docs/master/system/images.html) - VM snapshot storage in qcow2, savevm/loadvm commands (HIGH confidence)
- [QEMU Official Docs - qemu-img](https://www.qemu.org/docs/master/tools/qemu-img.html) - convert command with -s option (HIGH confidence)
- Existing codebase: `systems/pixel_compiler/boot/vm_snapshot.py` - VMSnapshotManager patterns (HIGH confidence)
- Existing codebase: `systems/pixel_compiler/pixelrts_v2_core.py` - PixelRTSEncoder usage (HIGH confidence)
- Existing codebase: `systems/pixel_compiler/boot/boot_bridge.py` - BootBridge integration (HIGH confidence)

---
*Stack research for: commit-to-file (VM snapshot persistence to .rts.png)*
*Researched: 2026-03-09*
