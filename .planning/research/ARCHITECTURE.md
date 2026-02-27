# Architecture Patterns: Network Boot Integration

**Domain:** PixelRTS Visual Shell Network Boot
**Researched:** 2026-02-27
**Confidence:** MEDIUM (based on codebase analysis, web search unavailable)

## Executive Summary

Network boot extends the existing PixelRTS visual shell to support remote catalog servers and network-based boot operations. The architecture requires:
1. Remote catalog client capabilities in CatalogBridge.js
2. Cache management for offline/resilient operation
3. Backend support for remote catalog aggregation
4. Boot flow modifications to handle remote assets

## Current Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           EXISTING ARCHITECTURE (v1.1)                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐         REST API          ┌───────────────────────┐   │
│  │   Frontend       │    /api/v1/catalog       │   Backend (FastAPI)    │   │
│  │   (PixiJS v7)    │ ◄──────────────────────► │   catalog_server.py    │   │
│  │                 │                          │                       │   │
│  │  ┌──────────────┴──────────────┐           │  ┌─────────────────┐  │   │
│  │  │ CatalogBridge.js            │           │  │ CatalogScanner  │  │   │
│  │  │ - getCatalog()              │           │  │ ThumbnailCache  │  │   │
│  │  │ - bootEntry()               │           │  │ SpatialLayout   │  │   │
│  │  │ - updateLayout()            │           │  │ BootBridge      │  │   │
│  │  │ - pollStatus()              │           │  └─────────────────┘  │   │
│  │  └─────────────────────────────┘           └───────────────────────┘   │
│  │                                            │                           │
│  │  ┌──────────────────────────────┐           │      QEMU                │
│  │  │ DesktopObjectManager.js      │           │   (Direct Kernel Boot)   │
│  │  │ - loadCatalog()              │           │                          │
│  │  │ - bootObject()               │           └──────────────────────────┘
│  │  │ - moveObject()               │                       │
│  │  └─────────────────────────────┘                       │
│  │                    │                                   │
│  │  ┌─────────────────▼─────────────┐                     │
│  │  │ RTSDesktopObject.js           │                     │
│  │  │ - Visual sprite               │                     │
│  │  │ - Status indicator            │                     │
│  │  │ - Boot progress animation     │                     │
│  │  └───────────────────────────────┘                     │
│  └─────────────────────────────────────────────────────────┘
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Recommended Architecture (v1.2)

```
┌───────────────────────────────────────────────────────────────────────────────────────┐
│                         PROPOSED ARCHITECTURE (v1.2 Network Boot)                      │
├───────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                       │
│  ┌─────────────────────────────────────────────────────────────────────────────────┐ │
│  │                              FRONTEND (PixiJS v7)                                │ │
│  │                                                                                  │ │
│  │  ┌────────────────────────────────────────────────────────────────────────────┐ │ │
│  │  │                    RemoteCatalogClient (NEW)                                │ │ │
│  │  │                                                                             │ │ │
│  │  │  - Multiple server support        - Health monitoring                       │ │ │
│  │  │  - Server priority/fallback       - Connection state machine               │ │ │
│  │  │  - Remote catalog aggregation     - Timeout/retry logic                    │ │ │
│  │  └────────────────────────────────────────────────────────────────────────────┘ │ │
│  │                                     │                                            │ │
│  │                                     ▼                                            │ │
│  │  ┌────────────────────────────────────────────────────────────────────────────┐ │ │
│  │  │                    CatalogBridge.js (MODIFIED)                              │ │ │
│  │  │                                                                             │ │ │
│  │  │  NEW METHODS:                                                               │ │ │
│  │  │  - setRemoteServer(url)          - getRemoteEntry(entryId)                 │ │ │
│  │  │  - getRemoteCatalog()            - bootRemoteEntry(entryId, serverUrl)      │ │ │
│  │  │  - aggregateCatalogs()           - getServerHealth()                        │ │ │
│  │  │                                                                             │ │ │
│  │  │  EXISTING: (unchanged, for local fallback)                                  │ │ │
│  │  │  - getCatalog(), bootEntry(), updateLayout(), pollStatus()                  │ │ │
│  │  └────────────────────────────────────────────────────────────────────────────┘ │ │
│  │                                     │                                            │ │
│  │                                     ▼                                            │ │
│  │  ┌────────────────────────────────────────────────────────────────────────────┐ │ │
│  │  │                    CatalogCacheManager (NEW)                                │ │ │
│  │  │                                                                             │ │ │
│  │  │  - IndexedDB for offline catalogs    - Thumbnail caching                   │ │ │
│  │  │  - LRU eviction (reuse LRUTileCache)  - Metadata caching                   │ │ │
│  │  │  - Stale-while-revalidate pattern    - Cache invalidation                  │ │ │
│  │  └────────────────────────────────────────────────────────────────────────────┘ │ │
│  │                                                                                  │ │
│  │  DesktopObjectManager.js (MODIFIED)                                              │ │
│  │  - loadRemoteCatalog()           - handleRemoteBootProgress()                   │ │
│  │  - aggregateCatalogs()           - remoteStatusPolling()                        │ │
│  │                                                                                  │ │
│  │  RTSDesktopObject.js (UNCHANGED)                                                 │ │
│  │  - All existing functionality preserved                                          │ │
│  │                                                                                  │ │
│  └──────────────────────────────────────────────────────────────────────────────────┘ │
│                                          │                                            │
│                         ┌────────────────┼────────────────┐                          │
│                         │                │                │                          │
│                         ▼                ▼                ▼                          │
│  ┌──────────────────────────┐ ┌──────────────────┐ ┌──────────────────────────┐     │
│  │   Local Catalog Server   │ │ Remote Server 1  │ │   Remote Server N        │     │
│  │   (localhost:8080)       │ │ (server1:8080)   │ │   (serverN:8080)         │     │
│  │                          │ │                  │ │                          │     │
│  │  catalog_server.py       │ │ catalog_server   │ │  catalog_server          │     │
│  │  - Local .rts.png files  │ │ - Regional       │ │  - Edge location         │     │
│  │  - Local boot via QEMU   │ │ - Remote boot    │ │  - Cached images         │     │
│  └──────────────────────────┘ └──────────────────┘ └──────────────────────────┘     │
│                                                                                       │
└───────────────────────────────────────────────────────────────────────────────────────┘
```

