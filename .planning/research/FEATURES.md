# Feature Research: Commit-to-File (v1.5)

**Domain:** VM snapshot persistence to portable container format
**Researched:** 2026-03-09
**Confidence:** MEDIUM (based on existing codebase patterns and QEMU documentation)

## Executive Summary

Commit-to-file enables persisting a running VM's state (memory + disk changes) to a new portable `.rts.png` file. This bridges the gap between QEMU's internal snapshots (which live inside qcow2 files) and PixelRTS's portable PNG containers. The key challenge is combining VM memory state + disk delta into a single bootable container that maintains format compatibility.

## Feature Landscape

### Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| Export snapshot to new file | "I made changes, save them" is fundamental | HIGH | Combines VM state + disk changes into PNG |
| Boot from committed file | Committed file should boot like original | MEDIUM | Reuse existing BootBridge infrastructure |
| Preserve disk changes | User modifications must survive | MEDIUM | Delta between original and current state |
| Metadata preservation | Container info should carry forward | LOW | Copy + update segments metadata |
| SHA256 verification | Trust the new container | LOW | Rehash segments, update manifest |

### Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valuable.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| One-command commit workflow | `pixelrts commit <container> <output.png>` | MEDIUM | Single CLI call, no manual steps |
| Visual diff integration | See what changed before committing | LOW | Leverage existing `pixelrts diff` |
| Incremental commits | Only save delta from base | HIGH | Reduces file size, faster commits |
| Snapshot chaining | Create lineage of related containers | MEDIUM | Track parent/child relationships |
| Compressed commits | Smaller files for distribution | MEDIUM | Use existing compression module |
| Progress visibility | Know commit is working | LOW | Rich progress bar like boot |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem good but create problems.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| Live migration to file | "Commit without stopping" | VM consistency issues, complex state serialization | Pause -> commit -> resume pattern |
| In-place commit | "Update the original file" | Data loss risk, breaks immutability model | Always create new file |
| Multi-container atomic commit | "Commit all linked VMs together" | Distributed snapshot coordination is complex | Commit containers individually |
| Cloud provider integration | "Push to S3/GCS" | Scope creep, out of scope per PROJECT.md | Local file output, user handles upload |
| Commit to non-PNG format | "Export to OVA/VMDK" | Defeats visual container purpose | Stay with .rts.png format |

## Feature Dependencies

```
[COMMIT-01: Basic commit]
    └──requires──> [VMSnapshotManager (v1.4)]
    └──requires──> [PixelRTSEncoder (v1.0)]
    └──requires──> [qemu-img convert]

[Incremental commits]
    └──requires──> [COMMIT-01: Basic commit]
    └──requires──> [Delta manifest (v1.2)]

[Snapshot chaining]
    └──requires──> [COMMIT-01: Basic commit]
    └──requires──> [Metadata schema extension]

[Compressed commits]
    └──requires──> [COMMIT-01: Basic commit]
    └──requires──> [pixelrts_compression module]
```

### Dependency Notes

- **COMMIT-01 requires VMSnapshotManager:** Must be able to create snapshot before exporting
- **COMMIT-01 requires PixelRTSEncoder:** Need to encode combined data back to PNG format
- **COMMIT-01 requires qemu-img convert:** QEMU tool for exporting snapshot from qcow2 to raw
- **Incremental commits requires Delta manifest:** v1.2 DELTA features provide the comparison infrastructure
- **Compressed commits requires compression module:** `pixelrts_compression` already exists for other features

## MVP Definition

### Launch With (v1.5)

Minimum viable product - what's needed to validate the concept.

- [ ] **COMMIT-01: Basic commit** - Export running VM to new `.rts.png` file
  - CLI: `pixelrts commit <container> <output.rts.png>`
  - Pauses VM, exports state, resumes VM
  - Creates bootable container with all changes

- [ ] **COMMIT-02: Boot from committed** - Verify committed containers boot correctly
  - Committed file works with existing `pixelrts boot`
  - Preserves kernel/initrd from original
  - Disk changes visible after boot

- [ ] **COMMIT-03: Progress visibility** - User sees commit progress
  - Rich progress bar during export
  - Shows: snapshot creation, disk export, encoding, verification

