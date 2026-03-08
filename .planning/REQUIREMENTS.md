# Requirements: PixelRTS v1.1 Visual Diff

**Defined:** 2026-03-08
**Core Value:** Booting an OS should be as visual and intuitive as opening an image file.

## v1.1 Requirements

Requirements for visual diff milestone.

### Visual Updates (VISUAL)

- [ ] **VISUAL-01**: User can compare two .rts.png files and see visual diff of changes
- [ ] **VISUAL-02**: Diff highlights changed regions in the Hilbert-encoded pixel space
- [ ] **VISUAL-03**: User can see byte-level statistics (added, removed, changed bytes)
- [ ] **VISUAL-04**: CLI command `pixelrts diff <old.png> <new.png>` produces visual comparison

## v2 Requirements

Deferred to future release.

### Network (NETWORK)

- **NETWORK-01**: Boot PixelRTS containers over network (PXE/NBD)
- **NETWORK-02**: Network boot supports multiple clients simultaneously

### Updates (UPDATE)

- **UPDATE-01**: Download delta updates (only changed bytes/regions)
- **UPDATE-03**: Review and approve updates before applying

## Out of Scope

| Feature | Reason |
|---------|--------|
| Network boot | Separate milestone |
| Delta download | Requires server infrastructure |
| Auto-apply updates | Explicit approval required for safety |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| VISUAL-01 | Phase 5 | Pending |
| VISUAL-02 | Phase 5 | Pending |
| VISUAL-03 | Phase 5 | Pending |
| VISUAL-04 | Phase 5 | Pending |

**Coverage:**
- v1.1 requirements: 4 total
- Mapped to phases: 4
- Unmapped: 0 ✓

---
*Requirements defined: 2026-03-08*
*Last updated: 2026-03-08 after v1.1 scope definition*
