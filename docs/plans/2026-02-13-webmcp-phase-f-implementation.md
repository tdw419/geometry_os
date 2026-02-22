# WebMCP Phase F: AI-Driven Visual Builder — Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add 6 new WebMCP builder tools and a BuilderPanel UI that lets AI agents visually construct Geometry OS by placing tiles, loading shaders, and assembling cartridges.

**Architecture:** Extend webmcp_bridge.js with builder tools that manipulate a new BuilderPanel.js component. The panel provides Tile Palette, Shader Editor, Cartridge Rack, and Action Log. AI calls tools → tools trigger UI → UI updates Infinite Map → feedback returns to AI.

**Tech Stack:** JavaScript (WebMCP Bridge), PixiJS (Infinite Map), CSS (BuilderPanel), WebSocket (evolution backend)

---

## Task 1: Create BuilderPanel UI Shell

**Files:**
- Create: `systems/visual_shell/web/BuilderPanel.js`
- Create: `systems/visual_shell/web/BuilderPanel.css`

**Step 1: Create BuilderPanel.css**

Create `systems/visual_shell/web/BuilderPanel.css`:

```css
/**
 * BuilderPanel Styles - AI-Driven Visual Builder
 * Phase F: AI Builder UI
 */

.builder-panel {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 500px;
    max-height: 400px;
    background: rgba(10, 10, 15, 0.95);
    border: 1px solid #00ff88;
    border-radius: 8px;
    font-family: 'Courier New', monospace;
    color: #00ff88;
    z-index: 10000;
    overflow: hidden;
}

.builder-panel-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 15px;
    background: rgba(0, 255, 136, 0.1);
    border-bottom: 1px solid #333;
}

.builder-panel-header h3 {
    margin: 0;
    font-size: 14px;
    color: #00ffff;
}

.builder-panel-header button {
    background: transparent;
    border: 1px solid #00ff88;
    color: #00ff88;
    padding: 4px 8px;
    cursor: pointer;
    font-size: 12px;
    margin-left: 5px;
}

.builder-panel-header button:hover {
    background: #00ff88;
    color: #000;
}

.builder-tabs {
    display: flex;
    border-bottom: 1px solid #333;
}

.builder-tab {
    flex: 1;
    padding: 10px;
    text-align: center;
    cursor: pointer;
    border-bottom: 2px solid transparent;
    transition: all 0.2s;
}

.builder-tab:hover {
    background: rgba(0, 255, 136, 0.1);
}

.builder-tab.active {
    border-bottom-color: #00ff88;
    background: rgba(0, 255, 136, 0.15);
}

.builder-tab-content {
    display: none;
    padding: 15px;
}

.builder-tab-content.active {
    display: block;
}

/* Tile Palette */
.tile-palette {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
}

.tile-button {
    padding: 15px;
    background: #111;
    border: 1px solid #333;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    transition: all 0.2s;
}

.tile-button:hover {
    border-color: #00ff88;
}

.tile-button.selected {
    border-color: #00ff88;
    background: rgba(0, 255, 136, 0.2);
}

.tile-button .icon {
    font-size: 24px;
    display: block;
    margin-bottom: 5px;
}

.tile-button .label {
    font-size: 10px;
    text-transform: uppercase;
}

/* Shader Editor */
.shader-controls {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.shader-controls button {
    padding: 10px;
    background: #111;
    border: 1px solid #00ff88;
    color: #00ff88;
    cursor: pointer;
    font-family: inherit;
}

.shader-controls button:hover {
    background: #00ff88;
    color: #000;
}

.shader-status {
    font-size: 11px;
    color: #888;
    padding: 5px 0;
}

/* Cartridge Rack */
.cartridge-controls {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.cartridge-controls button {
    padding: 10px;
    background: #111;
    border: 1px solid #ff00ff;
    color: #ff00ff;
    cursor: pointer;
    font-family: inherit;
}

.cartridge-controls button:hover {
    background: #ff00ff;
    color: #000;
}

.cartridge-status {
    font-size: 11px;
    color: #888;
}

/* Action Log */
.action-log {
    max-height: 100px;
    overflow-y: auto;
    background: #000;
    border-top: 1px solid #333;
    padding: 10px;
}

.action-log-entry {
    font-size: 10px;
    padding: 3px 0;
    border-bottom: 1px solid #222;
}

.action-log-entry.success {
    color: #00ff88;
}

.action-log-entry.error {
    color: #ff4444;
}

.action-log-entry .timestamp {
    color: #666;
    margin-right: 8px;
}

/* Quick Actions */
.quick-actions {
    display: flex;
    gap: 5px;
    padding: 10px 15px;
    border-top: 1px solid #333;
}

.quick-actions button {
    flex: 1;
    padding: 8px;
    background: #111;
    border: 1px solid #555;
    color: #888;
    cursor: pointer;
    font-size: 11px;
    font-family: inherit;
}

.quick-actions button:hover {
    border-color: #00ff88;
    color: #00ff88;
}

/* Minimized state */
.builder-panel.minimized .builder-tabs,
.builder-panel.minimized .builder-tab-content,
.builder-panel.minimized .action-log,
.builder-panel.minimized .quick-actions {
    display: none;
}

.builder-panel.minimized {
    max-height: 40px;
}
```