### Add After Validation (v1.6)

Features to add once core is working.

- [ ] **Incremental commits** - Only save delta from base container
  - Smaller files for repeated commits
  - Track base container in metadata

- [ ] **Snapshot chaining** - Parent/child relationships
  - `parent_hash` field in metadata
  - `pixelrts lineage <container>` shows history

### Future Consideration (v2+)

Features to defer until product-market fit is established.

- [ ] **Ephemeral boot from snapshot** - EPHEM-01 from Future requirements
  - Boot with changes discarded on stop
  - Useful for testing without polluting base

- [ ] **Compressed commits** - Smaller files for distribution
  - Leverage existing compression module
  - Trade-off: commit time vs file size

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Priority |
|---------|------------|---------------------|----------|
| Basic commit (COMMIT-01) | HIGH | HIGH | P1 |
| Boot from committed (COMMIT-02) | HIGH | MEDIUM | P1 |
| Progress visibility (COMMIT-03) | MEDIUM | LOW | P1 |
| Incremental commits | MEDIUM | HIGH | P2 |
| Snapshot chaining | LOW | MEDIUM | P2 |
| Compressed commits | LOW | MEDIUM | P3 |
| Visual diff before commit | MEDIUM | LOW | P2 |

**Priority key:**
- P1: Must have for v1.5 launch
- P2: Should have, add in v1.6
- P3: Nice to have, future consideration

## Technical Approach

### Commit Pipeline

```
1. Validate container is running
2. Create internal QEMU snapshot (savevm)
3. Export qcow2 snapshot to temporary raw file (qemu-img convert -l snapshot.name)
4. Combine: original segments + disk delta
5. Encode to PNG (PixelRTSEncoder)
6. Verify new container boots
7. Cleanup temporary files
```

### Key Technical Challenges

| Challenge | Approach | Risk |
|-----------|----------|------|
| Disk delta extraction | `qemu-img convert -l snapshot_tag` from qcow2 | MEDIUM - Need qcow2 backing |
| Memory state inclusion | QEMU internal snapshot includes memory | LOW - Already works |
| Format compatibility | Reuse PixelRTSEncoder with updated segments | LOW - Existing infrastructure |
| Large file handling | Stream encoding, don't load all in memory | MEDIUM - May need chunking |
| Boot from FUSE-mounted original | Extract kernel/initrd paths from mount | LOW - BootBridge already does this |

### Critical Insight: qcow2 Requirement

Current direct kernel boot (from FUSE) may not support QEMU snapshots without a qcow2 disk. The v1.4 implementation works because containers use disk images. For commit-to-file:

- **If container has qcow2 disk:** Use `qemu-img convert -l snapshot_tag` to export
- **If container is FUSE-only:** May need to add temporary qcow2 for snapshot storage

This needs verification during implementation.

## Competitor Feature Analysis

| Feature | Docker commit | Vagrant package | Our Approach |
|---------|---------------|-----------------|--------------|
| Export running state | Yes (pause optional) | Yes (halt required) | Pause required for consistency |
| Output format | Layered image | .box file | .rts.png visual container |
| Verification | Image hash | Box checksum | SHA256 + visual diff |
| Size optimization | Layered deltas | Full package | Full or incremental |

## Sources

### Primary (HIGH confidence)
- Codebase: `vm_snapshot.py` - VMSnapshotManager with savevm/loadvm/delvm
- Codebase: `snapshot_storage.py` - SnapshotMetadata persistence pattern
- Codebase: `pixelrts_v2_core.py` - PixelRTSEncoder/Decoder infrastructure
- Codebase: `boot_bridge.py` - FUSE mount + QEMU boot orchestration

### Secondary (MEDIUM confidence)
- QEMU Documentation: `qemu-img convert -l` for snapshot export
- Codebase: `12-RESEARCH.md` - Phase 12 research on QEMU snapshots
- PROJECT.md: v1.4 validated features context

### Tertiary (LOW confidence)
- None - all findings grounded in codebase

---
*Feature research for: PixelRTS v1.5 Commit-to-File*
*Researched: 2026-03-09*
