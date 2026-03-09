# Roadmap: PixelRTS

## Milestones

- **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** — Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** — Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** — Phases 9-11 (shipped 2026-03-09)
- **v1.4 Live Snapshots** — Phases 12-14 (in progress)

## v1.4 Live Snapshots (In Progress)

**Milestone Goal:** Create and restore snapshots of running containers

### Phase 12: Snapshot Creation ✓
**Goal**: Users can create snapshots of running containers via QEMU monitor commands
**Depends on**: Phase 11 (multi-boot with running containers)
**Requirements**: SNAP-01, SNAP-02, SNAP-03, SNAP-04
**Success Criteria** (what must be TRUE):
  1. User can run `pixelrts snapshot create <container> <tag>` to create snapshot
  2. Snapshot captures memory, CPU, and disk state atomically
  3. Snapshot operation completes within 5 seconds
  4. Container continues running during snapshot
**Plans:** 4 plans
**Completed:** 2026-03-09

Plans:
- [x] 12-01-PLAN.md — VMSnapshotManager class with QEMU monitor integration
- [x] 12-02-PLAN.md — BootBridge snapshot methods
- [x] 12-03-PLAN.md — MultiBootManager snapshot coordination
- [x] 12-04-PLAN.md — CLI `snapshot` command

### Phase 13: Snapshot Restore
**Goal**: Users can restore containers to a previous snapshot state
**Depends on**: Phase 12 (snapshot creation)
**Requirements**: RESTORE-01, RESTORE-02, RESTORE-03
**Success Criteria** (what must be TRUE):
  1. User can run `pixelrts snapshot restore <container> <tag>` to restore state
  2. Container state matches snapshot state after restore
  3. Network connections are re-established after restore
**Plans:** 3 plans

Plans:
- [ ] 13-01-PLAN.md — Restore operation via `loadvm` command
- [ ] 13-02-PLAN.md — State validation after restore
- [ ] 13-03-PLAN.md — CLI `restore` command

### Phase 14: Snapshot Management
**Goal**: Users can list, delete, and manage snapshots
**Depends on**: Phase 13 (snapshot restore)
**Requirements**: MGMT-01, MGMT-02, MGMT-03, CLI-01, CLI-02, CLI-03
**Success Criteria** (what must be TRUE):
  1. User can run `pixelrts snapshot list <container>` to list snapshots
  2. User can delete snapshots with `pixelrts snapshot delete <container> <tag>`
  3. Snapshot storage is managed (auto-cleanup of old snapshots)
**Plans:** 3 plans

Plans:
- [ ] 14-01-PLAN.md — SnapshotStorage class with metadata management
- [ ] 14-02-PLAN.md — Snapshot listing and deletion operations
- [ ] 14-03-PLAN.md — CLI commands for snapshot management

## Progress

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 12. Snapshot Creation | v1.4 | 4/4 | Complete | 2026-03-09 |
| 13. Snapshot Restore | v1.4 | 0/3 | Not started | - |
| 14. Snapshot Management | v1.4 | 0/3 | Not started | - |

---

*Next: `/gsd:plan-phase 13` to plan Snapshot Restore*
