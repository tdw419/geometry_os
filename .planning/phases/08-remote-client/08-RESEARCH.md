# Phase 8: Remote Client - Research

**Researched:** 2026-02-27
**Domain:** Web client for remote catalog servers, stale-while-revalidate, UI components
**Confidence:** HIGH

## Summary

This phase adds the ability for users to browse and discover containers from remote catalog servers. The existing codebase already has well-established patterns for stale-while-revalidate caching (CatalogBridge.js), status indicators (RTSDesktopObject.js), and settings persistence (ModelRegistry pattern with localStorage). The implementation should extend these existing patterns rather than introducing new dependencies.

Key architectural decisions already established in the codebase:
- Native `fetch` API with `AbortController` for timeouts (5s default, 10s for remote servers)
- Cache-first fetching with background revalidation in CatalogBridge.js
- PIXI.js for canvas rendering with status indicator badges
- localStorage for user preferences/settings persistence
- Event-driven architecture using PIXI.utils.EventEmitter

**Primary recommendation:** Extend existing CatalogBridge and RTSDesktopObject classes to support remote servers, following established patterns for settings persistence (ModelRegistry pattern).

## Standard Stack

The established libraries/tools for this domain (all already in use):

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| PIXI.js | 8.x | Canvas rendering for desktop objects | Already used for RTSDesktopObject, infinite canvas |
| Native Fetch | - | HTTP requests | Already used in CatalogBridge, no external deps needed |
| localStorage | - | User settings persistence | Already used for preferences in multiple modules |
| IndexedDB | - | Container data caching | Already used in CatalogCacheManager |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| PIXI.utils.EventEmitter | 8.x | Event-driven communication | For server status change events |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Native fetch | Axios | Axios adds 13KB for features we don't need (already have timeout via AbortController) |
| localStorage | IndexedDB | IndexedDB is overkill for server list (small data, simple structure) |
| Custom settings UI | Third-party component | Would break visual consistency with existing BuilderPanel pattern |

**Installation:** No new dependencies required - all needed APIs already in codebase.

## Architecture Patterns

### Recommended Project Structure

Based on existing patterns in `/systems/visual_shell/web/`:

```
systems/visual_shell/web/
├── RemoteCatalogManager.js     # NEW: Manages remote server list, fetches from multiple sources
├── RemoteServerSettings.js     # NEW: Settings panel UI for managing servers
├── CatalogBridge.js            # EXTEND: Add multi-server support
├── RTSDesktopObject.js         # EXTEND: Add remote server badge/indicator
└── DesktopObjectManager.js     # EXTEND: Handle remote container creation
```

### Pattern 1: Remote Server Configuration Storage

**What:** localStorage-based server configuration following ModelRegistry pattern
**When to use:** Storing user's remote server list with metadata

**Example:**
```javascript
// Storage key: 'gos-remote-servers'
// Pattern from model_registry.js

class RemoteServerRegistry {
    static STORAGE_KEY = 'gos-remote-servers';

    constructor() {
        this.servers = new Map();
        this._load();
    }

    _load() {
        try {
            const stored = localStorage.getItem(RemoteServerRegistry.STORAGE_KEY);
            if (stored) {
                const data = JSON.parse(stored);
                data.forEach(server => this.servers.set(server.id, server));
            }
        } catch (e) {
            console.warn('[RemoteServerRegistry] Failed to load:', e);
        }
    }

    _save() {
        const data = Array.from(this.servers.values());
        localStorage.setItem(RemoteServerRegistry.STORAGE_KEY, JSON.stringify(data));
    }

    addServer(config) {
        const server = {
            id: config.id || crypto.randomUUID(),
            url: config.url,
            displayName: config.displayName || config.url,
            color: config.color || this._generateColor(),
            enabled: config.enabled !== false,
            addedAt: Date.now(),
            lastStatus: 'unknown',
            lastChecked: null
        };
        this.servers.set(server.id, server);
        this._save();
        return server;
    }
}
```

### Pattern 2: Stale-While-Revalidate for Remote Catalogs

**What:** Non-blocking catalog fetch with cached fallback
**When to use:** Loading remote container lists without blocking UI

