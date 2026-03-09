# Pitfalls Research: Commit-to-File (VM State Export)

**Domain:** VM state persistence and export to PixelRTS PNG format
**Researched:** 2026-03-09
**Confidence:** HIGH (based on QEMU documentation and existing VMSnapshotManager implementation)

## Critical Pitfalls

### Pitfall 1: Internal Snapshot Format Incompatibility

**What goes wrong:**
QEMU's `savevm` command creates internal snapshots stored inside qcow2 files. These snapshots are NOT portable between QEMU versions, architectures, or host systems. Attempting to encode these directly into PixelRTS PNG format will result in non-restorable containers.

**Why it happens:**
Developers assume all snapshot formats are equivalent. The `savevm`/`loadvm` commands appear to create portable state, but they're actually tightly coupled to the specific QEMU binary version and qcow2 internal format.

**How to avoid:**
Use `qemu-img convert -l snapshot_name -O qcow2` to export internal snapshots to standalone qcow2 files first, then extract the raw VM state. Alternatively, use `migrate` to file for portable memory dumps. The commit-to-file pipeline must:
1. Trigger snapshot creation via `savevm`
2. Export to standalone format via `qemu-img convert`
3. Extract raw memory/device state
4. Encode into PixelRTS PNG format

**Warning signs:**
- Commit works on one machine but fails on another
- "Invalid snapshot" errors when loading committed state
- Snapshot restore succeeds but VM crashes immediately
- QEMU version mismatch between commit and restore hosts

**Phase to address:**
Phase 1 (Core Export) — Must establish correct export format before any encoding work.

---

### Pitfall 2: Memory State Size Explosion

**What goes wrong:**
A 4GB VM produces a ~4GB memory dump. Encoding this into PNG format using PixelRTS v2 Hilbert curve mapping creates an image with dimensions ~33000x33000 pixels. This exceeds PNG dimension limits (2^31-1 per dimension but practical limits are much lower), causes memory exhaustion during encoding, and produces unusable files.

**Why it happens:**
PixelRTS v2 uses 4 bytes per pixel (RGBA), so 4GB of memory = 1 billion pixels. Developers underestimate the final file size and don't implement streaming or chunking strategies.

**How to avoid:**
1. **Implement streaming encoding:** Process memory in chunks, write to PNG incrementally
2. **Use compression:** QEMU memory dumps compress well (mostly zeros in guest memory)
3. **Consider hybrid format:** Store memory state separately from PNG metadata
4. **Set VM memory limits:** Document maximum supported memory (recommend 2GB for initial implementation)
5. **Pre-encode size check:** Fail fast with clear error if memory exceeds encoding limits

**Warning signs:**
- `PIL.Image` cannot allocate memory during encoding
- PNG encoder hangs or OOM kills process
- Output file exceeds filesystem limits
- Encoding takes >5 minutes for modest memory sizes

**Phase to address:**
Phase 1 (Core Export) — Size constraints must be validated before encoding begins.

---

### Pitfall 3: PixelRTS v2 Format Compatibility Breakage

**What goes wrong:**
Committed files don't boot with existing `pixelrts boot` command because the PNG tEXt chunks contain unexpected metadata formats, or the Hilbert-encoded data doesn't match expected structure (kernel/initrd/disk).

**Why it happens:**
VM state is fundamentally different from bootable OS artifacts. PixelRTS v2 expects:
- `kernel.bin` — ELF executable
- `initrd.img` — Compressed cpio archive
- Optional `disk.qcow2` — Disk image

A committed VM snapshot contains:
- Memory dump (raw or compressed)
- CPU register state
- Device state serialization

These don't map cleanly to the existing boot flow.

**How to avoid:**
1. **Extend format spec:** Define new PixelRTS container type (e.g., "vm-snapshot" vs "bootable")
2. **Add metadata versioning:** tEXt chunks must indicate container type
3. **Create separate restore path:** `pixelrts restore` vs `pixelrts boot`
4. **Maintain backward compatibility:** Existing boot flow unchanged for bootable containers
5. **Document format extension:** Update `PIXELRTS_V2_SPEC.md` with snapshot format section