## Component Boundaries

| Component | Responsibility | Communicates With | Modified/New |
|-----------|---------------|-------------------|--------------|
| RemoteCatalogClient | Multi-server catalog aggregation | CatalogBridge, Remote servers | **NEW** |
| CatalogBridge | API client abstraction | RemoteCatalogClient, Backend | **MODIFIED** |
| CatalogCacheManager | Offline/resilient catalog access | CatalogBridge, IndexedDB | **NEW** |
| DesktopObjectManager | Lifecycle management | CatalogBridge, RTSDesktopObject | **MODIFIED** |
| RTSDesktopObject | Visual representation | DesktopObjectManager | UNCHANGED |
| catalog_server.py | REST API endpoints | CatalogBridge, BootBridge | **MODIFIED** |

## New Components

### 1. RemoteCatalogClient.js

```javascript
/**
 * RemoteCatalogClient - Multi-server catalog aggregation
 *
 * Responsibilities:
 * - Connect to multiple remote catalog servers
 * - Aggregate catalogs from multiple sources
 * - Handle server health monitoring
 * - Fallback/priority chain for resilience
 */
class RemoteCatalogClient {
    constructor(servers = [], options = {}) {
        this.servers = servers;  // [{url, priority, label}]
        this.healthStatus = new Map();  // serverUrl -> {healthy, lastCheck}
        this.timeout = options.timeout || 5000;
        this.retryAttempts = options.retryAttempts || 3;
    }

    // Core methods
    async getAggregatedCatalog() { /* Merge catalogs from all servers */ }
    async getRemoteEntry(entryId, serverUrl) { /* Fetch from specific server */ }
    async bootRemoteEntry(entryId, serverUrl, options) { /* Remote boot */ }
    async checkServerHealth(serverUrl) { /* Health check */ }
    getServerPriority() { /* Return servers by health/priority */ }
}
```

### 2. CatalogCacheManager.js

```javascript
/**
 * CatalogCacheManager - Offline-first catalog caching
 *
 * Responsibilities:
 * - Store catalog entries in IndexedDB for offline access
 * - Cache thumbnails with LRU eviction
 * - Implement stale-while-revalidate pattern
 * - Provide instant UI while background refresh happens
 */
class CatalogCacheManager {
    constructor(options = {}) {
        this.dbName = options.dbName || 'pixelrts-catalog';
        this.thumbnailCache = new LRUTileCache({
            maxSize: options.maxThumbnails || 500,
            maxMemoryMB: options.maxThumbnailMemoryMB || 100
        });
    }

    // Core methods
    async getCachedCatalog(serverUrl) { /* Get from IndexedDB */ }
    async cacheCatalog(serverUrl, data) { /* Store in IndexedDB */ }
    async getCachedThumbnail(entryId) { /* Get cached thumbnail */ }
    async cacheThumbnail(entryId, base64Data) { /* Store thumbnail */ }
    async getStaleWhileRevalidate(serverUrl, fetchFn) { /* SWR pattern */ }
    async invalidate(serverUrl) { /* Clear cache for server */ }
}
```