**Example:** (Already implemented in CatalogBridge.js, extend for multi-server)
```javascript
// From CatalogBridge.js lines 133-197 - extend this pattern

async getRemoteCatalog(serverId, options = {}) {
    const server = this.servers.get(serverId);
    if (!server || !server.enabled) {
        return null;
    }

    const cacheKey = `remote-catalog-${serverId}`;
    const cached = this._getCachedCatalog(cacheKey);

    // Return cached immediately if available
    if (cached && !options.forceRefresh) {
        // Check staleness
        const staleStatus = this._getStaleStatus(cached);
        if (staleStatus.isStale && !staleStatus.isExpired) {
            // Trigger background revalidation (don't await)
            this._revalidateRemoteCatalog(serverId, cacheKey);
        }
        return cached;
    }

    // Fetch fresh with 10s timeout (per CONTEXT.md)
    const data = await this._fetchWithTimeout(
        `${server.url}/api/v1/catalog`,
        { timeout: 10000 }
    );

    if (data) {
        this._cacheCatalog(cacheKey, data);
        return data;
    }

    // Fallback to stale cache on network failure
    return cached;
}
```

### Pattern 3: Remote Server Badge on Desktop Objects

**What:** Colored dot indicator showing remote server origin
**When to use:** Displaying remote containers on canvas

**Example:** (Extend RTSDesktopObject.js)
```javascript
// Add to RTSDesktopObject constructor, similar to cacheStatusIndicator (lines 339-369)

_createRemoteServerBadge(serverColor) {
    const { OBJECT_WIDTH, PADDING, STATUS_INDICATOR_SIZE } = RTSDesktopObject.DIMENSIONS;

    // Position below main status indicator
    this.remoteBadge = new PIXI.Graphics();
    this.remoteBadge.x = OBJECT_WIDTH - PADDING - STATUS_INDICATOR_SIZE - 2;
    this.remoteBadge.y = PADDING + 6 + STATUS_INDICATOR_SIZE * 2 + 8;

    // Draw colored circle with server's color
    const radius = (STATUS_INDICATOR_SIZE - 4) / 2;  // Smaller than status
    this.remoteBadge.circle(radius, radius, radius);
    this.remoteBadge.fill({ color: serverColor, alpha: 1 });
    this.remoteBadge.circle(radius, radius, radius);
    this.remoteBadge.stroke({ color: 0x000000, width: 1 });

    // Hidden by default - shown only for remote containers
    this.remoteBadge.visible = false;

    this.addChild(this.remoteBadge);

    // Tooltip for server name on hover
    this._createRemoteBadgeTooltip();
}

// Set server origin on container
setRemoteServer(server) {
    if (!server) {
        this.remoteBadge.visible = false;
        return;
    }

    this.remoteBadge.visible = true;
    this._remoteServer = server;

    // Redraw badge with server's color
    const radius = (RTSDesktopObject.DIMENSIONS.STATUS_INDICATOR_SIZE - 4) / 2;
    this.remoteBadge.clear();
    this.remoteBadge.circle(radius, radius, radius);
    this.remoteBadge.fill({ color: server.color, alpha: 1 });
}
```

### Pattern 4: Settings Panel UI

**What:** HTML-based settings panel following BuilderPanel.js pattern
**When to use:** Managing remote server configuration

**Example:** (Based on BuilderPanel.js structure)
```javascript
class RemoteServerSettings {
    constructor() {
        this.container = null;
        this.registry = new RemoteServerRegistry();
        this._createContainer();
        this._injectStyles();
        this._render();
    }

    _createContainer() {
        this.container = document.createElement('div');
        this.container.id = 'remote-server-settings';
        this.container.className = 'settings-panel';
        document.body.appendChild(this.container);
    }

    _render() {
        this.container.innerHTML = `
            <div class="settings-panel-header">
                <h3>Remote Catalog Servers</h3>
                <button class="close-btn">&times;</button>
            </div>
            <div class="server-list">
                ${this._renderServerList()}
            </div>
            <div class="add-server-form">
                <input type="url" placeholder="Server URL..." id="new-server-url">
                <input type="text" placeholder="Display Name (optional)" id="new-server-name">
                <input type="color" id="new-server-color" value="#00ff88">
                <button id="add-server-btn">Add Server</button>
            </div>
        `;
    }

    _renderServerList() {
        return Array.from(this.registry.servers.values()).map(server => `
            <div class="server-entry ${server.lastStatus === 'error' ? 'error' : ''}">
                <span class="server-color" style="background: ${server.color}"></span>
                <span class="server-name">${server.displayName}</span>
                <span class="server-status ${server.lastStatus}">${server.lastStatus}</span>
                <button class="toggle-btn" data-id="${server.id}">
                    ${server.enabled ? 'Disable' : 'Enable'}
                </button>
                <button class="remove-btn" data-id="${server.id}">Remove</button>
            </div>
        `).join('');
    }
}
```

