# Project Research Summary

**Project:** PixelRTS Commit-to-File (v1.5)
**Domain:** VM Snapshot Persistence to Portable Container Format
**Researched:** 2026-03-09
**Confidence:** HIGH

## Executive Summary

Commit-to-file enables exporting a running VM's state (memory + disk changes) to a new portable `.rts.png` file. This bridges the gap between QEMU's internal snapshots (embedded in qcow2 files) and PixelRTS's portable PNG containers. The core technical challenge is extracting QEMU's internal snapshot format into a standalone, portable representation that can be encoded via the existing PixelRTSEncoder.

The recommended approach uses `qemu-img convert -l <snapshot_tag>` to extract internal snapshots to standalone qcow2 files, then encodes via the existing Hilbert curve mapping infrastructure. This leverages existing components (VMSnapshotManager, BootBridge, PixelRTSEncoder) with minimal modifications, using composition over inheritance for the new SnapshotCommitter orchestrator.

Key risks include memory state size explosion (4GB VM = 4GB PNG), snapshot format incompatibility between QEMU versions, and state inconsistency if the VM continues running during commit. These are mitigated through streaming encoding, VM pause during commit, and clear format versioning in PNG metadata.

## Key Findings

### Recommended Stack

No new dependencies required. The commit-to-file feature uses stdlib only (`subprocess`, `tempfile`, `shutil`, `pathlib`, `dataclasses`, `logging`) plus `qemu-img` (already required for VM operations).

**Core technologies:**
- **qemu-img convert -s/-l**: Extract internal QEMU snapshots to standalone qcow2 files
- **tempfile.TemporaryDirectory**: Safe intermediate storage with automatic cleanup
- **PixelRTSEncoder (existing)**: Encode binary qcow2 to .rts.png with Hilbert curve mapping
- **VMSnapshotManager (existing)**: Create/list QEMU internal snapshots via monitor commands
- **BootBridge (existing)**: Orchestrates FUSE mount + QEMU boot, provides VMSnapshotManager access

### Expected Features

**Must have (table stakes):**
- Export snapshot to new file (COMMIT-01) - "I made changes, save them" is fundamental
- Boot from committed file (COMMIT-02) - Committed file should boot like original
- Progress visibility (COMMIT-03) - User sees commit progress, not a frozen CLI

**Should have (differentiators):**
- One-command commit workflow - Single CLI call, no manual steps
- Incremental commits - Only save delta from base (smaller files)
- Snapshot chaining - Track parent/child relationships

**Defer (v2+):**
- Compressed commits - Leverage existing compression module for smaller files
- Ephemeral boot from snapshot - Boot with changes discarded on stop
- Visual diff before commit - Leverage existing `pixelrts diff`

### Architecture Approach

The architecture follows a layered pipeline: CLI Layer -> Coordination Layer (SnapshotCommitter) -> Boot Layer (VMSnapshotManager, BootBridge) -> Encoding Layer (qemu-img, PixelRTSEncoder). A new SnapshotCommitter class orchestrates the commit pipeline by composing existing components rather than extending them.

**Major components:**
1. **SnapshotCommitter (NEW)** - Orchestrates: snapshot -> extract -> encode -> persist metadata
2. **VMSnapshotManager (existing)** - Create internal QEMU snapshots via `savevm` monitor command
3. **qemu-img convert (external)** - Extract snapshot from qcow2 with `-l snapshot_name` flag
4. **PixelRTSEncoder (existing)** - Encode binary data to .rts.png with Hilbert curve mapping

### Critical Pitfalls

1. **Internal Snapshot Format Incompatibility** - QEMU's `savevm` snapshots are NOT portable between versions/hosts. Use `qemu-img convert -l` to export to standalone format before encoding.

2. **Memory State Size Explosion** - 4GB VM = ~4GB PNG, exceeding practical limits. Implement streaming encoding, set memory limits (recommend 2GB max initially), and pre-validate size.

3. **Snapshot State Inconsistency** - VM continues running during export = corrupted snapshot. Pause VM with `stop` monitor command before export, resume with `cont` after.

4. **PixelRTS v2 Format Compatibility** - VM snapshots don't map cleanly to kernel/initrd/disk boot flow. Define new container type ("vm-snapshot" vs "bootable") in tEXt metadata, create separate `pixelrts restore` command.

5. **VMSnapshotManager Integration Conflicts** - Committed files are external artifacts that don't fit existing metadata model. Extend SnapshotMetadata with `committed_path` field, dual-source listing.

## Implications for Roadmap

Based on research, suggested phase structure:

### Phase 1: Core Export Infrastructure
**Rationale:** Must establish correct export format before any encoding work. Size constraints and consistency guarantees must be validated upfront.
**Delivers:** Function to extract internal QEMU snapshot to standalone qcow2, streaming encoding support, VM pause/resume during commit
**Addresses:** COMMIT-01 (basic commit export)
**Avoids:** Pitfalls 1 (format incompatibility), 2 (size explosion), 4 (state inconsistency)

### Phase 2: Format Integration
**Rationale:** Must define format extension before implementing full pipeline. Ensures committed files are distinguishable from bootable containers.
**Delivers:** Extended PixelRTS format spec with "vm-snapshot" container type, separate restore path
**Uses:** PixelRTSEncoder with updated metadata schema
**Implements:** Format versioning in PNG tEXt chunks
**Avoids:** Pitfall 3 (format compatibility breakage)

### Phase 3: SnapshotCommitter Pipeline
**Rationale:** Orchestrator class that composes existing components. Depends on Phase 1 extract function and Phase 2 format definition.
**Delivers:** `SnapshotCommitter.commit(tag, output_path)` method, full pipeline orchestration
**Uses:** VMSnapshotManager, qemu-img extract wrapper, PixelRTSEncoder, SnapshotStorage
**Addresses:** COMMIT-01 (basic commit), COMMIT-03 (progress visibility)

### Phase 4: CLI Integration
**Rationale:** User-facing command depends on complete pipeline. Must extend metadata model for dual-source listing.
**Delivers:** `pixelrts commit <container> <tag> --output <file>` command, `pixelrts restore` command
**Uses:** MultiBootManager, SnapshotCommitter
**Addresses:** COMMIT-02 (boot from committed), one-command workflow differentiator
**Avoids:** Pitfall 5 (VMSnapshotManager integration conflicts)

### Phase 5: Verification & Polish
**Rationale:** Cross-host restore testing, signature verification, error recovery cleanup. Often overlooked but critical for production.
**Delivers:** Cross-host restore tests, checksum verification, signature support, cleanup on failure
**Addresses:** COMMIT-02 (boot verification), security requirements

### Phase Ordering Rationale

- Phase 1 comes first because format extraction is foundational - everything else depends on correct export
- Phase 2 defines the contract before implementation to avoid format breakage
- Phase 3 implements the core logic once infrastructure and format are settled
- Phase 4 exposes functionality to users once pipeline is proven
- Phase 5 validates end-to-end functionality before release

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 2:** Format spec extension needs careful design - review PIXELRTS_V2_SPEC.md for extension points
- **Phase 5:** Cross-host restore compatibility - may need QEMU version detection logic

Phases with standard patterns (skip research-phase):
- **Phase 1:** Well-documented qemu-img convert workflow
- **Phase 3:** Standard composition pattern, existing codebase patterns are clear
- **Phase 4:** Standard CLI integration, existing `pixelrts` commands provide templates

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | stdlib only + qemu-img, verified with QEMU docs and existing codebase |
| Features | MEDIUM | Based on codebase patterns and QEMU docs; FUSE-only containers may need special handling |
| Architecture | HIGH | Existing components well-documented, composition pattern is clear |
| Pitfalls | HIGH | QEMU snapshot portability is well-documented issue, size limits are calculable |

**Overall confidence:** HIGH

### Gaps to Address

- **FUSE-only containers:** Current direct kernel boot from FUSE may not support QEMU snapshots without a qcow2 disk. Need to verify during Phase 1 if temporary qcow2 is required.
- **Streaming encoding limits:** PixelRTSEncoder currently loads data in memory. Need to verify streaming support or implement chunked processing for large VMs.
- **Cross-host QEMU version compatibility:** Even with proper export format, QEMU version differences may cause restore issues. Document minimum QEMU version requirements.

## Sources

### Primary (HIGH confidence)
- QEMU Official Docs - VM Snapshots (qemu.org/docs/master/system/images.html) - savevm/loadvm commands
- QEMU Official Docs - qemu-img (qemu.org/docs/master/tools/qemu-img.html) - convert command with -s/-l option
- Existing codebase: `vm_snapshot.py` - VMSnapshotManager patterns
- Existing codebase: `pixelrts_v2_core.py` - PixelRTSEncoder usage
- Existing codebase: `boot_bridge.py` - BootBridge integration
- Existing codebase: `snapshot_storage.py` - SnapshotMetadata persistence pattern

### Secondary (MEDIUM confidence)
- Codebase: `12-RESEARCH.md` - Phase 12 research on QEMU snapshots
- PROJECT.md: v1.4 validated features context
- PixelRTS v2 Specification (`docs/PIXELRTS_V2_SPEC.md`)

### Tertiary (LOW confidence)
- None - all findings grounded in codebase or official documentation

---
*Research completed: 2026-03-09*
*Ready for roadmap: yes*