**Step 2: Create BuilderPanel.js shell**

Create `systems/visual_shell/web/BuilderPanel.js`:

```javascript
/**
 * BuilderPanel - AI-Driven Visual Builder UI
 *
 * Provides the visual interface for AI agents to build Geometry OS
 * by triggering UI controls through WebMCP tools.
 *
 * Components:
 * - Tile Palette: Select and place tiles on Infinite Map
 * - Shader Editor: Load, evolve, preview WGSL shaders
 * - Cartridge Rack: Assemble PixelRTS cartridges
 * - Action Log: Real-time log of AI building actions
 *
 * @version 1.0.0
 * @phase Phase F: AI-Driven Visual Builder
 */

class BuilderPanel {
    /** @type {HTMLElement|null} */
    #container = null;

    /** @type {string} */
    #selectedTileType = 'system';

    /** @type {Object[]} */
    #actionLog = [];

    /** @type {Map<string, Object>} */
    #placedTiles = new Map();

    /** @type {Object|null} */
    #currentShader = null;

    /** @type {boolean} */
    #minimized = false;

    /** @type {Object|null} */
    #app = null;

    constructor() {
        // Wait for Geometry OS to be ready
        if (window.geometryOSApp) {
            this.#app = window.geometryOSApp;
            this.#init();
        } else {
            window.addEventListener('geometry-os-ready', () => {
                this.#app = window.geometryOSApp;
                this.#init();
            });
        }
    }

    #init() {
        this.#createContainer();
        this.#injectStyles();
        this.#render();
        this.#setupEventListeners();

        console.log('🏗️ BuilderPanel: Initialized');
    }

    #createContainer() {
        this.#container = document.createElement('div');
        this.#container.id = 'builder-panel';
        this.#container.className = 'builder-panel';
        document.body.appendChild(this.#container);
    }

    #injectStyles() {
        if (document.getElementById('builder-panel-styles')) return;

        const link = document.createElement('link');
        link.id = 'builder-panel-styles';
        link.rel = 'stylesheet';
        link.href = 'BuilderPanel.css';
        document.head.appendChild(link);
    }

    #render() {
        this.#container.innerHTML = `
            <div class="builder-panel-header">
                <h3>🏗️ AI Builder Panel</h3>
                <div>
                    <button id="builder-minimize">_</button>
                    <button id="builder-close">×</button>
                </div>
            </div>

            <div class="builder-tabs">
                <div class="builder-tab active" data-tab="tiles">📍 Tiles</div>
                <div class="builder-tab" data-tab="shaders">✨ Shaders</div>
                <div class="builder-tab" data-tab="cartridges">📦 Cartridges</div>
            </div>

            <div class="builder-tab-content active" data-content="tiles">
                <div class="tile-palette">
                    <div class="tile-button" data-tile="empty">
                        <span class="icon">⬜</span>
                        <span class="label">Empty</span>
                    </div>
                    <div class="tile-button selected" data-tile="system">
                        <span class="icon">⚙️</span>
                        <span class="label">System</span>
                    </div>
                    <div class="tile-button" data-tile="data">
                        <span class="icon">📊</span>
                        <span class="label">Data</span>
                    </div>
                    <div class="tile-button" data-tile="code">
                        <span class="icon">💻</span>
                        <span class="label">Code</span>
                    </div>
                    <div class="tile-button" data-tile="cartridge">
                        <span class="icon">📦</span>
                        <span class="label">Cartridge</span>
                    </div>
                    <div class="tile-button" data-tile="nursery">
                        <span class="icon">🌿</span>
                        <span class="label">Nursery</span>
                    </div>
                </div>
                <p style="font-size: 10px; color: #666; margin-top: 10px;">
                    Click map to place selected tile type
                </p>
            </div>

            <div class="builder-tab-content" data-content="shaders">
                <div class="shader-controls">
                    <button id="builder-load-shader">📂 Load WGSL Shader</button>
                    <button id="builder-evolve-shader">🧬 Evolve Shader</button>
                    <button id="builder-preview-shader">👁️ Preview</button>
                </div>
                <div class="shader-status">
                    Current: <span id="current-shader-name">none</span>
                </div>
            </div>

            <div class="builder-tab-content" data-content="cartridges">
                <div class="cartridge-controls">
                    <button id="builder-select-region">📐 Select Region</button>
                    <button id="builder-add-files">📁 Add Files</button>
                    <button id="builder-assemble">🔨 Assemble Cartridge</button>
                    <button id="builder-boot-test">▶️ Boot Test</button>
                </div>
                <div class="cartridge-status">
                    Files: <span id="cartridge-file-count">0</span> |
                    Size: <span id="cartridge-size">0 KB</span>
                </div>
            </div>

            <div class="action-log" id="builder-action-log">
                <div class="action-log-entry success">
                    <span class="timestamp">--:--:--</span>
                    Builder Panel initialized
                </div>
            </div>

            <div class="quick-actions">
                <button id="builder-preview">📸 Preview</button>
                <button id="builder-undo">🔄 Undo</button>
                <button id="builder-clear">🗑️ Clear</button>
                <button id="builder-save">💾 Save</button>
            </div>
        `;
    }

    #setupEventListeners() {
        // Tab switching
        this.#container.querySelectorAll('.builder-tab').forEach(tab => {
            tab.addEventListener('click', () => this.#switchTab(tab.dataset.tab));
        });

        // Tile selection
        this.#container.querySelectorAll('.tile-button').forEach(btn => {
            btn.addEventListener('click', () => this.#selectTile(btn.dataset.tile));
        });

        // Header buttons
        document.getElementById('builder-minimize').addEventListener('click', () => this.#toggleMinimize());
        document.getElementById('builder-close').addEventListener('click', () => this.#hide());

        // Quick actions
        document.getElementById('builder-preview').addEventListener('click', () => this.preview());
        document.getElementById('builder-undo').addEventListener('click', () => this.undo());
        document.getElementById('builder-clear').addEventListener('click', () => this.clear());
        document.getElementById('builder-save').addEventListener('click', () => this.save());

        // Shader buttons
        document.getElementById('builder-load-shader').addEventListener('click', () => {
            this.logAction('Load shader button clicked (use WebMCP tool)', 'info');
        });
        document.getElementById('builder-evolve-shader').addEventListener('click', () => {
            this.logAction('Evolve shader button clicked (use WebMCP tool)', 'info');
        });
    }

    #switchTab(tabName) {
        this.#container.querySelectorAll('.builder-tab').forEach(t => t.classList.remove('active'));
        this.#container.querySelectorAll('.builder-tab-content').forEach(c => c.classList.remove('active'));

        this.#container.querySelector(`.builder-tab[data-tab="${tabName}"]`).classList.add('active');
        this.#container.querySelector(`.builder-tab-content[data-content="${tabName}"]`).classList.add('active');
    }

    #selectTile(tileType) {
        this.#selectedTileType = tileType;
        this.#container.querySelectorAll('.tile-button').forEach(b => b.classList.remove('selected'));
        this.#container.querySelector(`.tile-button[data-tile="${tileType}"]`).classList.add('selected');
        this.logAction(`Selected tile type: ${tileType}`, 'info');
    }

    #toggleMinimize() {
        this.#minimized = !this.#minimized;
        this.#container.classList.toggle('minimized', this.#minimized);
    }

    #hide() {
        this.#container.style.display = 'none';
    }

    show() {
        this.#container.style.display = 'block';
    }

    // ─────────────────────────────────────────────────────────────
    // Public API (called by WebMCP tools)
    // ─────────────────────────────────────────────────────────────

    /**
     * Place a tile on the map
     * @param {string} tileType
     * @param {number} x
     * @param {number} y
     * @param {Object} options
     * @returns {Object}
     */
    placeTile(tileType, x, y, options = {}) {
        const tileId = `tile_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
        const size = options.size || 100;

        // Create tile data
        const tile = {
            tile_id: tileId,
            type: tileType,
            x,
            y,
            size,
            metadata: options.metadata || {},
            created_at: new Date().toISOString()
        };

        this.#placedTiles.set(tileId, tile);

        // Visual placement on Infinite Map (if available)
        if (this.#app?.worldContainer) {
            this.#renderTile(tile);
        }

        this.logAction(`Placed '${tileType}' tile at (${x}, ${y})`, 'success');

        return {
            success: true,
            tile_id: tileId,
            position: { x, y },
            size
        };
    }

    #renderTile(tile) {
        // Create a PixiJS sprite/graphics for the tile
        const graphics = new PIXI.Graphics();

        // Color based on type
        const colors = {
            empty: 0x444444,
            system: 0x00ff88,
            data: 0x00ffff,
            code: 0xffff00,
            cartridge: 0xff00ff,
            nursery: 0x88ff88
        };

        const color = colors[tile.type] || 0x666666;
        const gridSize = this.#app.config?.gridSize || 100;
        const x = tile.x * gridSize;
        const y = tile.y * gridSize;

        graphics.beginFill(color, 0.3);
        graphics.lineStyle(2, color, 1);
        graphics.drawRect(x, y, tile.size, tile.size);
        graphics.endFill();

        // Add label
        const label = new PIXI.Text(tile.type, {
            fontFamily: 'Courier New',
            fontSize: 10,
            fill: color
        });
        label.x = x + 5;
        label.y = y + 5;
        graphics.addChild(label);

        graphics.tileId = tile.tile_id;
        this.#app.worldContainer.addChild(graphics);

        tile.graphics = graphics;
    }

    /**
     * Load a shader into the editor
     * @param {string} name
     * @param {string} wgslCode
     * @returns {Object}
     */
    loadShader(name, wgslCode) {
        const shaderId = `shader_${Date.now()}`;

        this.#currentShader = {
            shader_id: shaderId,
            name,
            code: wgslCode,
            evolved: false,
            loaded_at: new Date().toISOString()
        };

        document.getElementById('current-shader-name').textContent = name;
        this.logAction(`Loaded shader '${name}' (${wgslCode.length} chars)`, 'success');

        return {
            success: true,
            shader_id: shaderId,
            name,
            preview_ready: true
        };
    }

    /**
     * Log an action to the Action Log
     * @param {string} message
     * @param {string} status - 'success', 'error', 'info'
     */
    logAction(message, status = 'info') {
        const timestamp = new Date().toLocaleTimeString();
        const entry = { timestamp, message, status };
        this.#actionLog.push(entry);

        const logContainer = document.getElementById('builder-action-log');
        if (logContainer) {
            const div = document.createElement('div');
            div.className = `action-log-entry ${status}`;
            div.innerHTML = `<span class="timestamp">${timestamp}</span>${message}`;
            logContainer.appendChild(div);
            logContainer.scrollTop = logContainer.scrollHeight;
        }

        console.log(`🏗️ BuilderPanel: ${message}`);
    }

    /**
     * Get current builder state
     * @returns {Object}
     */
    getState() {
        return {
            tiles: Array.from(this.#placedTiles.values()).map(t => ({
                tile_id: t.tile_id,
                type: t.type,
                position: { x: t.x, y: t.y }
            })),
            current_shader: this.#currentShader ? {
                shader_id: this.#currentShader.shader_id,
                name: this.#currentShader.name,
                evolved: this.#currentShader.evolved
            } : null,
            selected_tile_type: this.#selectedTileType
        };
    }

    /**
     * Preview current build
     */
    preview() {
        this.logAction('Preview captured', 'success');
        return { success: true, message: 'Preview captured (use builder_preview tool for image)' };
    }

    /**
     * Undo last action
     */
    undo() {
        // Remove last placed tile
        const tiles = Array.from(this.#placedTiles.values());
        if (tiles.length > 0) {
            const lastTile = tiles[tiles.length - 1];
            this.#placedTiles.delete(lastTile.tile_id);

            if (lastTile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(lastTile.graphics);
            }

            this.logAction(`Undid tile at (${lastTile.x}, ${lastTile.y})`, 'info');
            return { success: true };
        }

        this.logAction('Nothing to undo', 'info');
        return { success: false, message: 'Nothing to undo' };
    }

    /**
     * Clear all placed tiles
     */
    clear() {
        const count = this.#placedTiles.size;

        this.#placedTiles.forEach(tile => {
            if (tile.graphics && this.#app?.worldContainer) {
                this.#app.worldContainer.removeChild(tile.graphics);
            }
        });

        this.#placedTiles.clear();
        this.logAction(`Cleared ${count} tiles`, 'info');

        return { success: true, cleared_count: count };
    }

    /**
     * Save current build
     */
    save() {
        const state = this.getState();
        const json = JSON.stringify(state, null, 2);

        // Create download
        const blob = new Blob([json], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `builder_state_${Date.now()}.json`;
        a.click();
        URL.revokeObjectURL(url);

        this.logAction('Build state saved', 'success');
        return { success: true, tiles_saved: state.tiles.length };
    }
}

