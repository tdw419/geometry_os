# Technology Stack: Network Boot (v1.2)

**Project:** PixelRTS Boot Improvement
**Milestone:** v1.2 Network Boot
**Researched:** 2026-02-27
**Confidence:** HIGH

## Executive Summary

Network boot adds remote container fetching to the existing PixelRTS visual shell. The stack additions are minimal - primarily extending existing patterns rather than introducing new frameworks. Key decision: leverage existing aiohttp rather than adding HTTPX, and use native JavaScript APIs for streaming rather than adding frontend libraries.

## Recommended Stack Additions

### Backend (Python)

| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| aiohttp | 3.9.x (existing) | HTTP client for remote container fetch | Already in requirements.txt, supports streaming, async-native |
| aiofiles | 23.2.1 | Async file I/O for caching | Non-blocking writes to cache directory, integrates with asyncio |

**Rationale:** aiohttp is already in the project's requirements.txt and supports streaming responses via `resp.content.iter_chunked()`. Adding HTTPX would introduce unnecessary dependency complexity when aiohttp handles the use case.

### Frontend (JavaScript)

| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Native Streams API | Built-in | Download progress tracking | No library needed, `response.body` + `ReadableStream` provides async iteration |
| Native AbortController | Built-in | Cancellation support | Already used in CatalogBridge.js for timeout handling |

**Rationale:** The existing CatalogBridge.js already uses native fetch with AbortController. Extending it with streaming downloads requires no new dependencies - just using `response.body.getReader()` or async iteration.

### Infrastructure

| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| File-based cache | N/A | Local caching of remote containers | Extend existing ThumbnailCache pattern |
| Content-addressed storage | N/A | Deduplication via SHA256 | Already used in PixelRTS for hash verification |

## Integration Points

### With Existing Catalog Server

```
Existing: /api/v1/catalog → Local catalog entries
Add:      /api/v1/remote/catalog → Proxy to remote server
Add:      /api/v1/remote/fetch → Stream remote .rts.png with caching
```

The `catalog_server.py` pattern provides:
- Pydantic models for request/response
- CORS middleware already configured
- Error handling with HTTPException
- Background threading for long operations (see `boot_entry` pattern)

### With CatalogBridge.js

Extend the existing class with:

```javascript
// Pattern to follow from existing pollStatus()
async fetchRemote(entryId, onProgress) {
    const response = await fetch(url);
    const contentLength = response.headers.get('Content-Length');
    const reader = response.body.getReader();
    // ... streaming pattern
}
```

Existing patterns to reuse:
- `_createTimeoutSignal()` for request timeout
- `_fetch()` error handling pattern
- `cachedCatalog` pattern for in-memory caching

### With ThumbnailCache Pattern

The existing `thumbnail_cache.py` provides:
- MD5-based cache key generation
- Cache directory at `~/.cache/pixelrts/thumbnails`
- `get_thumbnail_base64()` for API responses

Extend for remote containers:
```python
# ~/.cache/pixelrts/remote/{sha256_hash}.rts.png
# Use SHA256 of URL + content hash for deduplication
```

### With QEMU Boot Flow

```
Remote fetch → Local cache → Existing FUSE mount → QEMU boot
```

No changes needed to boot flow - cached files use the same `pixelrts boot` path.

## What NOT to Add

| Rejected | Reason | Alternative |
|----------|--------|-------------|
| HTTPX | aiohttp already in requirements.txt, streaming supported | Extend aiohttp usage |
| axios (frontend) | Native fetch + Streams API sufficient | Use response.body streaming |
| Redis | File-based cache sufficient for this milestone | Extend ThumbnailCache pattern |
| WebSocket for progress | REST polling already proven in v1.1 | Use Server-Sent Events if needed later |
| Service Worker | Adds complexity, not needed for initial implementation | Direct fetch with caching |
| IndexedDB | File-based cache via backend simpler | Backend-managed cache |

## Installation

```bash
# Add to requirements.txt
aiofiles>=23.2.1

# Already present (no changes needed):
# aiohttp>=3.9.0
# fastapi
# uvicorn
```

## Architecture Decisions

### Decision 1: Streaming Strategy

**Choice:** Chunked streaming with progress callbacks
**Rationale:** Large .rts.png files (100MB+) require progress indication. Content-Length header provides total size, chunk accumulation provides progress.

```python
# Backend pattern (aiohttp)
async with aiohttp.ClientSession() as session:
    async with session.get(url) as resp:
        total = int(resp.headers.get('Content-Length', 0))
        async for chunk in resp.content.iter_chunked(65536):
            # Write to cache, report progress
```

```javascript
// Frontend pattern (native Streams)
const response = await fetch(url);
const reader = response.body.getReader();
let received = 0;
while (true) {
    const { done, value } = await reader.read();
    if (done) break;
    received += value.length;
    onProgress(received, total);
}
```

### Decision 2: Cache Invalidation

**Choice:** Content-hash based with TTL fallback
**Rationale:** SHA256 of cached content matches server hash for verification. Add 7-day TTL for cleanup.

### Decision 3: Remote Catalog Format

**Choice:** Same JSON format as local catalog
**Rationale:** `/api/v1/catalog` response format already defined. Remote servers should serve same format for compatibility.

## Sources

- aiohttp streaming: https://docs.aiohttp.org/en/stable/client_reference.html (HIGH confidence - official docs)
- JavaScript Streams API: https://developer.mozilla.org/en-US/docs/Web/API/Streams_API (HIGH confidence - MDN)
- HTTPX comparison: https://www.python-httpx.org/ (MEDIUM confidence - verified streaming support)
- Existing ThumbnailCache: `/systems/pixel_compiler/catalog/thumbnail_cache.py` (HIGH confidence - code read)
- Existing CatalogBridge: `/systems/visual_shell/web/CatalogBridge.js` (HIGH confidence - code read)
- Catalog Server: `/systems/pixel_compiler/catalog/catalog_server.py` (HIGH confidence - code read)

## Confidence Assessment

| Area | Confidence | Reason |
|------|------------|--------|
| Backend streaming | HIGH | aiohttp documentation confirms iter_chunked support |
| Frontend streaming | HIGH | MDN docs confirm ReadableStream + async iteration |
| Cache pattern | HIGH | ThumbnailCache provides proven implementation |
| Integration | HIGH | Existing codebase patterns well-documented |
| No new deps needed | HIGH | Requirements.txt and code review confirms |
