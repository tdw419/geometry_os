# Pitfalls: Network Boot for PixelRTS

**Domain:** Network boot / remote container distribution
**Researched:** 2026-02-27
**Confidence:** MEDIUM (based on codebase analysis and domain knowledge)

## Executive Summary

Network boot introduces reliability risks from network dependencies. The critical pitfalls fall into three categories: (1) blocking the UI during network operations, (2) creating fragile single-server dependencies, and (3) duplicating logic between local and remote code paths. All can be avoided by using existing async patterns, implementing multi-server fallback, and maintaining a unified code path.

## Critical Pitfalls

### 1. Synchronous Remote Fetch (CRITICAL)

**What goes wrong:** Blocking UI while fetching from remote servers makes the interface feel broken when networks are slow or unavailable.

**Symptom:** Users see frozen interface during catalog fetch or boot operations.

**Prevention:**
- Use stale-while-revalidate pattern (CatalogCacheManager)
- Display cached content immediately, update in background
- Show loading states, not blocking spinners

**Code pattern to use:**
```javascript
// GOOD: Instant display from cache, background refresh
async loadCatalog() {
    const cached = await this.cacheManager.getCachedCatalog(url);
    if (cached) this.render(cached);  // Instant
    const fresh = await this.fetchRemote(url);
    if (fresh !== cached) this.render(fresh);
}
```

### 2. Single Server Dependency (CRITICAL)

**What goes wrong:** Hardcoding a single remote server URL creates a single point of failure. When that server is down, the entire feature fails.

**Symptom:** "Unable to connect" errors when the single configured server is unavailable, even if other servers could serve content.

**Prevention:**
- Configure multiple servers with priority ordering
- Implement health monitoring and automatic failover
- Local catalog should always work as fallback

**Code pattern to use:**
```javascript
// GOOD: Multi-server with fallback
const bridge = new CatalogBridge('http://localhost:8080', {
    remoteServers: [
        { url: 'http://primary:8080', priority: 1 },
        { url: 'http://backup:8080', priority: 2 },
        { url: 'http://fallback:8080', priority: 3 }
    ]
});
```

### 3. Duplicate Boot Logic (CRITICAL)

**What goes wrong:** Copying boot logic for remote vs local creates two code paths that diverge over time, doubling maintenance burden and creating subtle bugs.

**Symptom:** Remote boot works differently than local boot, features added to one path are missing from the other.

**Prevention:**
- Single unified boot path with server routing
- Differ only in URL selection, not in boot logic
- Extract shared logic into helper methods

**Code pattern to use:**
```javascript
// GOOD: Unified boot with routing
async boot(entryId, serverUrl = null) {
    const targetUrl = serverUrl || this.baseUrl;
    // Single boot logic using targetUrl
}
```

## Moderate Pitfalls

### 4. Auto-Update Containers (MODERATE)

**What goes wrong:** Automatically updating containers breaks reproducibility. Users expect the same container to behave the same way on every boot.

**Symptom:** Container behavior changes unexpectedly after update, breaking workflows that depend on specific versions.

**Prevention:**
- Explicit update command with preview
- Version pinning by default
- Never auto-update without user consent

### 5. Background Downloads Without Consent (MODERATE)

**What goes wrong:** Downloading containers in the background consumes bandwidth the user might need for other tasks.

**Symptom:** Network slows down unexpectedly, data caps exceeded, user confused about what's using bandwidth.

**Prevention:**
- Only download on explicit user action (click)
- Prefetch only on hover (with quick cancel on unhover)
- Show network activity indicator

### 6. Centralized Registry (MODERATE)

**What goes wrong:** Building around a single centralized registry creates vendor lock-in and single point of failure.

**Symptom:** Users cannot use custom servers, entire ecosystem depends on one service staying online.

**Prevention:**
- Support any HTTP server
- User provides URLs, not locked into specific provider
- De-centralized by design

## Minor Pitfalls

### 7. Missing Cache Invalidation (MINOR)

**What goes wrong:** Cached content becomes stale, users see outdated catalog entries.

**Symptom:** New containers don't appear, old container info shown after server updates.

**Prevention:**
- TTL-based cache expiration (7-day default)
- Manual refresh option
- Content-hash verification for critical updates

### 8. Hash Mismatch Not Reported (MINOR)

**What goes wrong:** Corrupted downloads silently fail verification, leaving bad cache entries.

**Symptom:** Container fails to boot but error message is cryptic, user retries multiple times.

**Prevention:**
- Clear error message: "Download corrupted, retry?"
- Automatic retry with backoff
- Delete corrupted cache entries

### 9. Missing Progress Indicators (MINOR)

**What goes wrong:** Large downloads (100MB+) with no progress feedback feel like the app is frozen.

**Symptom:** Users cancel downloads thinking they're stuck, avoid network boot feature.

**Prevention:**
- Always show progress for downloads >1 second
- Include bytes transferred, speed estimate, time remaining
- Allow cancel at any time

## Phase Warnings

| Phase | Warning | Pitfall to Avoid |
|------|---------|------------------|
| Cache Infrastructure | Don't over-engineer cache eviction | Simple LRU sufficient for v1.2 |
| Remote Client | Don't add retry logic prematurely | Basic timeout + failover first |
| Remote Boot | Don't change local boot flow | Local boot must remain unchanged |
| Backend Support | Don't add authentication yet | Anonymous access for v1.2 |
| Polish | Don't optimize prematurely | Measure before optimizing |

## Risk Matrix

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Network timeout | HIGH | MEDIUM | Timeout + retry + fallback |
| Server unavailable | MEDIUM | HIGH | Multi-server + local fallback |
| Cache corruption | LOW | MEDIUM | Hash verification + auto-delete |
| UI freeze | MEDIUM | HIGH | Stale-while-revalidate pattern |
| Bandwidth exhaustion | LOW | LOW | Explicit download only |

## Sources

- Codebase analysis: CatalogBridge.js, DesktopObjectManager.js (HIGH confidence)
- Domain knowledge: Network boot patterns, distributed systems (MEDIUM confidence)
- Anti-pattern identification: Standard web architecture patterns (MEDIUM confidence)

---

*Research completed: 2026-02-27*
