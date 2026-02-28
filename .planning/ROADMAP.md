# Roadmap: PixelRTS Boot Improvement

## Shipped Milestones

### v1.1: Visual Shell Integration ✅ SHIPPED 2026-02-27

2 phases, 8 plans. See [milestones/v1.1-visual-shell-integration-ROADMAP.md](milestones/v1.1-visual-shell-integration-ROADMAP.md)

**Delivered:**
- Desktop objects with drag-and-drop on infinite canvas
- Click-to-boot with real-time progress visualization
- Status indicators and error handling with actionable guidance

---

### v1.0: PixelRTS Boot Improvement ✅ SHIPPED 2026-02-27

4 phases, 23 plans. See [milestones/v1.0-pixelrts-boot-improvement-ROADMAP.md](milestones/v1.0-pixelrts-boot-improvement-ROADMAP.md)

**Delivered:**
- Vision Analysis Pipeline (analyze OS from PNG visuals)
- FUSE Bridge (boot PNG directly without extraction)
- Visual Installer Engine (install to disk with progress)
- Visual Catalog Manager (thumbnail gallery with one-click boot)

**CLI Commands:** `pixelrts analyze|boot|install|catalog`

---

## Active Development

### v1.2: Network Boot

**Milestone Goal:** Boot OS containers from remote HTTP servers with visual progress and offline resilience.

Users can boot containers from anywhere - local or remote - with the same drag-and-drop experience. Remote containers are cached locally for offline access.

---

### Phase 7: Cache Infrastructure

**Goal:** Downloaded containers are cached locally with automatic verification and eviction.

**Depends on:** Phase 6 (v1.1 Visual Shell)

**Requirements:** CACHE-01, CACHE-02, CACHE-04

**Success Criteria** (what must be TRUE):
  1. User can boot a previously downloaded container without network access
  2. User sees hash verification pass/fail status for each cached container
  3. Cache automatically evicts least-recently-used entries when size limit reached
  4. Stale cache entries are revalidated with ETag check on next access

**Plans:** 3 plans

Plans:
- [ ] 07-01: Implement CatalogCacheManager with IndexedDB storage
- [ ] 07-02: Add SHA256 hash verification on cache write/read
- [ ] 07-03: Implement LRU eviction and ETag-based stale validation

---

### Phase 8: Remote Client

**Goal:** Users can browse and discover containers from remote catalog servers.

**Depends on:** Phase 7 (Cache Infrastructure)

**Requirements:** RCAT-01, RCAT-04

**Success Criteria** (what must be TRUE):
  1. User can view list of available containers from configured remote servers
  2. User can see which server each remote container comes from
  3. Remote catalog loads without blocking the UI (stale-while-revalidate)
  4. User can add/remove remote catalog server URLs in settings

**Plans:** 2 plans

Plans:
- [ ] 08-01: Implement RemoteCatalogClient with multi-server aggregation
- [ ] 08-02: Add server source indicators and settings UI

---

### Phase 9: Remote Boot

**Goal:** Users can boot containers from remote URLs with visual download progress.

**Depends on:** Phase 8 (Remote Client)

**Requirements:** RBOOT-01, RBOOT-02, RBOOT-04, RBOOT-05

**Success Criteria** (what must be TRUE):
  1. User can click a remote container to download and boot it
  2. User sees real-time download progress (percentage, speed, time remaining)
  3. User sees hash verification status after download completes
  4. User can boot a cached remote container while offline
  5. Download progress shows in the desktop object overlay

**Plans:** 3 plans

Plans:
- [ ] 09-01: Add remote fetch with streaming download progress
- [ ] 09-02: Extend RTSDesktopObject with downloading state and progress overlay
- [ ] 09-03: Integrate cache-first boot path for offline access

---

### Phase 10: Remote Catalog Integration

**Goal:** Users see a unified view of local and remote containers with search across all sources.

**Depends on:** Phase 9 (Remote Boot)

**Requirements:** RCAT-02, RCAT-03

**Success Criteria** (what must be TRUE):
  1. User sees local and remote containers in a single unified catalog view
  2. User can filter to show only local, only remote, or all containers
  3. User can search across all catalog sources with a single search query
  4. Remote containers are visually distinguished from local ones

**Plans:** 2 plans

Plans:
- [ ] 10-01: Implement hybrid catalog view with source filtering
- [ ] 10-02: Add unified search across local and remote catalogs

---

### Phase 11: Error Handling & Polish

**Goal:** Network errors are handled gracefully with actionable recovery options.

**Depends on:** Phase 10 (Remote Catalog Integration)

**Requirements:** RBOOT-03, CACHE-03

**Success Criteria** (what must be TRUE):
  1. User can retry a failed download with a single click
  2. Failed downloads retry automatically with exponential backoff (up to 3 attempts)
  3. User can manually clear the cache from settings
  4. User sees clear error messages for common failures (timeout, DNS, 404, auth)

**Plans:** 2 plans

Plans:
- [ ] 11-01: Add retry logic with exponential backoff for failed downloads
- [ ] 11-02: Implement cache clearing UI and error state overlays

---

## Progress

**Execution Order:**
Phases execute in numeric order: 7 → 8 → 9 → 10 → 11

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 7. Cache Infrastructure | 5/5 | Complete | 2026-02-27 |
| 8. Remote Client | 2/2 | Complete | 2026-02-27 |
| 9. Remote Boot | 0/3 | Not started | - |
| 10. Remote Catalog Integration | 0/2 | Not started | - |
| 11. Error Handling & Polish | 0/2 | Not started | - |

---

*Last updated: 2026-02-27 after Phase 8 completion*