// Auto-initialize
window.builderPanel = new BuilderPanel();

console.log('🏗️ BuilderPanel loaded - AI-Driven Visual Builder ready.');
```

**Step 3: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/BuilderPanel.js`
Expected: No errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/BuilderPanel.js systems/visual_shell/web/BuilderPanel.css
git commit -m "feat(webmcp): add BuilderPanel UI shell for AI-driven visual building"
```

---

## Task 2: Add Builder Tools to WebMCP Bridge

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Add builder tools registration calls**

In `webmcp_bridge.js`, in the `#register()` method, after Phase D tool registrations, add:

```javascript
            // Phase F tools - AI-Driven Visual Builder
            await this.#registerBuilderPlaceTile();
            await this.#registerBuilderLoadShader();
            await this.#registerBuilderEvolveShader();
            await this.#registerBuilderAssembleCartridge();
            await this.#registerBuilderPreview();
            await this.#registerBuilderGetState();
```

**Step 2: Implement Tool 12: builder_place_tile**

Add after the existing tool handlers:

```javascript
    // ─────────────────────────────────────────────────────────────
    // Tool 12: builder_place_tile (Phase F)
    // ─────────────────────────────────────────────────────────────

    async #registerBuilderPlaceTile() {
        const tool = {
            name: 'builder_place_tile',
            description:
                'Place a tile on the infinite map at specific coordinates. ' +
                'The AI uses this to visually construct Geometry OS by placing ' +
                'system, code, data, or cartridge tiles.',
            inputSchema: {
                type: 'object',
                properties: {
                    tile_type: {
                        type: 'string',
                        enum: ['empty', 'system', 'data', 'code', 'cartridge', 'nursery'],
                        description: 'Type of tile to place'
                    },
                    x: {
                        type: 'number',
                        description: 'Grid X coordinate'
                    },
                    y: {
                        type: 'number',
                        description: 'Grid Y coordinate'
                    },
                    size: {
                        type: 'number',
                        description: 'Tile size in pixels (default: 100)',
                        default: 100
                    },
                    metadata: {
                        type: 'object',
                        description: 'Optional tile metadata'
                    }
                },
                required: ['tile_type', 'x', 'y']
            },
            handler: async (params) => {
                return this.#handleBuilderPlaceTile(params);
            }
        };

        await navigator.modelContext.registerTool(tool);
        this.#registeredTools.push(tool.name);
    }

    async #handleBuilderPlaceTile({ tile_type, x, y, size = 100, metadata = {} }) {
        this.#trackCall('builder_place_tile');

        // Validate tile_type
        const validTypes = ['empty', 'system', 'data', 'code', 'cartridge', 'nursery'];
        if (!tile_type || !validTypes.includes(tile_type)) {
            return {
                success: false,
                error: `tile_type must be one of: ${validTypes.join(', ')}`,
                error_code: 'INVALID_INPUT'
            };
        }

        // Validate coordinates
        if (typeof x !== 'number' || typeof y !== 'number') {
            return {
                success: false,
                error: 'x and y must be numbers',
                error_code: 'INVALID_INPUT'
            };
        }

        try {
            // Use BuilderPanel if available
            if (window.builderPanel) {
                const result = window.builderPanel.placeTile(tile_type, x, y, { size, metadata });
                return result;
            }

            // Fallback if panel not available
            return {
                success: true,
                tile_id: `tile_${Date.now()}`,
                position: { x, y },
                size,
                note: 'BuilderPanel not initialized - tile placed virtually'
            };

        } catch (err) {
            return {
                success: false,
                error: err.message,
                error_code: 'EXECUTION_FAILED'
            };
        }
    }
```

