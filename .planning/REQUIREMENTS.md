# Requirements: Visual Shell Integration

**Defined:** 2026-02-27
**Core Value:** OS containers live directly on the infinite desktop - boot by clicking, arrange by dragging.

## v1.1 Requirements

Requirements for Visual Shell Integration milestone. Each maps to a roadmap phase.

### Desktop Objects (DESKTOP)

- [ ] **DESKTOP-01**: User can see .rts.png files displayed as interactive objects on the PixiJS desktop
- [ ] **DESKTOP-02**: User can drag and drop container objects to arrange them on the infinite canvas
- [ ] **DESKTOP-03**: User can boot a container with a single click (or double-click) on its desktop object
- [ ] **DESKTOP-04**: User can see container metadata (distro, kernel version, architecture) on hover or selection

### Boot Progress (BOOT)

- [ ] **BOOT-01**: User sees a progress indicator during QEMU boot launch (>1 second operations)
- [ ] **BOOT-02**: User can see visual status of each container (running, stopped, error)
- [ ] **BOOT-03**: User sees clear error messages when boot fails with actionable guidance
- [ ] **BOOT-04**: User's container positions persist across sessions (layout saved and restored)

## v1.x Requirements

Deferred to after v1.1 validation.

### Advanced Visualization (VISUAL)

- **VISUAL-01**: Thermographic boot visualization shows OS "loading" as pixels fill in
- **VISUAL-02**: Entropy heatmap overlay for forensic analysis
- **VISUAL-03**: Live texture swap from running QEMU instance

### Advanced Interaction (INTERACT)

- **INTERACT-01**: Proximity-based boot mode (auto-boot when near)
- **INTERACT-02**: Multi-container selection and batch operations
- **INTERACT-03**: Context menu with boot/configure/delete options

## v2 Requirements

Deferred until product-market fit is established.

### Network Integration (NETWORK)

- **NETWORK-01**: Container catalog sync across multiple machines
- **NETWORK-02**: Remote boot from network catalog

### Advanced Layout (LAYOUT)

- **LAYOUT-01**: Spatial grouping and tagging
- **LAYOUT-02**: Auto-arrange by metadata (distro, kernel version)

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Real-time ISO→PNG conversion | Adds latency, breaks single-source-of-truth. Use CLI tool. |
| Live modification during boot | Requires overlay filesystem, breaks verification. Use install workflow. |
| Auto-arrange/snap-to-grid | Violates user agency in spatial arrangement. |
| Real-time collaboration | Complex CRDT/OT required. Single-user first. |
| Mobile touch support | Desktop-first interaction model. |
| VNC console embedding | Scope bloat. Separate feature. |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| DESKTOP-01 | Phase 5 | Pending |
| DESKTOP-02 | Phase 5 | Pending |
| DESKTOP-03 | Phase 5 | Pending |
| DESKTOP-04 | Phase 5 | Pending |
| BOOT-01 | Phase 6 | Pending |
| BOOT-02 | Phase 6 | Pending |
| BOOT-03 | Phase 6 | Pending |
| BOOT-04 | Phase 5 | Pending |

**Coverage:**
- v1.1 requirements: 8 total
- Mapped to phases: 8
- Unmapped: 0 ✓

---
*Requirements defined: 2026-02-27*
*Last updated: 2026-02-27*