### Pattern 5: Skeleton Loader for Remote Containers

**What:** Placeholder visual while fetching remote catalog
**When to use:** Initial load of remote server containers

**Example:**
```javascript
// Skeleton container object for loading state
class SkeletonDesktopObject extends PIXI.Container {
    constructor(gridX, gridY) {
        super();

        const { OBJECT_WIDTH, OBJECT_HEIGHT } = RTSDesktopObject.DIMENSIONS;

        // Placeholder background with shimmer effect
        this.background = new PIXI.Graphics();
        this.background.rect(0, 0, OBJECT_WIDTH, OBJECT_HEIGHT);
        this.background.fill({ color: 0x2a2a2a, alpha: 0.9 });
        this.addChild(this.background);

        // Placeholder thumbnail area
        this.thumbnailPlaceholder = new PIXI.Graphics();
        this.thumbnailPlaceholder.rect(6, 10, 128, 128);
        this.thumbnailPlaceholder.fill({ color: 0x3a3a3a, alpha: 1 });
        this.addChild(this.thumbnailPlaceholder);

        // Placeholder name line
        this.namePlaceholder = new PIXI.Graphics();
        this.namePlaceholder.rect(20, 148, 100, 10);
        this.namePlaceholder.fill({ color: 0x3a3a3a, alpha: 1 });
        this.addChild(this.namePlaceholder);

        // Set position
        this.x = gridX * 160;
        this.y = gridY * 200;

        // Start shimmer animation
        this._startShimmer();
    }

    _startShimmer() {
        let alpha = 0.3;
        let direction = 1;

        const animate = () => {
            alpha += 0.02 * direction;
            if (alpha >= 0.6) direction = -1;
            if (alpha <= 0.3) direction = 1;

            this.thumbnailPlaceholder.alpha = alpha;
            this.namePlaceholder.alpha = alpha;

            if (this.parent) {
                requestAnimationFrame(animate);
            }
        };

        animate();
    }
}
```

### Anti-Patterns to Avoid

- **Blocking UI on remote fetch:** Never await remote catalog fetch in main thread - always use stale-while-revalidate
- **Hardcoded server URLs:** All servers must come from localStorage configuration
- **Duplicate server entries:** Validate URL uniqueness before adding
- **Ignoring error state display:** Unreachable servers must show error status (red indicator) in settings panel
- **Forgetting to persist changes:** Every add/remove/enable/disable must call `_save()`

## Don't Hand-Roll

Problems that look simple but have existing solutions in codebase:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| HTTP timeout handling | Custom setTimeout | `AbortController` in `_createTimeoutSignal()` (CatalogBridge.js:34-42) | Already tested, handles edge cases |
| Cache staleness check | Custom timestamp logic | `CatalogCacheManager.getStaleStatus()` | Handles all edge cases |
| Settings persistence | Custom JSON storage | ModelRegistry pattern with localStorage | Auto-save, validation, events |
| Status indicator drawing | Custom PIXI code | `RTSDesktopObject._drawStatusCircle()` | Consistent visual style |
| Event handling | Custom callbacks | `PIXI.utils.EventEmitter` | Memory-safe, well-tested |

**Key insight:** The codebase has mature patterns for all needed functionality. The implementation is primarily about composing existing patterns in new ways, not creating new infrastructure.

## Common Pitfalls

### Pitfall 1: Mixed Local/Remote Container IDs
**What goes wrong:** Remote containers may have same IDs as local containers
**Why it happens:** Different servers may use similar naming (e.g., "ubuntu-22.04")
**How to avoid:** Prefix remote container IDs with server ID: `${serverId}:${entryId}`
**Warning signs:** Container appearing twice, wrong container being booted

### Pitfall 2: UI Blocking During Remote Fetch
**What goes wrong:** Canvas freezes while fetching remote catalog
**Why it happens:** Awaiting fetch in main update loop
**How to avoid:** Always use stale-while-revalidate pattern; show cached/skeleton immediately
**Warning signs:** Frame rate drops when opening remote server, input lag

### Pitfall 3: Lost Server Configuration
**What goes wrong:** User's server list disappears on browser clear
**Why it happens:** localStorage cleared by user or browser
**How to avoid:** Graceful degradation - show empty state, quick-add button prominent
**Warning signs:** Settings panel empty after browser refresh (in normal usage)