**Step 3: Implement Tool 13-17 (abbreviated for plan)**

Add similar handlers for:
- `builder_load_shader` - calls `window.builderPanel.loadShader(name, code)`
- `builder_evolve_shader` - triggers evolution and returns preview
- `builder_assemble_cartridge` - assembles from region
- `builder_preview` - captures screenshot of region
- `builder_get_state` - returns `window.builderPanel.getState()`

**Step 4: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js`
Expected: No errors

**Step 5: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): add Phase F builder tools (place_tile, load_shader, evolve, assemble, preview, get_state)"
```

---

## Task 3: Create Builder Test Page

**Files:**
- Create: `systems/visual_shell/web/test_builder_tools.html`

**Step 1: Create test page**

Create `systems/visual_shell/web/test_builder_tools.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebMCP Phase F: AI Builder Tools Test</title>
    <style>
        body {
            font-family: 'Courier New', monospace;
            background: #0a0a0f;
            color: #00ff88;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        h1 { color: #00ffff; border-bottom: 1px solid #333; padding-bottom: 10px; }
        h2 { color: #ff00ff; margin-top: 30px; }
        .test-section {
            background: #111;
            border: 1px solid #333;
            padding: 15px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .test-result {
            padding: 10px;
            margin: 5px 0;
            border-radius: 4px;
        }
        .pass { background: #001a00; border-left: 3px solid #00ff00; }
        .fail { background: #1a0000; border-left: 3px solid #ff0000; }
        .pending { background: #1a1a00; border-left: 3px solid #ffff00; }
        button {
            background: #222;
            color: #00ff88;
            border: 1px solid #00ff88;
            padding: 8px 16px;
            cursor: pointer;
            margin: 5px;
            font-family: inherit;
        }
        button:hover { background: #00ff88; color: #000; }
        pre {
            background: #000;
            padding: 10px;
            overflow-x: auto;
            font-size: 12px;
        }
        #summary { font-size: 18px; padding: 20px; background: #111; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>🏗️ WebMCP Phase F: AI Builder Tools Test</h1>

    <div class="test-section">
        <h2>Prerequisites Check</h2>
        <div id="prereq-results"></div>
    </div>

    <div class="test-section">
        <h2>Builder Tool Registration</h2>
        <div id="tool-results"></div>
    </div>

    <div class="test-section">
        <h2>BuilderPanel UI Tests</h2>
        <div id="panel-results"></div>
    </div>

    <div class="test-section">
        <h2>Interactive Builder Test</h2>
        <button onclick="testPlaceTile()">Place System Tile</button>
        <button onclick="testLoadShader()">Load Test Shader</button>
        <button onclick="testGetState()">Get Builder State</button>
        <button onclick="testPreview()">Preview</button>
        <button onclick="testUndo()">Undo</button>
        <div id="interactive-results"></div>
    </div>

    <div id="summary">
        <strong>Test Summary:</strong> <span id="summary-text">Run tests to see results</span>
    </div>

    <div style="margin-top: 20px;">
        <button onclick="runAllTests()">▶ Run All Tests</button>
        <button onclick="location.reload()">↻ Reload Page</button>
    </div>

    <script>
        const results = { passed: 0, failed: 0, pending: 0 };

        function updateSummary() {
            document.getElementById('summary-text').innerHTML =
                `<span style="color:#00ff00">${results.passed} passed</span> ` +
                `<span style="color:#ff0000">${results.failed} failed</span> ` +
                `<span style="color:#ffff00">${results.pending} pending</span>`;
        }

        function addResult(containerId, test, status, message = '') {
            const container = document.getElementById(containerId);
            const div = document.createElement('div');
            div.className = `test-result ${status}`;
            div.innerHTML = `<strong>${test}</strong>: ${status.toUpperCase()}${message ? `<br><pre>${message}</pre>` : ''}`;
            container.appendChild(div);
            results[status === 'pass' ? 'passed' : status === 'fail' ? 'failed' : 'pending']++;
            updateSummary();
        }

        async function testPrerequisites() {
            const container = 'prereq-results';

            const webmcpAvailable = typeof navigator !== 'undefined' && 'modelContext' in navigator;
            addResult(container, 'WebMCP API available',
                webmcpAvailable ? 'pass' : 'pending',
                webmcpAvailable ? 'navigator.modelContext detected' : 'Chrome 146+ required');

            const bridgeReady = typeof window.webmcpBridge !== 'undefined';
            addResult(container, 'WebMCP Bridge loaded',
                bridgeReady ? 'pass' : 'fail',
                bridgeReady ? JSON.stringify(window.webmcpBridge.getStatus()) : 'webmcp_bridge.js not loaded');

            const panelReady = typeof window.builderPanel !== 'undefined';
            addResult(container, 'BuilderPanel loaded',
                panelReady ? 'pass' : 'fail',
                panelReady ? 'BuilderPanel initialized' : 'BuilderPanel.js not loaded');

            return webmcpAvailable && bridgeReady && panelReady;
        }

        async function testToolRegistration() {
            const container = 'tool-results';
            const status = window.webmcpBridge?.getStatus();

            if (!status) {
                addResult(container, 'Tool registration check', 'fail', 'Bridge not available');
                return false;
            }

            const builderTools = [
                'builder_place_tile',
                'builder_load_shader',
                'builder_evolve_shader',
                'builder_assemble_cartridge',
                'builder_preview',
                'builder_get_state'
            ];

            let allRegistered = true;
            for (const tool of builderTools) {
                const registered = status.tools.includes(tool);
                addResult(container, `Tool: ${tool}`,
                    registered ? 'pass' : 'fail',
                    registered ? 'Registered' : 'NOT registered');
                if (!registered) allRegistered = false;
            }

            return allRegistered;
        }

        async function testPanelUI() {
            const container = 'panel-results';

            const panel = document.getElementById('builder-panel');
            addResult(container, 'BuilderPanel DOM element',
                panel ? 'pass' : 'fail',
                panel ? 'Found in document' : 'Not found');

            const tabs = document.querySelectorAll('.builder-tab');
            addResult(container, 'BuilderPanel tabs',
                tabs.length >= 3 ? 'pass' : 'fail',
                `${tabs.length}/3 tabs found`);

            const tileButtons = document.querySelectorAll('.tile-button');
            addResult(container, 'Tile palette buttons',
                tileButtons.length >= 6 ? 'pass' : 'fail',
                `${tileButtons.length}/6 tile buttons found`);

            const actionLog = document.getElementById('builder-action-log');
            addResult(container, 'Action log element',
                actionLog ? 'pass' : 'fail',
                actionLog ? 'Found' : 'Not found');

            return true;
        }

        async function testPlaceTile() {
            const container = 'interactive-results';
            if (!window.builderPanel) {
                addResult(container, 'Place tile', 'fail', 'BuilderPanel not available');
                return;
            }

            const result = window.builderPanel.placeTile('system', 5, 5, { size: 100 });
            addResult(container, 'Place tile at (5, 5)',
                result.success ? 'pass' : 'fail',
                JSON.stringify(result, null, 2));
        }

        async function testLoadShader() {
            const container = 'interactive-results';
            if (!window.builderPanel) {
                addResult(container, 'Load shader', 'fail', 'BuilderPanel not available');
                return;
            }

            const testWGSL = '@compute @workgroup_size(64) fn main() { }';
            const result = window.builderPanel.loadShader('test_shader', testWGSL);
            addResult(container, 'Load test shader',
                result.success ? 'pass' : 'fail',
                JSON.stringify(result, null, 2));
        }

        async function testGetState() {
            const container = 'interactive-results';
            if (!window.builderPanel) {
                addResult(container, 'Get state', 'fail', 'BuilderPanel not available');
                return;
            }

            const state = window.builderPanel.getState();
            addResult(container, 'Get builder state',
                state ? 'pass' : 'fail',
                JSON.stringify(state, null, 2));
        }

        async function testPreview() {
            const container = 'interactive-results';
            if (!window.builderPanel) {
                addResult(container, 'Preview', 'fail', 'BuilderPanel not available');
                return;
            }

            const result = window.builderPanel.preview();
            addResult(container, 'Preview build',
                result.success ? 'pass' : 'fail',
                JSON.stringify(result, null, 2));
        }

        async function testUndo() {
            const container = 'interactive-results';
            if (!window.builderPanel) {
                addResult(container, 'Undo', 'fail', 'BuilderPanel not available');
                return;
            }

            const result = window.builderPanel.undo();
            addResult(container, 'Undo last action',
                result.success ? 'pass' : 'pending',
                JSON.stringify(result, null, 2));
        }

        async function runAllTests() {
            results.passed = 0;
            results.failed = 0;
            results.pending = 0;

            document.getElementById('prereq-results').innerHTML = '';
            document.getElementById('tool-results').innerHTML = '';
            document.getElementById('panel-results').innerHTML = '';
            document.getElementById('interactive-results').innerHTML = '';

            await testPrerequisites();
            await testToolRegistration();
            await testPanelUI();

            updateSummary();
        }

        window.addEventListener('load', () => {
            setTimeout(runAllTests, 1000);
        });
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_builder_tools.html
git commit -m "test(webmcp): add Phase F AI Builder tools test page"
```