**Warning signs:**
- `pixelrts boot` fails on committed snapshot with cryptic error
- Existing tests break after format changes
- Blueprint analyzer produces wrong component detection
- Vision model can't identify committed containers

**Phase to address:**
Phase 2 (Format Integration) — Must define format extension before implementing full pipeline.

---

### Pitfall 4: Snapshot State Inconsistency During Commit

**What goes wrong:**
VM continues running while commit is in progress. The memory dump captures partial state changes, resulting in corrupted snapshot that crashes on restore.

**Why it happens:**
QEMU's `savevm` pauses the VM briefly, but the subsequent export/encode steps happen with VM running. Memory can change between snapshot creation and final encoding.

**How to avoid:**
1. **Pause VM during commit:** Use `stop` monitor command before export, `cont` after
2. **Use live migration to file:** `migrate -f` captures consistent state atomically
3. **Verify state integrity:** Include checksum of memory dump in final PNG metadata
4. **Document pause requirement:** Make it clear in CLI output that VM is paused during commit
5. **Add timeout handling:** If commit takes too long, abort and resume VM

**Warning signs:**
- Committed snapshot restores but VM crashes randomly
- Memory checksum mismatch after encoding
- VM behavior different after restore (missing writes, phantom data)
- Intermittent restore failures (race conditions)

**Phase to address:**
Phase 1 (Core Export) — Consistency guarantees must be built into export flow.

---

### Pitfall 5: VMSnapshotManager Integration Conflicts

**What goes wrong:**
Commit-to-file feature bypasses or conflicts with existing VMSnapshotManager state tracking. Snapshots created via commit don't appear in `pixelrts snapshots` list, or metadata formats conflict.

**Why it happens:**
VMSnapshotManager tracks snapshots via QEMU monitor and stores metadata in `/tmp/pixelrts/snapshots/`. Committed files are external artifacts that don't fit this model.

**How to avoid:**
1. **Extend SnapshotMetadata:** Add `committed_path` field for external file references
2. **Dual-source listing:** `list_snapshots()` should include both VM-internal and committed snapshots
3. **Unified metadata format:** Committed files should have compatible metadata structure
4. **CLI integration:** `pixelrts snapshot commit <tag> <output.png>` creates both file and metadata entry
5. **Cleanup coordination:** Deleting committed snapshot should remove both file and metadata

**Warning signs:**
- `pixelrts snapshots` doesn't show committed snapshots
- Deleting snapshot doesn't remove committed file
- State file `/tmp/pixelrts/containers.json` has orphaned entries
- Snapshot metadata and committed file metadata diverge

**Phase to address:**
Phase 3 (CLI Integration) — Must extend metadata model before CLI commands.

---

## Technical Debt Patterns

Shortcuts that seem reasonable but create long-term problems.

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Store raw memory dump without compression | Faster commit, simpler code | Huge files, slow transfer, disk exhaustion | Never |
| Skip VM pause during commit | Better UX, no VM downtime | Inconsistent snapshots, random restore crashes | Never |
| Reuse existing boot flow for snapshots | Less code, faster implementation | Format confusion, backward compat breaks | Never |
| Omit device state from commit | Smaller files, faster encoding | Incomplete VM state, devices reset on restore | MVP only for simple VMs |
| Store memory as base64 in tEXt chunk | Simple implementation | 33% size overhead, PNG spec violation | Never |

## Integration Gotchas

Common mistakes when connecting to external services.

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| QEMU monitor | Assume `savevm` returns immediately | Use dynamic timeout based on memory size |
| qemu-img | Run as blocking subprocess without timeout | Use async subprocess with configurable timeout |
| PNG encoder | Load entire memory dump into RAM | Stream chunks through encoder |
| Existing boot flow | Assume committed files are bootable | Separate `restore` command, different format marker |
| VMSnapshotManager | Create parallel metadata system | Extend existing SnapshotMetadata class |

## Performance Traps

