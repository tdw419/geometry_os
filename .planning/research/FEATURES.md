# Feature Landscape: Network Boot for PixelRTS

**Domain:** Network boot / remote container distribution
**Researched:** 2026-02-27
**Confidence:** MEDIUM (based on existing codebase analysis + domain knowledge; WebSearch unavailable)

## Executive Summary

Network boot for PixelRTS extends the existing local boot system to support fetching .rts.png containers from remote HTTP servers. The core user experience remains the same (click-to-boot with visual progress), but adds remote URL resolution, download progress visualization, and local caching for offline access.

The existing infrastructure already provides:
- Desktop objects with thumbnails on infinite canvas
- Click-to-boot with progress visualization (RTSDesktopObject)
- Status polling and error handling (CatalogBridge, DesktopObjectManager)
- Position persistence (SpatialLayoutManager)

## Table Stakes

Features users expect. Missing = product feels incomplete or broken.

| Feature | Why Expected | Complexity | Dependencies | Notes |
|---------|--------------|------------|--------------|-------|
| **Remote URL boot** | Core promise of network boot | Medium | CatalogBridge | Boot .rts.png from HTTP/HTTPS URL |
| **Download progress indicator** | Users need feedback during fetch | Medium | RTSDesktopObject | Shows bytes downloaded, percent, speed |
| **Connection error handling** | Networks are unreliable | Low | Existing error system | Timeout, DNS failure, 404, auth errors |
| **Cache to local storage** | Avoid re-downloading large files | Medium | New CacheManager | Store fetched containers locally |
| **Cache hit detection** | Don't download if already cached | Medium | CacheManager | Check by URL hash or server-provided ID |
| **Boot from cache** | Seamless offline operation | Low | CacheManager + BootBridge | Reuse existing local boot flow |
| **Remote catalog browsing** | Discover available containers | Medium | New RemoteCatalogClient | List containers from remote server |
| **Remote metadata fetch** | Show info before downloading | Low | RemoteCatalogClient | Name, size, kernel version, distro |

## Differentiators

Features that set PixelRTS apart from traditional PXE/network boot.

| Feature | Value Proposition | Complexity | Dependencies | Notes |
|---------|-------------------|------------|--------------|-------|
| **Visual progress during download** | Unique visual boot experience extends to fetch phase | Low | RTSDesktopObject | Animate thumbnail "filling in" as bytes arrive |
| **Predictive pre-fetch** | Anticipate what user will boot based on hover/focus | Medium | PredictivePrefetcher (existing) | Start download on hover, cancel if unhovered |
| **Delta updates** | Only download changed bytes when updating containers | High | Server support required | Reduces bandwidth for version updates |
| **Multi-source aggregation** | Combine catalogs from multiple servers | Medium | RemoteCatalogClient | Browse containers from heterogeneous sources |
| **P2P distribution** | Share containers peer-to-peer | Very High | WebRTC infrastructure | Beyond v1.2 scope |
| **Checksum verification** | Verify integrity of downloaded containers | Low | Existing VERIFY system | SHA256 hash comparison after download |
| **Bandwidth-aware behavior** | Throttle downloads on slow connections | Medium | Network detection | Pause/resume support |

## Anti-Features

Features to explicitly NOT build. Common mistakes in this domain.

| Anti-Feature | Why Avoid | What to Do Instead |
|--------------|-----------|-------------------|
| **Auto-update containers** | Breaks reproducibility, surprises user | Explicit update command with preview |
| **Background downloads** | Consumes bandwidth user might need | Only download on explicit action or hover-prefetch |
| **Centralized registry** | Single point of failure, vendor lock-in | Support any HTTP server, user provides URLs |
| **Required authentication** | Blocks casual exploration | Support anonymous access, auth optional |
| **Real-time sync** | Over-engineering for file distribution | Pull-based refresh, user-initiated |
| **Cloud storage integration** | Scope creep, multiple providers | Generic HTTP only, users can point to any host |
| **Container signing/PKI** | Premature security complexity | Defer to post-MVP, use HTTPS for transport security |

## Feature Dependencies