---

## Task 4: Integrate BuilderPanel with Application

**Files:**
- Modify: `systems/visual_shell/web/index.html`
- Modify: `systems/visual_shell/web/application.js`

**Step 1: Add BuilderPanel script to index.html**

In `index.html`, after the webmcp_bridge.js script tag, add:

```html
    <!-- Phase F: AI-Driven Visual Builder -->
    <script src="BuilderPanel.js"></script>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/index.html systems/visual_shell/web/application.js
git commit -m "feat(webmcp): integrate BuilderPanel with Visual Shell"
```

---

## Task 5: Final Verification

**Step 1: Verify JavaScript syntax**

Run: `node --check systems/visual_shell/web/webmcp_bridge.js && node --check systems/visual_shell/web/BuilderPanel.js`
Expected: No errors

**Step 2: Count tools**

Run: `grep -c "builder_" systems/visual_shell/web/webmcp_bridge.js`
Expected: 20+ occurrences

**Step 3: Final commit**

```bash
git add -A
git commit -m "feat(webmcp): complete Phase F - AI-Driven Visual Builder

- Add BuilderPanel UI with Tile Palette, Shader Editor, Cartridge Rack
- Add 6 new WebMCP tools: builder_place_tile, builder_load_shader,
  builder_evolve_shader, builder_assemble_cartridge, builder_preview,
  builder_get_state
- Add Action Log for real-time AI activity tracking
- Add builder_tools_test.html for verification

Total WebMCP tools: 17 (Phase A: 4, Phase B: 4, Phase D: 3, Phase F: 6)"
```

---

## Success Criteria

1. ✅ 6 new builder tools registered (17 total WebMCP tools)
2. ✅ BuilderPanel UI renders with Tile/Shader/Cartridge tabs
3. ✅ `builder_place_tile` creates visible tiles on Infinite Map
4. ✅ Action Log shows real-time AI activity
5. ✅ JavaScript syntax valid
6. ✅ All changes committed

---

## References

- Design Doc: `docs/plans/2026-02-13-webmcp-phase-f-design.md`
- WebMCP Bridge: `systems/visual_shell/web/webmcp_bridge.js`
- BuilderPanel: `systems/visual_shell/web/BuilderPanel.js`