### Pitfall 4: Server Color Conflicts
**What goes wrong:** Multiple servers have same/similar colors
**Why it happens:** Auto-generated colors may collide
**How to avoid:** Hash URL to generate color, allow user override
**Warning signs:** Hard to distinguish which server a container belongs to

### Pitfall 5: Timeout Too Short
**What goes wrong:** Valid servers marked as unreachable
**Why it happens:** Remote servers may have higher latency
**How to avoid:** Use 10 second timeout as specified in CONTEXT.md (not default 5s)
**Warning signs:** Servers showing error state intermittently

## Code Examples

### Remote Catalog Manager (Core Class)

```javascript
// Source: Pattern from CatalogBridge.js + ModelRegistry.js
// File: systems/visual_shell/web/RemoteCatalogManager.js

class RemoteCatalogManager extends PIXI.utils.EventEmitter {
    static STORAGE_KEY = 'gos-remote-servers';
    static DEFAULT_TIMEOUT = 10000; // 10 seconds per CONTEXT.md

    constructor(options = {}) {
        super();

        this.timeout = options.timeout || RemoteCatalogManager.DEFAULT_TIMEOUT;
        this.servers = new Map();
        this.catalogCache = new Map(); // serverId -> catalog data

        this._loadServers();
    }

    _loadServers() {
        try {
            const stored = localStorage.getItem(RemoteCatalogManager.STORAGE_KEY);
            if (stored) {
                const servers = JSON.parse(stored);
                servers.forEach(s => this.servers.set(s.id, s));
            }
        } catch (e) {
            console.warn('[RemoteCatalogManager] Failed to load servers:', e);
        }
    }

    _saveServers() {
        const data = Array.from(this.servers.values());
        localStorage.setItem(RemoteCatalogManager.STORAGE_KEY, JSON.stringify(data));
    }

    addServer(config) {
        if (this._urlExists(config.url)) {
            throw new Error('Server URL already exists');
        }

        const server = {
            id: config.id || crypto.randomUUID(),
            url: config.url.replace(/\/$/, ''),
            displayName: config.displayName || new URL(config.url).hostname,
            color: config.color || this._generateColor(config.url),
            enabled: config.enabled !== false,
            addedAt: Date.now(),
            lastStatus: 'pending',
            lastChecked: null,
            lastError: null
        };

        this.servers.set(server.id, server);
        this._saveServers();
        this.emit('server-added', server);

        // Immediately try to connect
        this.checkServerHealth(server.id);

        return server;
    }

    removeServer(serverId) {
        const server = this.servers.get(serverId);
        if (!server) return false;

        this.servers.delete(serverId);
        this.catalogCache.delete(serverId);
        this._saveServers();
        this.emit('server-removed', server);

        return true;
    }

    async checkServerHealth(serverId) {
        const server = this.servers.get(serverId);
        if (!server) return;

        try {
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), this.timeout);

            const response = await fetch(`${server.url}/api/v1/health`, {
                signal: controller.signal
            });

            clearTimeout(timeoutId);

            if (response.ok) {
                server.lastStatus = 'connected';
                server.lastError = null;
            } else {
                server.lastStatus = 'error';
                server.lastError = `HTTP ${response.status}`;
            }
        } catch (e) {
            server.lastStatus = 'error';
            server.lastError = e.name === 'AbortError' ? 'Timeout' : e.message;
        }

        server.lastChecked = Date.now();
        this._saveServers();
        this.emit('server-status-changed', server);
    }

    async fetchCatalog(serverId, options = {}) {
        const server = this.servers.get(serverId);
        if (!server || !server.enabled) {
            return null;
        }

        const cacheKey = serverId;
        const cached = this.catalogCache.get(cacheKey);

        // Stale-while-revalidate: return cached immediately
        if (cached && !options.forceRefresh) {
            // Trigger background refresh if stale (>5 minutes old)
            if (Date.now() - cached.fetchedAt > 5 * 60 * 1000) {
                this._refreshCatalogInBackground(serverId);
            }
            return cached.data;
        }

        // Fetch fresh
        try {
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), this.timeout);

            const response = await fetch(`${server.url}/api/v1/catalog`, {
                signal: controller.signal
            });

            clearTimeout(timeoutId);

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}`);
            }

            const data = await response.json();

            // Tag entries with server info
            if (data.entries) {
                data.entries = data.entries.map(entry => ({
                    ...entry,
                    _serverId: serverId,
                    _serverName: server.displayName,
                    _serverColor: server.color,
                    id: `${serverId}:${entry.id}` // Compound ID
                }));
            }

            // Cache the result
            this.catalogCache.set(cacheKey, {
                data,
                fetchedAt: Date.now()
            });

            server.lastStatus = 'connected';
            server.lastError = null;
            server.lastChecked = Date.now();
            this._saveServers();

            return data;

        } catch (e) {
            server.lastStatus = 'error';
            server.lastError = e.name === 'AbortError' ? 'Timeout' : e.message;
            server.lastChecked = Date.now();
            this._saveServers();
            this.emit('server-status-changed', server);

            // Return stale cache as fallback
            return cached?.data || null;
        }
    }

    async _refreshCatalogInBackground(serverId) {
        try {
            await this.fetchCatalog(serverId, { forceRefresh: true });
            this.emit('catalog-refreshed', { serverId });
        } catch (e) {
            console.warn(`[RemoteCatalogManager] Background refresh failed for ${serverId}:`, e);
        }
    }

    _urlExists(url) {
        const normalized = url.replace(/\/$/, '');
        for (const server of this.servers.values()) {
            if (server.url.replace(/\/$/, '') === normalized) {
                return true;
            }
        }
        return false;
    }

    _generateColor(url) {
        // Hash URL to generate consistent color
        let hash = 0;
        for (let i = 0; i < url.length; i++) {
            hash = ((hash << 5) - hash) + url.charCodeAt(i);
            hash = hash & hash;
        }

        // Generate hue from hash, keep saturation and lightness in good range
        const hue = Math.abs(hash % 360);
        return this._hslToHex(hue, 70, 50);
    }

    _hslToHex(h, s, l) {
        s /= 100;
        l /= 100;
        const a = s * Math.min(l, 1 - l);
        const f = n => {
            const k = (n + h / 30) % 12;
            const color = l - a * Math.max(Math.min(k - 3, 9 - k, 1), -1);
            return Math.round(255 * color).toString(16).padStart(2, '0');
        };
        return parseInt(`${f(0)}${f(8)}${f(4)}`, 16);
    }

    getEnabledServers() {
        return Array.from(this.servers.values()).filter(s => s.enabled);
    }

    getAllServers() {
        return Array.from(this.servers.values());
    }
}

