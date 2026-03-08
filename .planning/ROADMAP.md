# Roadmap: PixelRTS

## Milestones

- **v1.0 PixelRTS Boot** -- Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** -- Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** -- Phases 6-8 (in progress)

## Phases

<details>
<summary>v1.0 PixelRTS Boot (Phases 1-4) -- SHIPPED 2026-03-08</summary>

- [x] Phase 1: Vision Analysis Pipeline (8/8 plans)
- [x] Phase 2: FUSE Bridge for Direct Boot (6/6 plans)
- [x] Phase 3: Visual Installer Engine (4/4 plans)
- [x] Phase 4: Visual Catalog Manager (4/4 plans)

See: `.planning/milestones/v1.0-ROADMAP.md` for full details.

</details>

<details>
<summary>v1.1 Visual Diff (Phase 5) -- SHIPPED 2026-03-08</summary>

- [x] Phase 5: Visual Diff Engine (4/4 plans)

**Key features:**
- `pixelrts diff <old> <new>` command
- Byte-level comparison with Hilbert region highlighting
- RGBA channel breakdown
- Rich terminal output with JSON export

See: `.planning/milestones/v1.1-ROADMAP.md` for full details.

</details>

## v1.2 Network Boot (In Progress)

**Milestone Goal:** Boot PixelRTS containers over network (PXE/NBD) with bandwidth-efficient delta updates.

### Phase 6: NBD Server + PXE Boot

**Goal**: Users can boot PixelRTS containers over the network using PXE/NBD.

**Depends on**: Phase 5 (Visual Diff - shipped)

**Requirements**: NETWORK-01, NETWORK-02, NETWORK-03, NETWORK-04, NETWORK-05, NBD-01, NBD-02, NBD-03

**Success Criteria** (what must be TRUE):
1. User can run `pixelrts serve <file.png>` and start all network boot services
2. Client machines can PXE boot and load the PixelRTS container
3. DHCP proxy mode works alongside existing DHCP servers without conflicts
4. NBD server exports .rts.png files as network block devices mountable via nbd-client
5. Boot progress shows network transfer status to the user

**Plans:** 3 plans

Plans:
- [ ] 06-01-PLAN.md -- NBD Server Foundation (nbdkit plugin, range decoding)
- [ ] 06-02-PLAN.md -- PXE Boot Infrastructure (DHCP proxy, TFTP server)
- [ ] 06-03-PLAN.md -- Network Boot Integration (pixelrts serve command, progress)

### Phase 7: HTTP Boot via iPXE

**Goal**: Users can boot via HTTP for faster transfers than legacy TFTP.

**Depends on**: Phase 6

**Requirements**: HTTP-01, HTTP-02

**Success Criteria** (what must be TRUE):
1. User can chainload iPXE to enable HTTP boot on clients
2. HTTP server serves kernel/initrd with byte-range support for partial transfers
3. Boot time is measurably faster than TFTP for large containers (>10MB)

**Plans:** 2 plans

Plans:
- [ ] 07-01-PLAN.md -- iPXE Chainload Configuration
- [ ] 07-02-PLAN.md -- HTTP Boot Server with Byte-Range Support

### Phase 8: Delta Updates

**Goal**: Users can update OS containers by downloading only changed bytes.

**Depends on**: Phase 7

**Requirements**: DELTA-01, DELTA-02, DELTA-03

**Success Criteria** (what must be TRUE):
1. User can generate a delta manifest between two .rts.png versions
2. Client can apply a delta patch to update local copy
3. Delta transfer leverages existing PixelRTSDiffer infrastructure
4. Patch size is significantly smaller than full container download (target: <20%)

**Plans:** 3 plans

Plans:
- [ ] 08-01-PLAN.md -- Delta Manifest Generation
- [ ] 08-02-PLAN.md -- Delta Patch Application
- [ ] 08-03-PLAN.md -- Delta Server Integration

## Progress

**Execution Order:**
Phases execute in numeric order: 6 -> 7 -> 8

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1. Vision Analysis Pipeline | v1.0 | 8/8 | Complete | 2026-02-14 |
| 2. FUSE Bridge | v1.0 | 6/6 | Complete | 2026-02-14 |
| 3. Visual Installer Engine | v1.0 | 4/4 | Complete | 2026-02-15 |
| 4. Visual Catalog Manager | v1.0 | 4/4 | Complete | 2026-02-17 |
| 5. Visual Diff Engine | v1.1 | 4/4 | Complete | 2026-03-08 |
| 6. NBD Server + PXE Boot | v1.2 | 0/3 | Ready for execution | - |
| 7. HTTP Boot via iPXE | v1.2 | 0/2 | Not started | - |
| 8. Delta Updates | v1.2 | 0/3 | Not started | - |

---

*Next: `/gsd:execute-phase 6`*