## Modified Components

### CatalogBridge.js Modifications

```javascript
class CatalogBridge {
    constructor(baseUrl = 'http://localhost:8080', options = {}) {
        // EXISTING: Keep all current functionality
        this.baseUrl = baseUrl;
        this.timeout = options.timeout || 5000;
        // ...existing code...

        // NEW: Remote catalog support
        this.remoteClient = options.remoteClient || null;
        this.cacheManager = options.cacheManager || null;
        this.remoteServers = options.remoteServers || [];
    }

    // NEW METHODS (additive, no changes to existing methods)

    /**
     * Set remote catalog servers
     * @param {Array} servers - [{url, priority, label}]
     */
    setRemoteServers(servers) {
        this.remoteServers = servers;
        if (this.remoteClient) {
            this.remoteClient.servers = servers;
        }
    }

    /**
     * Get catalog from remote server with caching
     * @param {string} serverUrl - Remote server URL
     * @returns {Promise<Object|null>}
     */
    async getRemoteCatalog(serverUrl) {
        if (this.cacheManager) {
            return this.cacheManager.getStaleWhileRevalidate(
                serverUrl,
                () => this._fetchRemoteCatalog(serverUrl)
            );
        }
        return this._fetchRemoteCatalog(serverUrl);
    }

    /**
     * Aggregate catalogs from all configured servers
     * @returns {Promise<Object>} Merged catalog
     */
    async aggregateCatalogs() {
        if (!this.remoteClient) {
            return this.getCatalog();  // Fallback to local only
        }
        return this.remoteClient.getAggregatedCatalog();
    }

    /**
     * Boot entry from remote server
     * @param {string} entryId
     * @param {string} serverUrl
     * @param {Object} options
     */
    async bootRemoteEntry(entryId, serverUrl, options = {}) {
        // Remote boot sends request to remote server
        // Remote server handles QEMU boot locally
        return this._fetch(`${serverUrl}/api/v1/catalog/${entryId}/boot`, {
            method: 'POST',
            body: JSON.stringify(options)
        });
    }
}
```

### DesktopObjectManager.js Modifications

```javascript
class DesktopObjectManager {
    constructor(worldContainer, catalogBridge, options = {}) {
        // EXISTING: Keep all current functionality
        // ...existing code...

        // NEW: Remote catalog support
        this.remoteServers = options.remoteServers || [];
        this.aggregatedMode = options.aggregatedMode || false;
    }

    // NEW METHODS (additive)

    /**
     * Load aggregated catalog from all servers
     */
    async loadAggregatedCatalog() {
        const catalog = await this.bridge.aggregateCatalogs();

        if (!catalog || !catalog.entries) {
            console.warn('[DesktopObjectManager] No aggregated catalog data');
            return 0;
        }

        // Mark entries with their source server
        for (const entry of catalog.entries) {
            entry._sourceServer = entry._sourceServer || 'local';
        }

        // Clear and create objects
        this.clearAll();
        let created = 0;
        for (const entry of catalog.entries) {
            this.createObject(entry);
            created++;
        }

        this.emit('aggregated-catalog-loaded', { count: created });
        return created;
    }

    /**
     * Boot from specific server
     */
    async bootFromServer(entryId, serverUrl, options = {}) {
        const obj = this.objects.get(entryId);
        if (!obj) return null;

        obj.setStatus('booting');

        // Use remote boot if server is remote
        if (serverUrl && serverUrl !== this.bridge.baseUrl) {
            const result = await this.bridge.bootRemoteEntry(entryId, serverUrl, options);
            // Remote boot - status polling would be to remote server
            return result;
        }

        // Local boot (existing behavior)
        return this.bootObject(entryId, options);
    }
}
```

### catalog_server.py Modifications