export { RemoteCatalogManager };
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Single catalog server | Multi-server support | Phase 8 | Users can browse multiple catalogs |
| Blocking fetch | Stale-while-revalidate | Already in codebase | Non-blocking UI |
| Manual ID management | Compound IDs (server:entry) | Phase 8 | No ID collisions |

**Deprecated/outdated:**
- XMLHttpRequest: Use native `fetch` with AbortController instead
- Callback-based API: Use EventEmitter pattern for status changes

## Open Questions

1. **Quick-Add Button Placement**
   - What we know: CONTEXT.md specifies quick-add button on canvas
   - What's unclear: Exact position - should it float, be in toolbar, or context menu?
   - Recommendation: Add to existing toolbar or as floating action button in corner

2. **Remote Container Layout Persistence**
   - What we know: Local containers persist layout to server
   - What's unclear: Should remote container positions persist locally or to remote server?
   - Recommendation: Persist locally (localStorage) since remote server may not support layout API

3. **Server Health Check Frequency**
   - What we know: Need to show server status in settings
   - What's unclear: How often to re-check server health
   - Recommendation: Check on load, on settings open, and allow manual refresh (don't auto-poll to save bandwidth)

## Sources

### Primary (HIGH confidence)
- `systems/visual_shell/web/CatalogBridge.js` - Stale-while-revalidate pattern, AbortController timeout
- `systems/visual_shell/web/CatalogCacheManager.js` - IndexedDB caching, staleness checking
- `systems/visual_shell/web/RTSDesktopObject.js` - Status indicators, cache badges, error overlays
- `systems/visual_shell/web/DesktopObjectManager.js` - Object lifecycle, event handling
- `systems/visual_shell/web/model_registry.js` - localStorage persistence pattern

### Secondary (MEDIUM confidence)
- `systems/visual_shell/web/BuilderPanel.js` - UI panel pattern with HTML injection

### Tertiary (LOW confidence)
- None required - all patterns found in codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All components already exist in codebase
- Architecture: HIGH - Clear patterns established by existing code
- Pitfalls: HIGH - Based on analysis of existing code patterns

**Research date:** 2026-02-27
**Valid until:** 30 days - stable patterns unlikely to change
