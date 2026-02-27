# Project Research Summary: Network Boot (v1.2)

**Project:** PixelRTS Visual Shell
**Domain:** Network boot / remote container distribution
**Milestone:** v1.2 Network Boot
**Researched:** 2026-02-27
**Confidence:** HIGH

## Executive Summary

Network boot for PixelRTS extends the existing visual shell to support fetching .rts.png containers from remote HTTP servers. The architecture is a straightforward extension of existing patterns: CatalogBridge.js gains remote catalog methods, a new CacheManager provides offline resilience, and the existing RTSDesktopObject visualization extends to show download progress.

The key insight from research is that **no new dependencies are required**. The existing aiohttp (backend streaming), native fetch + Streams API (frontend streaming), and ThumbnailCache pattern (caching) provide everything needed. This significantly de-risks the implementation.

Critical risks to mitigate: (1) UI blocking during network operations - use stale-while-revalidate pattern, (2) single server dependency - implement multi-server fallback, (3) logic duplication - maintain unified local/remote code paths.

## Key Findings

### Recommended Stack

Minimal additions to existing stack. Leverage existing patterns rather than introduce new frameworks.

**Core technologies (no new deps):**
- **aiohttp (existing):** HTTP client for remote container fetch - already in requirements.txt, supports streaming via `iter_chunked()`
- **aiofiles 23.2.1 (new):** Async file I/O for non-blocking cache writes
- **Native Streams API (existing):** Frontend download progress - `response.body.getReader()` provides async iteration
- **Native AbortController (existing):** Cancellation support - already used in CatalogBridge.js

**What NOT to add:**
- HTTPX (aiohttp sufficient)
- axios (native fetch sufficient)
- Redis (file-based cache sufficient)
- WebSocket for progress (REST polling proven)

### Expected Features

**Must have (table stakes):**
- Remote URL boot - Core feature enabling network operation
- Download progress indicator - Essential UX for 100MB+ files (bytes, percent, speed, ETA)
- Local caching - Avoids re-download, enables offline use
- Cache hit detection - Transparent improvement to user experience
- Connection error handling - Graceful handling of timeout, DNS failure, 404, auth errors
- Remote catalog browsing - Discover available containers from remote servers

**Should have (differentiators):**
- Visual progress during download - Animate thumbnail "filling in" as bytes arrive
- Checksum verification - SHA256 hash comparison after download
- Multi-source aggregation - Browse containers from multiple servers

**Defer (v2+):**
- Remote catalog browsing UI - Can add URLs manually in v1.2
- Delta updates - Requires server protocol changes
- Predictive pre-fetch - Enhance UX later
- P2P distribution - Significant infrastructure required

### Architecture Approach

Three new components extend existing architecture without modifying core boot flow:

**Major components:**
1. **RemoteCatalogClient.js** - Multi-server catalog aggregation, health monitoring, fallback chain
2. **CatalogCacheManager.js** - IndexedDB for offline catalogs, stale-while-revalidate pattern, LRU eviction
3. **Backend remote endpoints** - `/api/v1/catalog/remote`, `/api/v1/health`, `/api/v1/servers`

**Integration points:**
- CatalogBridge.js: Add `getRemoteCatalog()`, `aggregateCatalogs()`, `bootRemoteEntry()` methods
- DesktopObjectManager.js: Add `loadAggregatedCatalog()`, `bootFromServer()` methods
- RTSDesktopObject.js: Add `downloading` status, FETCHING boot stage

### Critical Pitfalls

1. **Synchronous remote fetch** - Use stale-while-revalidate pattern, never block UI on network
2. **Single server dependency** - Configure multiple servers with priority fallback, local always available
3. **Duplicate boot logic** - Single unified boot path with server routing parameter

**Anti-features to explicitly avoid:**
- Auto-update containers (breaks reproducibility)
- Background downloads without consent (bandwidth consumption)
- Centralized registry (vendor lock-in)

## Implications for Roadmap

Based on research, suggested phase structure:

