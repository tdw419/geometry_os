# Requirements: PixelRTS v1.4 Live Snapshots

**Defined:** 2026-03-09
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file.

## v1.4 Requirements

### Snapshot Creation

- [x] **SNAP-01**: User can create snapshot of running container
- [x] **SNAP-02**: Snapshot captures full container state (memory, disk, network)
- [x] **SNAP-03**: Snapshot creation is fast (< 5 seconds for 2GB container)
- [x] **SNAP-04**: Multiple snapshots per container supported

### Snapshot Restore

- [ ] **RESTORE-01**: User can restore container to snapshot state
- [ ] **RESTORE-02**: Restore preserves container identity (name, VNC port)
- [ ] **RESTORE-03**: Restore handles running container (stop, restore, restart)

### Snapshot Management

- [ ] **MGMT-01**: User can list all snapshots with `pixelrts snapshots`
- [ ] **MGMT-02**: User can delete snapshot with `pixelrts snapshot rm <name>`
- [ ] **MGMT-03**: Snapshots stored in standard location (/tmp/pixelrts/snapshots)

### CLI Integration

- [ ] **CLI-01**: `pixelrts snapshot create <container>` command
- [ ] **CLI-02**: `pixelrts snapshot restore <container> <snapshot>` command
- [ ] **CLI-03**: Snapshot names are timestamp-based by default

## Out of Scope

| Feature | Reason |
|---------|--------|
| Ephemeral boot | Future milestone (v1.5+) |
| Commit to file | Future milestone (v1.5+) |
| Cross-container snapshots | Complex, not needed for v1.4 |
| Scheduled snapshots | Future milestone |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| SNAP-01 | Phase 12 | Complete |
| SNAP-02 | Phase 12 | Complete |
| SNAP-03 | Phase 12 | Complete |
| SNAP-04 | Phase 12 | Complete |
| RESTORE-01 | Phase 13 | Pending |
| RESTORE-02 | Phase 13 | Pending |
| RESTORE-03 | Phase 13 | Pending |
| MGMT-01 | Phase 14 | Pending |
| MGMT-02 | Phase 14 | Pending |
| MGMT-03 | Phase 14 | Pending |
| CLI-01 | Phase 14 | Pending |
| CLI-02 | Phase 14 | Pending |
| CLI-03 | Phase 14 | Pending |

**Coverage:**
- v1.4 requirements: 13 total
- Mapped to phases: 13
- Unmapped: 0 ✓
- Complete: 4/13 (31%)

---
*Requirements updated: 2026-03-09*
