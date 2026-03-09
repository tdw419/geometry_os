# Requirements: PixelRTS v1.5 Commit to File

**Defined:** 2026-03-09
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file.

## v1.5 Requirements

### Commit

- [ ] **COMMIT-01**: User can commit running container to new .rts.png file
- [ ] **COMMIT-02**: Committed file preserves all disk changes from original
- [ ] **COMMIT-03**: Committed file includes VM memory state
- [ ] **COMMIT-04**: Commit shows progress (snapshot → export → encode → verify)

### Boot from Committed

- [ ] **BOOT-COMMIT-01**: Committed file boots with existing `pixelrts boot` command
- [ ] **BOOT-COMMIT-02**: Committed file preserves original kernel/initrd
- [ ] **BOOT-COMMIT-03**: Changes from committed state are visible after boot

### CLI

- [ ] **CLI-COMMIT-01**: `pixelrts commit <container> <output.rts.png>` command
- [ ] **CLI-COMMIT-02**: `--snapshot <tag>` flag to commit specific snapshot
- [ ] **CLI-COMMIT-03**: `--no-verify` flag to skip boot verification

## Out of Scope

| Feature | Reason |
|---------|--------|
| Live migration to file | Pause required for consistency |
| In-place commit | Data loss risk, breaks immutability |
| Multi-container atomic commit | Complex coordination |
| Cloud provider integration | Local focus per PROJECT.md |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| COMMIT-01 | Phase 15 | Pending |
| COMMIT-02 | Phase 15 | Pending |
| COMMIT-03 | Phase 15 | Pending |
| COMMIT-04 | Phase 16 | Pending |
| BOOT-COMMIT-01 | Phase 16 | Pending |
| BOOT-COMMIT-02 | Phase 16 | Pending |
| BOOT-COMMIT-03 | Phase 16 | Pending |
| CLI-COMMIT-01 | Phase 17 | Pending |
| CLI-COMMIT-02 | Phase 17 | Pending |
| CLI-COMMIT-03 | Phase 17 | Pending |

---
*Last updated: 2026-03-09*