### Phase 1: Cache Infrastructure
**Rationale:** Foundation for offline operation, no UI changes required
**Delivers:** CatalogCacheManager with IndexedDB storage, stale-while-revalidate pattern
**Addresses:** Cache hit detection, offline access features
**Avoids:** Pitfall #1 (UI blocking) - cache enables instant display

### Phase 2: Remote Client (Read-Only)
**Rationale:** Establish network connectivity before adding boot complexity
**Delivers:** RemoteCatalogClient, multi-server aggregation, health monitoring
**Addresses:** Remote catalog browsing, multi-source aggregation
**Uses:** aiohttp for backend, native fetch for frontend
**Implements:** RemoteCatalogClient component

### Phase 3: Remote Boot
**Rationale:** Add boot capability once catalog access is proven
**Delivers:** Remote container fetch, download progress, local boot from cache
**Addresses:** Remote URL boot, download progress indicator, checksum verification
**Avoids:** Pitfall #3 (duplicate logic) - unified boot path with serverUrl param

### Phase 4: Backend Support
**Rationale:** Backend endpoints after frontend patterns established
**Delivers:** `/api/v1/catalog/remote`, `/api/v1/health`, `/api/v1/servers` endpoints
**Uses:** FastAPI patterns from existing catalog_server.py
**Implements:** Backend remote endpoints

### Phase 5: Polish & Error Handling
**Rationale:** Harden after core functionality works
**Delivers:** Connection error handling, retry logic, UI feedback for all error states
**Addresses:** All error scenarios (timeout, DNS, 404, 401/403, disk full, hash mismatch)
**Avoids:** Pitfall #1 (UI blocking) - proper loading states throughout

### Phase Ordering Rationale

- Cache comes first because it enables stale-while-revalidate pattern (prevents UI blocking)
- Remote read before remote write (catalog browse before boot) - separates concerns
- Boot uses existing QEMU path - no changes to boot flow, only to fetch path
- Backend endpoints last - frontend can proxy through local server initially
- Error handling last - need working paths before handling failure paths

### Research Flags

Phases likely needing deeper research during planning:
- **Phase 3:** Remote QEMU boot latency - needs real-world testing to determine acceptable timeouts
- **Phase 4:** Cache eviction strategy for large deployments - LRU parameters need tuning

Phases with standard patterns (skip research-phase):
- **Phase 1:** IndexedDB caching - well-documented web pattern
- **Phase 2:** Multi-server aggregation - standard REST client pattern
- **Phase 5:** Error handling - standard HTTP error codes and UI patterns

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | aiohttp streaming verified in docs, native APIs well-documented |
| Features | MEDIUM | Based on domain knowledge and codebase analysis, not market research |
| Architecture | HIGH | Direct codebase analysis of existing patterns |
| Pitfalls | MEDIUM | Based on standard distributed systems patterns |

**Overall confidence:** HIGH

### Gaps to Address

- **Remote boot latency:** Unknown how remote QEMU boot performs over network - measure in Phase 3
- **Cache size limits:** Optimal cache size for various deployment scales unknown - tune in Phase 4
- **Multi-server merge strategy:** How to dedupe entries with same ID from different servers - decide in Phase 2

## Sources

### Primary (HIGH confidence)
- aiohttp documentation - https://docs.aiohttp.org/en/stable/client_reference.html - streaming support verified
- MDN Streams API - https://developer.mozilla.org/en-US/docs/Web/API/Streams_API - async iteration verified
- Codebase analysis - CatalogBridge.js, DesktopObjectManager.js, RTSDesktopObject.js - existing patterns documented
- Codebase analysis - catalog_server.py, boot_bridge.py - backend patterns documented

### Secondary (MEDIUM confidence)
- ThumbnailCache pattern - `/systems/pixel_compiler/catalog/thumbnail_cache.py` - cache implementation reference
- LRUTileCache pattern - existing cache eviction approach
- Domain knowledge - network boot patterns, distributed systems

### Tertiary (LOW confidence)
- HTTPX comparison - https://www.python-httpx.org/ - verified streaming but not tested
- Remote QEMU latency estimates - theoretical, needs measurement

---
*Research completed: 2026-02-27*
*Ready for roadmap: yes*
