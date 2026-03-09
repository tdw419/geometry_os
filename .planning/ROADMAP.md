# Roadmap: PixelRTS

## Milestones

- **v1.0 MVP** - Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** - Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** - Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** - Phases 9-11 (shipped 2026-03-09)
- **v1.4 Live Snapshots** - Phases 12-14 (shipped 2026-03-09)
- **v1.5 Commit to File** - Phases 15-17 (in progress)

## Phases

<details>
<summary>v1.0 MVP (Phases 1-4) - SHIPPED 2026-03-08</summary>

### Phase 1: Vision Analysis
**Goal**: Users can visually verify what OS a container contains before booting.
**Plans**: 5 plans

Plans:
- [x] 01-01: PixelRTS v2 decoder integration
- [x] 01-02: OCR-based container identification
- [x] 01-03: CLI analyze command
- [x] 01-04: Vision verification loop
- [x] 01-05: Integration tests

### Phase 2: Direct Boot
**Goal**: Users can boot .rts.png files directly without manual extraction.
**Plans**: 6 plans

Plans:
- [x] 02-01: FUSE mount helper
- [x] 02-02: Boot bridge orchestration
- [x] 02-03: CLI boot command
- [x] 02-04: Automatic cleanup
- [x] 02-05: Progress feedback
- [x] 02-06: Integration tests

### Phase 3: Visual Install
**Goal**: Users can install OS containers to disk with visual progress.
**Plans**: 6 plans

Plans:
- [x] 03-01: Install progress tracking
- [x] 03-02: Disk writer
- [x] 03-03: Install engine
- [x] 03-04: CLI install command
- [x] 03-05: TTY-aware output
- [x] 03-06: Integration tests

### Phase 4: Visual Catalog
**Goal**: Users can browse and boot containers from a visual gallery.
**Plans**: 5 plans

Plans:
- [x] 04-01: Catalog scanner
- [x] 04-02: Thumbnail cache
- [x] 04-03: Catalog server
- [x] 04-04: CLI catalog command
- [x] 04-05: One-click boot

</details>

<details>
<summary>v1.1 Visual Diff (Phase 5) - SHIPPED 2026-03-08</summary>

### Phase 5: Visual Diff
**Goal**: Users can compare two .rts.png files and see visual byte-level differences.
**Plans**: 4 plans

Plans:
- [x] 05-01: Byte-level comparison engine
- [x] 05-02: Hilbert region highlighting
- [x] 05-03: CLI diff command
- [x] 05-04: JSON export and exit codes

</details>

<details>
<summary>v1.2 Network Boot (Phases 6-8.1) - SHIPPED 2026-03-09</summary>

### Phase 6: PXE Boot
**Goal**: Users can boot containers over network via PXE.
**Plans**: 3 plans

Plans:
- [x] 06-01: Proxy DHCP server
- [x] 06-02: TFTP server
- [x] 06-03: CLI serve command

### Phase 7: NBD Export
**Goal**: Containers can be exported as network block devices.
**Plans**: 3 plans

Plans:
- [x] 07-01: nbdkit Python plugin
- [x] 07-02: Range decoding
- [x] 07-03: Memory-efficient serving

### Phase 8: HTTP Boot
**Goal**: Faster network boot via HTTP with delta updates.
**Plans**: 3 plans

Plans:
- [x] 08-01: HTTP boot server
- [x] 08-02: iPXE chainload
- [x] 08-03: Byte-range support

### Phase 8.1: Delta Updates
**Goal**: Bandwidth-efficient updates via delta patches.
**Plans**: 3 plans

Plans:
- [x] 08.1-01: Delta manifest generation
- [x] 08.1-02: Delta patch application
- [x] 08.1-03: Delta HTTP endpoints

</details>

<details>
<summary>v1.3 Multi-Boot (Phases 9-11) - SHIPPED 2026-03-09</summary>

### Phase 9: Multi-Container Boot
**Goal**: Users can boot multiple containers simultaneously.
**Plans**: 4 plans

Plans:
- [x] 09-01: MultiBootManager
- [x] 09-02: ResourceAllocator for VNC ports
- [x] 09-03: Concurrent boot orchestration
- [x] 09-04: CLI multi-file boot

### Phase 10: Virtual Networking
**Goal**: Containers can communicate without root privileges.
**Plans**: 4 plans

Plans:
- [x] 10-01: VirtualNetwork class
- [x] 10-02: QEMU socket netdev
- [x] 10-03: NetworkMode enum extension
- [x] 10-04: Graceful fallback