Patterns that work at small scale but fail as usage grows.

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| In-memory encoding | OOM at 1GB+ VMs | Streaming encoder, chunked processing | 1GB VM memory |
| No progress feedback | User kills process, corrupts file | Progress callback, Rich progress bar | First large VM commit |
| Single-threaded compression | 30+ minute commit times | Parallel compression, zstd multi-threaded | 2GB+ VM memory |
| Synchronous commit | CLI blocks for minutes | Async commit with background task | First production use |
| No size validation | Surprise disk exhaustion | Pre-check available disk space | Any production system |

## Security Mistakes

Domain-specific security issues beyond general web security.

| Mistake | Risk | Prevention |
|---------|------|------------|
| Include sensitive memory in commit | Credentials, keys leaked in PNG file | Memory scrubbing, exclude regions by pattern |
| No signature on committed files | Tampered snapshots restore malicious state | Ed25519 signature in tEXt chunk |
| World-readable commit files | Any user can read VM memory dump | Set file permissions 0600, warn in CLI |
| Trust committed files from untrusted sources | Arbitrary code execution on restore | Signature verification before restore |
| Include host-specific paths | Information disclosure, portability issues | Sanitize paths, use relative references |

## UX Pitfalls

Common user experience mistakes in this domain.

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| No progress indicator during commit | User thinks process hung, kills it | Rich progress bar with ETA |
| Silent VM pause | User confused why VM stopped responding | Clear message: "Pausing VM for commit..." |
| Large file surprise | User runs out of disk space | Pre-check disk space, show estimated size |
| Slow restore with no feedback | User thinks restore failed | Progress stages: Loading → Verifying → Restoring |
| Committed file not in catalog | User can't find committed snapshot | Auto-add to catalog, thumbnail generation |

## "Looks Done But Isn't" Checklist

Things that appear complete but are missing critical pieces.

- [ ] **Format marker:** Often missing PNG tEXt chunk indicating snapshot type — verify `pixelrts analyze` shows correct type
- [ ] **Memory integrity:** Often missing checksum verification — verify restore succeeds after file copy
- [ ] **Device state:** Often missing non-memory device state — verify network/USB devices work after restore
- [ ] **Metadata sync:** Often missing VMSnapshotManager integration — verify `pixelrts snapshots` shows committed snapshot
- [ ] **Error recovery:** Often missing cleanup on failure — verify no orphan files after Ctrl+C
- [ ] **Signature verification:** Often missing on restore — verify tampered file is rejected
- [ ] **Cross-host restore:** Often missing portability testing — verify commit on host A restores on host B

## Recovery Strategies

When pitfalls occur despite prevention, how to recover.

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| Format incompatibility | HIGH | Re-encode from original qcow2 snapshot |
| Memory size exceeded | MEDIUM | Reduce VM memory, re-commit |
| State inconsistency | HIGH | Discard committed file, create new snapshot |
| Metadata divergence | LOW | Re-sync from VMSnapshotManager state |
| Encoding corruption | HIGH | Re-run commit from scratch |
| Signature mismatch | LOW | Re-sign committed file |

## Pitfall-to-Phase Mapping

How roadmap phases should address these pitfalls.

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| Internal snapshot incompatibility | Phase 1: Core Export | Cross-host restore test |
| Memory state size explosion | Phase 1: Core Export | 4GB VM commit test with streaming |
| PixelRTS v2 format compatibility | Phase 2: Format Integration | Existing boot tests still pass |
| Snapshot state inconsistency | Phase 1: Core Export | Concurrent write test during commit |
| VMSnapshotManager integration | Phase 3: CLI Integration | `pixelrts snapshots` includes committed |

## Sources

- QEMU Live Block Operations Documentation (qemu.org)
- Existing VMSnapshotManager implementation (`systems/pixel_compiler/boot/vm_snapshot.py`)
- PixelRTS v2 Specification (`docs/PIXELRTS_V2_SPEC.md`)
- QEMU snapshot format limitations (internal vs external snapshots)
- PNG specification limits (dimension constraints, tEXt chunk size)
- Personal experience with VM state portability issues

---
*Pitfalls research for: Commit-to-File (VM State Export)*
*Researched: 2026-03-09*
