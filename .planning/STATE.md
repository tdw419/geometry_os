# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-02-27)

**Core value:** Booting an OS should be as visual and intuitive as opening an image file — from anywhere.
**Current focus:** Phase 10 - Remote Catalog Integration (In Progress)

## Current Position

**Milestone:** v1.2 Network Boot
**Phase:** 10 of 11 (Remote Catalog Integration) - In Progress
**Plan:** 1 of 1 complete
**Status:** In progress
**Last activity:** 2026-02-28 — Completed 10-01 Hybrid Catalog View with Source Filtering

Progress: [█████░░░░░] 42%

## Performance Metrics

**Velocity:**
- Total plans completed: 42 (v1.0: 23, v1.1: 8, v1.2: 11)
- v1.2 plans remaining: 1

**By Phase:**

| Phase | Plans | Status |
|-------|-------|--------|
| 1-4 (v1.0) | 23 | Complete |
| 5-6 (v1.1) | 8 | Complete |
| 7 (v1.2) | 5 | Complete |
| 8 (v1.2) | 2 | Complete |
| 9 (v1.2) | 3 | Complete |
| 10 (v1.2) | 1 | Complete |
| 11 (v1.2) | 1 | Pending |

## Accumulated Context

### Shipped Milestones
- **v1.0:** PixelRTS Boot Improvement — Vision analysis, FUSE boot, installer, catalog
- **v1.1:** Visual Shell Integration — Desktop objects, boot progress, error handling
- **v1.2:** Cache Infrastructure + Remote Client + Remote Boot + Source Filtering — IndexedDB, hash verification, LRU eviction, ETag revalidation, cache-first fetching, verification status UI, multi-server aggregation, server source badges, settings panel, streaming downloads, download progress overlay, offline availability, filter bar UI

### Key Decisions
- PixiJS v7 for desktop rendering
- REST polling for boot status (1000ms interval, max 60 attempts)
- Position mapping: server `position.{x,y}` -> client `layout.{gridX,gridY}`
- 30-second boot timeout with 4-stage progress animation
- ERROR_GUIDANCE pattern matching for actionable error suggestions
- **v1.2:** Use stale-while-revalidate pattern to prevent UI blocking
- **v1.2:** No new dependencies - leverage existing aiohttp and native fetch/Streams API
- **07-01:** Native IndexedDB API for container caching (no external library)
- **07-01:** Cache size limit persisted in localStorage (default 500MB)
- **07-02:** Native Web Crypto API for SHA256 hash computation (no external library)
- **07-02:** verificationStatus field tracks 'verified' | 'failed' | 'pending' state
- **07-02:** verifyOnRead option (default: false) for optional read-time verification
- **07-03:** 7-day maxAge with 1-day staleWhileRevalidate window for cache freshness
- **07-03:** EventEmitter pattern for cache lifecycle events (reuses PIXI.utils.EventEmitter if available)
- **07-03:** Conditional fetch with If-None-Match header for ETag revalidation
- **07-04:** ES6 export + window attachment pattern for dual module/script usage
- **07-04:** getContainerData uses cache-first with background revalidation for stale entries
- **07-05:** Cache status indicator positioned below main status indicator
- **07-05:** Cache status indicator hidden for uncached containers
- **07-05:** Hover tooltip shows verification state text
- **08-01:** ServerRegistry uses localStorage for server configuration persistence
- **08-01:** 10-second timeout per server request via AbortController
- **08-01:** Promise.allSettled for parallel server fetching (no sequential fallback)
- **08-01:** Remote entries tagged with sourceServerId, sourceServerName, sourceServerColor
- **08-02:** 8px colored dot badge in top-left corner for server source indicator
- **08-02:** Hover shows server name tooltip near badge
- **08-02:** Local containers have no badge (only remote containers show badge)
- **08-02:** Vanilla DOM for settings panel (no framework dependency)
- **09-01:** Streaming download via fetch ReadableStream (no XMLHttpRequest)
- **09-01:** 3-second speed smoothing window to prevent progress jitter
- **09-01:** 60-second default timeout for large container downloads
- **09-01:** Data returned on hash verification failure (error also emitted)
- **09-01:** Error categorization with retryable hints for retry logic
- **09-02:** Reuse progressContainer for download overlay (no separate container)
- **09-02:** Red border on hover during download indicates click-to-cancel
- **09-02:** 1.5 second delay after verification before boot starts
- **09-02:** 2-minute timeout for remote container downloads
- **09-03:** 6px green badge in bottom-left for offline available (distinct from 8px server badge in top-left)
- **09-03:** Use getKey() for has() efficiency instead of get()
- **09-03:** Background revalidation is non-blocking (fire and forget)
- **09-03:** Stale cache boots immediately with background revalidation
- **09-03:** Offline error shows "Not cached - network required" message
- **10-01:** Three filter options: All, Local, Remote (matches user requirements)
- **10-01:** Filter state stored in DesktopObjectManager, not persisted
- **10-01:** Filter applied immediately on object creation to prevent visual flicker
- **10-01:** Cyan (#00ffff) active state matching project theme

### Components Shipped
- RTSDesktopObject.js (1734 lines) - PIXI.Container with progress, status, error, cache verification, server source badge, download overlay, offline availability badge
- CatalogBridge.js (487 lines) - API client with status polling and cache-first fetching
- DesktopObjectManager.js (1433 lines) - Lifecycle manager with remote catalog integration, remote boot flow, cache-first boot path, source filtering
- catalog_server.py (639 lines) - Status tracking and REST API
- CatalogCacheManager.js (1345 lines) - IndexedDB cache with LRU eviction, stale detection, ETag revalidation, ES6 exports, isOfflineCapable
- ServerRegistry.js (327 lines) - localStorage server configuration persistence
- RemoteCatalogClient.js (478 lines) - Multi-server catalog aggregation with SWR pattern
- ServerSettingsPanel.js (674 lines) - Settings UI for managing remote servers
- RemoteBootFetcher.js (633 lines) - Streaming download with progress, cancellation, hash verification
- CatalogFilterBar.js (166 lines) - Filter bar UI with All/Local/Remote buttons and count display

### Blockers
- None currently

## Session Continuity

Last session: 2026-02-28T02:19:28Z
Status: Phase 10 Plan 1 complete — Hybrid catalog view with source filtering implemented
Resume file: None