### Phase 11: Container Management
**Goal**: Users can manage running containers with ordered boot/shutdown.
**Plans**: 4 plans

Plans:
- [x] 11-01: ContainerRole enum
- [x] 11-02: Ordered boot pattern
- [x] 11-03: Ordered shutdown
- [x] 11-04: CLI ps command

</details>

<details>
<summary>v1.4 Live Snapshots (Phases 12-14) - SHIPPED 2026-03-09</summary>

### Phase 12: VM Snapshots
**Goal**: Users can create and restore snapshots of running containers.
**Plans**: 3 plans

Plans:
- [x] 12-01: VMSnapshotManager with QEMU monitor
- [x] 12-02: Dynamic timeout scaling
- [x] 12-03: Snapshot creation

### Phase 13: Snapshot Storage
**Goal**: Snapshots persist with metadata across VM restarts.
**Plans**: 4 plans

Plans:
- [x] 13-01: SnapshotMetadata dataclass
- [x] 13-02: SnapshotStorage persistence
- [x] 13-03: Dual-source listing
- [x] 13-04: CLI snapshot commands

### Phase 14: Snapshot Management
**Goal**: Users can list, restore, and delete snapshots.
**Plans**: 3 plans

Plans:
- [x] 14-01: Restore with identity preservation
- [x] 14-02: Delete snapshot
- [x] 14-03: Global snapshots command

</details>

### v1.5 Commit to File (In Progress)

**Milestone Goal:** Users can commit running containers to new portable .rts.png files that preserve all disk and memory state.

#### Phase 15: Snapshot Export
**Goal**: Users can export a VM snapshot to a standalone qcow2 file with streaming encoding.
**Depends on**: Phase 14 (VMSnapshotManager exists)
**Requirements**: COMMIT-01, COMMIT-02, COMMIT-03
**Success Criteria** (what must be TRUE):
  1. User can export a running container's snapshot to a standalone qcow2 file
  2. VM pauses during export and resumes after completion
  3. Export shows progress through stages (snapshot - extract - encode)
  4. Large memory states (>1GB) are handled without memory exhaustion
**Plans**: 3 plans

Plans:
- [x] 15-01-PLAN.md - QemuImgWrapper for qemu-img extract operations
- [x] 15-02-PLAN.md - SnapshotCommitter with VM pause/resume orchestration
- [x] 15-03-PLAN.md - SnapshotExporter with PixelRTS encoding and progress

#### Phase 16: Boot from Committed
**Goal**: Committed .rts.png files boot correctly with preserved state.
**Depends on**: Phase 15
**Requirements**: BOOT-COMMIT-01, BOOT-COMMIT-02, BOOT-COMMIT-03, COMMIT-04
**Success Criteria** (what must be TRUE):
  1. Committed .rts.png file boots with existing `pixelrts boot` command
  2. Original kernel/initrd are preserved in committed file
  3. Disk changes from committed state are visible after boot
  4. Commit shows verification progress before completion
**Plans**: 4 plans (3 complete + 1 gap closure)

Plans:
- [x] 16-01-PLAN.md - CommittedFileBooter class for vm-snapshot boot
- [x] 16-02-PLAN.md - Kernel/initrd preservation in committed files
- [x] 16-03-PLAN.md - CLI integration and verification
- [ ] 16-04-PLAN.md - Gap closure: Fix kernel/initrd extraction from committed files

#### Phase 17: CLI Integration
**Goal**: Users can commit containers with a single CLI command.
**Depends on**: Phase 16
**Requirements**: CLI-COMMIT-01, CLI-COMMIT-02, CLI-COMMIT-03
**Success Criteria** (what must be TRUE):
  1. User can run `pixelrts commit <container> <output.rts.png>` to create committed file
  2. User can specify `--snapshot <tag>` to commit a specific snapshot
  3. User can skip verification with `--no-verify` flag for faster commits
**Plans**: 3 plans

Plans:
- [ ] 17-01: CLI commit command
- [ ] 17-02: Snapshot selection flag
- [ ] 17-03: Verification skip flag

## Progress

**Execution Order:**
Phases execute in numeric order: 15 - 16 - 17

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 15. Snapshot Export | v1.5 | 3/3 | Complete | 2026-03-09 |
| 16. Boot from Committed | v1.5 | 3/4 | Gap closure pending | - |
| 17. CLI Integration | v1.5 | 0/3 | Not started | - |

---
*Last updated: 2026-03-09*