```python
# Add new endpoints for network boot support

@app.get("/api/v1/catalog/remote")
async def get_remote_catalog(remote_url: str):
    """
    Fetch catalog from a remote server and proxy it.
    Useful for testing and for clients that can't reach remote directly.
    """
    # Implementation: proxy request to remote_url
    pass

@app.post("/api/v1/catalog/{entry_id}/remote-boot")
async def remote_boot_entry(entry_id: str, remote_url: str, options: BootOptions = BootOptions()):
    """
    Boot an entry from a remote server.
    Downloads required assets and boots locally.
    """
    # Implementation: fetch from remote, cache, boot locally
    pass

@app.get("/api/v1/servers")
async def list_configured_servers():
    """
    List all configured remote catalog servers.
    """
    # Return server list with health status
    pass

@app.get("/api/v1/health")
async def health_check():
    """
    Health check endpoint for remote server monitoring.
    """
    return {
        "status": "ok",
        "version": "1.2.0",
        "entries_count": len(get_catalog_server()._entries)
    }
```

## Data Flow Changes

### Current Flow (v1.1)

```
User Double-Click
       │
       ▼
DesktopObjectManager.bootObject()
       │
       ▼
CatalogBridge.bootEntry() ──────► POST /api/v1/catalog/{id}/boot
       │                                    │
       ▼                                    ▼
pollStatus() ◄───────────────────── BootBridge.boot()
       │                                    │
       ▼                                    ▼
_updateStatus()                      QEMU starts
       │
       ▼
RTSDesktopObject.setStatus('running')
```

### New Flow (v1.2 - Remote Boot)

```
User Double-Click on Remote Entry
       │
       ▼
DesktopObjectManager.bootFromServer(entryId, serverUrl)
       │
       ├─── serverUrl === local ──► bootObject() [EXISTING FLOW]
       │
       └─── serverUrl !== local
                  │
                  ▼
       CatalogBridge.bootRemoteEntry() ──► POST {remoteUrl}/api/v1/catalog/{id}/boot
                  │                                    │
                  ▼                                    ▼
       pollStatus(remoteUrl) ◄────────────── Remote BootBridge.boot()
                  │                                    │
                  ▼                                    ▼
       _updateStatus()                          Remote QEMU starts
                  │
                  ▼
       RTSDesktopObject.setStatus('running')
```

### Aggregated Catalog Flow (v1.2)

```
App Initialization
       │
       ▼
CatalogCacheManager.getStaleWhileRevalidate()
       │
       ├─── Cache HIT ──► Return cached catalog immediately
       │         │
       │         ▼
       │   Display entries instantly
       │         │
       │         ▼
       │   Background: fetch fresh catalog
       │         │
       │         ▼
       │   Update UI if changed
       │
       └─── Cache MISS
                 │
                 ▼
       RemoteCatalogClient.getAggregatedCatalog()
                 │
                 ├─── Parallel fetch from all servers
                 │         │
                 │         ├─── localhost:8080 ──► entries[]
                 │         ├─── server1:8080 ────► entries[]
                 │         └─── serverN:8080 ────► entries[]
                 │
                 ▼
       Merge entries, dedupe by ID, mark source server
                 │
                 ▼
       CatalogCacheManager.cacheCatalog()
                 │
                 ▼
       DesktopObjectManager.loadAggregatedCatalog()
```

## Integration Points

### 1. CatalogBridge Integration

| Method | Local | Remote | Changes Required |
|--------|-------|--------|------------------|
| getCatalog() | YES | NO | None (unchanged) |
| getRemoteCatalog() | NO | YES | **NEW** |
| aggregateCatalogs() | YES | YES | **NEW** |
| bootEntry() | YES | NO | None (unchanged) |
| bootRemoteEntry() | NO | YES | **NEW** |
| pollStatus() | YES | YES | Modified to accept serverUrl param |

### 2. DesktopObjectManager Integration

| Method | Local | Remote | Changes Required |
|--------|-------|--------|------------------|
| loadCatalog() | YES | NO | None (unchanged) |
| loadAggregatedCatalog() | YES | YES | **NEW** |
| bootObject() | YES | NO | None (unchanged) |
| bootFromServer() | YES | YES | **NEW** |
| startStatusPolling() | YES | YES | Modified to accept serverUrl param |

### 3. catalog_server.py Integration

| Endpoint | Local | Remote | Changes Required |
|----------|-------|--------|------------------|
| GET /api/v1/catalog | YES | NO | None (unchanged) |
| GET /api/v1/catalog/remote | NO | YES | **NEW** |
| POST /api/v1/catalog/{id}/boot | YES | NO | None (unchanged) |
| POST /api/v1/catalog/{id}/remote-boot | YES | YES | **NEW** |
| GET /api/v1/health | YES | YES | **MODIFIED** (add version, entry count) |
| GET /api/v1/servers | YES | NO | **NEW** |

## Build Order

Recommended implementation order to maintain working system at each step:

### Phase 1: Cache Infrastructure (No UI changes)

1. **CatalogCacheManager.js** - Create new component
   - IndexedDB setup for catalog storage
   - Thumbnail caching integration with LRUTileCache
   - Stale-while-revalidate pattern

2. **Test cache independently** - No integration yet

### Phase 2: Remote Client (No boot changes)

3. **RemoteCatalogClient.js** - Create new component
   - Multi-server connection management
   - Health monitoring
   - Catalog aggregation logic

4. **Modify CatalogBridge.js** - Add remote methods
   - setRemoteServers()
   - getRemoteCatalog()
   - aggregateCatalogs()
   - **Do NOT modify boot methods yet**

5. **Modify DesktopObjectManager.js** - Add aggregation
   - loadAggregatedCatalog()
   - Mark entries with source server

6. **Test aggregated catalog display** - Visual only, no boot

### Phase 3: Remote Boot

7. **Modify CatalogBridge.js** - Add remote boot
   - bootRemoteEntry()
   - Modify pollStatus() to accept serverUrl

8. **Modify DesktopObjectManager.js** - Add remote boot
   - bootFromServer()
   - Remote status polling

9. **Test remote boot flow** - End-to-end

### Phase 4: Backend Support

10. **Modify catalog_server.py** - Add remote endpoints
    - GET /api/v1/health (enhanced)
    - POST /api/v1/catalog/{id}/remote-boot
    - GET /api/v1/servers

11. **Integration testing** - Full system

### Phase 5: Polish

12. **Error handling** - Connection failures, timeouts
13. **UI feedback** - Loading states, server status indicators
14. **Performance optimization** - Cache warming, prefetch

## Anti-Patterns to Avoid

### Anti-Pattern 1: Synchronous Remote Fetch

**What:** Blocking UI while fetching from remote servers
**Why bad:** Remote servers may be slow or unavailable
**Instead:** Use stale-while-revalidate with loading states

```javascript
// BAD
async loadCatalog() {
    const catalog = await this.bridge.getRemoteCatalog(url);  // Blocks!
    this.render(catalog);
}

// GOOD
async loadCatalog() {
    const cached = await this.cacheManager.getCachedCatalog(url);
    if (cached) this.render(cached);  // Instant display

    const fresh = await this.cacheManager.getStaleWhileRevalidate(url, fetchFn);
    if (fresh !== cached) this.render(fresh);  // Update if changed
}
```

### Anti-Pattern 2: Single Server URL

**What:** Hardcoding single remote server URL
**Why bad:** No fallback if server is down
**Instead:** Multi-server configuration with priority

```javascript
// BAD
const bridge = new CatalogBridge('http://remote-server:8080');

// GOOD
const bridge = new CatalogBridge('http://localhost:8080', {
    remoteServers: [
        { url: 'http://remote1:8080', priority: 1 },
        { url: 'http://remote2:8080', priority: 2 },
        { url: 'http://fallback:8080', priority: 3 }
    ]
});
```

### Anti-Pattern 3: Duplicate Boot Logic

**What:** Copying boot logic for remote vs local
**Why bad:** Divergence, maintenance burden
**Instead:** Single boot path with server routing

```javascript
// BAD
async bootLocal(entryId) { /* 50 lines of boot logic */ }
async bootRemote(entryId) { /* 50 lines of similar logic */ }

// GOOD
async boot(entryId, serverUrl = null) {
    const targetUrl = serverUrl || this.baseUrl;
    // Single unified boot logic using targetUrl
}
```

## Scalability Considerations

| Concern | At 1 server | At 10 servers | At 100 servers |
|---------|-------------|---------------|----------------|
| Catalog fetch | 1 request | 10 parallel requests | Batch/aggregation server |
| Cache size | ~5MB | ~50MB | ~500MB with LRU eviction |
| Boot latency | Local QEMU | Remote QEMU (network) | Consider edge caching |
| Health monitoring | 1 health check | 10 parallel checks | Sampling + gossip |

## Sources

**HIGH Confidence:**
- Codebase analysis: CatalogBridge.js, DesktopObjectManager.js, RTSDesktopObject.js
- Codebase analysis: catalog_server.py, boot_bridge.py
- Codebase analysis: LRUTileCache.js (existing cache pattern)

**MEDIUM Confidence:**
- Architecture patterns based on standard REST API aggregation
- Cache patterns (stale-while-revalidate) - common web pattern

**LOW Confidence:**
- Remote QEMU boot latency (needs real-world testing)
- Optimal cache size for 100+ servers (theoretical)