```
Remote URL Boot
    |
    +-- RemoteCatalogClient (new)
    |       |
    |       +-- HTTP fetch for catalog.json
    |       +-- Entry metadata parsing
    |
    +-- RemoteContainerFetcher (new)
    |       |
    |       +-- Fetch .rts.png from URL
    |       +-- Progress events
    |       +-- Cache storage
    |
    +-- CacheManager (new)
    |       |
    |       +-- Local file cache
    |       +-- LRU eviction
    |       +-- Cache hit lookup
    |
    +-- RTSDesktopObject (enhanced)
    |       |
    |       +-- Download progress visualization
    |       +-- Remote vs local indicator
    |       +-- Error recovery
    |
    +-- CatalogBridge (enhanced)
            |
            +-- Remote catalog endpoints
            +-- Hybrid local/remote entries
```

## Expected Network Boot Behavior

Based on domain knowledge of PXE, HTTP boot, and container distribution:

### Typical Flow (Happy Path)

1. **Discovery**: User browses remote catalog OR enters URL directly
2. **Metadata Fetch**: System retrieves container metadata (name, size, hash)
3. **Cache Check**: System checks if container already cached locally
4. **Download** (if not cached):
   - Show download progress with bytes/total, speed estimate
   - Allow cancel
   - Store to cache with hash verification
5. **Boot**: Use existing local boot flow from cached file
6. **Status**: Existing status polling shows boot progress

### Error Scenarios

| Error | Expected Behavior |
|-------|-------------------|
| Network timeout | Show "Connection timeout" with retry button |
| DNS failure | Show "Server not found" with URL for user to verify |
| HTTP 404 | Show "Container not found at URL" |
| HTTP 401/403 | Show "Access denied" - may need credentials |
| Disk full | Show "Not enough disk space" with size needed |
| Hash mismatch | Show "Download corrupted" with retry option |
| Server error (5xx) | Show "Server error" with retry later suggestion |

### Progress Indicators

For downloads, users expect:
- Percentage complete (0-100%)
- Bytes transferred (e.g., "45 MB / 120 MB")
- Transfer speed (e.g., "2.3 MB/s")
- Time remaining estimate (e.g., "~30 seconds remaining")
- Cancel button

## MVP Recommendation

For v1.2 milestone, prioritize:

1. **Remote URL boot** - Core feature, enables network operation
2. **Download progress indicator** - Essential UX for large files
3. **Local caching** - Avoids re-download, enables offline use
4. **Cache hit detection** - Transparent to user, improves experience
5. **Error handling** - Network errors must be graceful

Defer to post-MVP:
- **Remote catalog browsing**: Can add URLs manually in v1.2
- **Delta updates**: Requires server protocol changes
- **Multi-source aggregation**: Nice-to-have, not essential
- **Predictive pre-fetch**: Can enhance UX later

## Integration with Existing System

### RTSDesktopObject Enhancements

The existing `RTSDesktopObject` class already has:
- Progress bar with stages (`BOOT_STAGES`)
- Error overlay with guidance (`ERROR_GUIDANCE`)
- Status indicator colors (`STATUS_COLORS`)

**Additions needed:**
- New status: `downloading` (separate from `booting`)
- New boot stages for download phase:
  - `FETCHING: { label: 'Downloading...', startPercent: 0, endPercent: 30 }`
- Download progress method: `setDownloadProgress(percent, bytesDownloaded, totalBytes)`
- Remote origin indicator (show URL or "remote" badge)

### CatalogBridge Enhancements

The existing `CatalogBridge` has:
- `bootEntry()` - triggers boot
- `getStatus()` - polls for status
- `refresh()` - rescans catalog

**Additions needed:**
- `fetchRemoteEntry(url)` - fetch metadata from remote URL
- `downloadRemoteContainer(url, onProgress)` - download with progress callback
- `getCachedEntry(url)` - check cache for existing download

### New Components

| Component | Responsibility |
|-----------|---------------|
| `RemoteCatalogClient` | Fetch catalog.json from remote servers |
| `RemoteContainerFetcher` | Download .rts.png files with progress events |
| `CacheManager` | Manage local cache of downloaded containers |

## Sources

- Existing codebase analysis (HIGH confidence)
- Domain knowledge of network boot patterns (MEDIUM confidence - training data)
- WebSearch attempted but unavailable (would provide current best practices)

## Confidence Assessment

| Area | Level | Reason |
|------|-------|--------|
| Existing system integration | HIGH | Direct codebase analysis |
| Table stakes features | MEDIUM | Based on domain knowledge, not web research |
| Differentiators | LOW | Speculative without market research |
| Anti-features | MEDIUM | Based on common pitfalls knowledge |
| Technical feasibility | HIGH | Existing architecture supports extension |

---

*Research completed: 2026-02-27*
*Next step: Requirements definition for v1.2 milestone*
