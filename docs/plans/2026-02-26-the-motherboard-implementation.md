# The Motherboard Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Make the Infinite Map execute placed Resonance Glyphs - transforming the visual desktop into executable RAM.

**Architecture:** Create a GlyphExecutor bridge between PixiJS (visual layer) and WebGPU (execution layer). When glyphs are placed on the map, they're registered with the executor, which runs the visual_cpu_riscv_morph.wgsl shader to decode and execute them. Execution state is visualized as glyph "glow" effects.

**Tech Stack:** PixiJS v8, WebGPU, JavaScript ES6, Python (for atlas generation)

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                      THE MOTHERBOARD                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌─────────────┐    ┌─────────────────┐    ┌───────────────┐  │
│   │   PixiJS    │───▶│ GlyphExecutor   │───▶│   WebGPU      │  │
│   │  InfiniteMap│    │ (Bridge Layer)  │    │   Shader      │  │
│   └─────────────┘    └─────────────────┘    └───────────────┘  │
│         │                    │                     │           │
│         ▼                    ▼                     ▼           │
│   ┌─────────────┐    ┌─────────────────┐    ┌───────────────┐  │
│   │ Visual Glow │◀───│ Execution State │◀───│ Decoded Instr │  │
│   │   Effects   │    │   (Registers)   │    │  (32-bit)     │  │
│   └─────────────┘    └─────────────────┘    └───────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Prerequisites

Before starting, ensure these files exist:
- `systems/visual_shell/web/shaders/visual_cpu_riscv_morph.wgsl` ✅
- `systems/pixel_compiler/holographic_encoder.py` ✅
- `systems/visual_shell/web/assets/universal_font.rts.png` ✅
- `systems/visual_shell/web/infinite_map.js` ✅

---

## Task 1: Create GlyphExecutor Core Module

**Files:**
- Create: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Write the module skeleton**

```javascript
/**
 * GlyphExecutor - Bridges visual glyphs to GPU execution
 *
 * The Motherboard Phase 1: Execute glyphs placed on the Infinite Map
 */

class GlyphExecutor {
    constructor(options = {}) {
        this.options = {
            glyphSize: 16,
            maxCores: 64,
            cyclesPerFrame: 100,
            autoExecute: true,
            ...options
        };

        // WebGPU state
        this.device = null;
        this.context = null;
        this.pipeline = null;

        // Buffers
        this.textureBuffer = null;
        this.systemMemory = null;
        this.cpuStates = null;

        // Execution registry
        // Map: "x,y" -> { sprite, pc, active, lastResult }
        this.glyphRegistry = new Map();

        // State
        this.initialized = false;
        this.executing = false;

        console.log('🔮 GlyphExecutor created');
    }

    async init() {
        if (this.initialized) return true;

        try {
            await this.initWebGPU();
            this.initialized = true;
            console.log('✅ GlyphExecutor initialized');
            return true;
        } catch (e) {
            console.error('❌ GlyphExecutor init failed:', e);
            return false;
        }
    }

    async initWebGPU() {
        // Check WebGPU support
        if (!navigator.gpu) {
            throw new Error('WebGPU not supported');
        }

        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('No GPU adapter found');
        }

        this.device = await adapter.requestDevice();
        console.log('🎮 WebGPU device acquired');
    }

    // Placeholder methods - implemented in later tasks
    async loadAtlas(atlasPath) { throw new Error('Not implemented'); }
    registerGlyph(x, y, sprite) { throw new Error('Not implemented'); }
    unregisterGlyph(x, y) { throw new Error('Not implemented'); }
    execute() { throw new Error('Not implemented'); }
    getExecutionState(x, y) { throw new Error('Not implemented'); }
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { GlyphExecutor };
}
```

**Step 2: Verify the file was created**

Run: `ls -la systems/visual_shell/web/GlyphExecutor.js`
Expected: File exists with content

**Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(motherboard): add GlyphExecutor skeleton

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Implement WebGPU Pipeline Setup

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add shader loading and pipeline creation**

Add to `GlyphExecutor.js` after the `initWebGPU()` method:

```javascript
    async initWebGPU() {
        // Check WebGPU support
        if (!navigator.gpu) {
            throw new Error('WebGPU not supported');
        }

        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('No GPU adapter found');
        }

        this.device = await adapter.requestDevice();
        console.log('🎮 WebGPU device acquired');

        // Create buffers
        await this.createBuffers();
    }

    async createBuffers() {
        const { maxCores } = this.options;

        // System memory: 1MB of addressable space
        this.systemMemory = this.device.createBuffer({
            size: 1024 * 1024, // 1MB
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_READ | GPUBufferUsage.COPY_WRITE,
        });

        // CPU states: 46 registers per core (x0-x31, PC, status, etc.)
        const stateSize = maxCores * 46 * 4; // 46 u32 per core
        this.cpuStates = this.device.createBuffer({
            size: stateSize,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_READ | GPUBufferUsage.COPY_WRITE,
        });

        console.log(`📦 Buffers created: ${maxCores} cores, ${stateSize} bytes state`);
    }

    async loadAtlas(atlasPath) {
        const response = await fetch(atlasPath);
        const blob = await response.blob();
        const bitmap = await createImageBitmap(blob);

        this.atlasTexture = this.device.createTexture({
            size: [bitmap.width, bitmap.height, 1],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.RENDER_ATTACHMENT,
        });

        this.device.queue.copyExternalImageToTexture(
            { source: bitmap },
            { texture: this.atlasTexture },
            [bitmap.width, bitmap.height]
        );

        this.atlasWidth = bitmap.width;
        this.atlasHeight = bitmap.height;

        console.log(`🖼️ Atlas loaded: ${bitmap.width}x${bitmap.height}`);
        return true;
    }
```

**Step 2: Test buffer creation**

Create a simple test in browser console or add to an existing test file:

```javascript
// Quick sanity check
async function testGlyphExecutor() {
    const executor = new GlyphExecutor();
    const success = await executor.init();
    console.log('Init success:', success);
    return executor;
}
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(motherboard): add WebGPU buffer creation

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Implement Glyph Registry

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add glyph registration methods**

Add after `loadAtlas()`:

```javascript
    /**
     * Register a glyph placed on the map for execution.
     * @param {number} x - Map X coordinate
     * @param {number} y - Map Y coordinate
     * @param {object} sprite - PixiJS sprite containing the glyph
     * @param {number} atlasX - X position in atlas (in glyphs)
     * @param {number} atlasY - Y position in atlas (in glyphs)
     */
    registerGlyph(x, y, sprite, atlasX, atlasY) {
        const key = `${x},${y}`;

        // Assign a core ID based on position
        const coreId = this.glyphRegistry.size % this.options.maxCores;

        this.glyphRegistry.set(key, {
            sprite,
            atlasX,
            atlasY,
            coreId,
            pc: 0,
            active: true,
            lastResult: null,
            executionCount: 0,
            glowIntensity: 0,
        });

        console.log(`📝 Glyph registered at (${x},${y}), core ${coreId}`);
        return coreId;
    }

    /**
     * Unregister a glyph (removes from execution).
     */
    unregisterGlyph(x, y) {
        const key = `${x},${y}`;
        const entry = this.glyphRegistry.get(key);
        if (entry) {
            this.glyphRegistry.delete(key);
            console.log(`🗑️ Glyph unregistered at (${x},${y})`);
            return true;
        }
        return false;
    }

    /**
     * Get execution state for a glyph.
     */
    getExecutionState(x, y) {
        const key = `${x},${y}`;
        return this.glyphRegistry.get(key) || null;
    }

    /**
     * Get all active glyphs.
     */
    getActiveGlyphs() {
        return Array.from(this.glyphRegistry.entries())
            .filter(([_, entry]) => entry.active)
            .map(([key, entry]) => ({ key, ...entry }));
    }
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(motherboard): add glyph registration methods

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Implement Execution Loop

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add execution methods**

Add after `getActiveGlyphs()`:

```javascript
    /**
     * Execute all registered glyphs for one cycle.
     */
    async execute() {
        if (!this.initialized) {
            await this.init();
        }

        if (this.executing) {
            console.warn('⚠️ Execution already in progress');
            return;
        }

        this.executing = true;

        try {
            // Update CPU states buffer with current PC values
            await this.syncCPUIStates();

            // Run compute shader
            // (In full implementation, this dispatches visual_cpu_riscv_morph.wgsl)
            await this.dispatchCompute();

            // Read back results
            await this.readResults();

            // Update visual feedback
            this.updateVisualFeedback();

        } finally {
            this.executing = false;
        }
    }

    async syncCPUIStates() {
        // Create state array
        const states = new Uint32Array(this.options.maxCores * 46);

        for (const [key, entry] of this.glyphRegistry) {
            if (!entry.active) continue;

            const baseIdx = entry.coreId * 46;

            // Set PC to point to this glyph's position in atlas
            const glyphsPerRow = this.atlasWidth / this.options.glyphSize;
            states[baseIdx + 32] = entry.atlasY * glyphsPerRow + entry.atlasX;

            // Clear halt flag
            states[baseIdx + 38] = 0;
        }

        this.device.queue.writeBuffer(this.cpuStates, 0, states);
    }

    async dispatchCompute() {
        // Placeholder: In full implementation, this would:
        // 1. Create bind group with atlas texture, system memory, cpu states
        // 2. Create compute pipeline from visual_cpu_riscv_morph.wgsl
        // 3. Dispatch compute shader

        // For now, simulate execution
        for (const [key, entry] of this.glyphRegistry) {
            if (!entry.active) continue;

            entry.executionCount++;
            entry.lastResult = {
                cycles: 1,
                pc: entry.pc + 1,
                success: true,
            };
        }
    }

    async readResults() {
        // Read back CPU states
        const readBuffer = this.device.createBuffer({
            size: this.cpuStates.size,
            usage: GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ,
        });

        const encoder = this.device.createCommandEncoder();
        encoder.copyBufferToBuffer(this.cpuStates, 0, readBuffer, 0, this.cpuStates.size);
        this.device.queue.submit([encoder.finish()]);

        await readBuffer.mapAsync(GPUMapMode.READ);
        const states = new Uint32Array(readBuffer.getMappedRange().slice(0));
        readBuffer.unmap();

        // Update registry with results
        for (const [key, entry] of this.glyphRegistry) {
            const baseIdx = entry.coreId * 46;
            const halted = states[baseIdx + 38];

            if (halted) {
                entry.active = false;
                console.warn(`🛑 Core ${entry.coreId} halted (Geometric Fraud?)`);
            }
        }

        readBuffer.destroy();
    }

    updateVisualFeedback() {
        for (const [key, entry] of this.glyphRegistry) {
            if (!entry.sprite) continue;

            // Glow intensity based on execution activity
            const targetGlow = entry.active ? 0.3 + Math.sin(Date.now() / 200) * 0.1 : 0;
            entry.glowIntensity = entry.glowIntensity * 0.9 + targetGlow * 0.1;

            // Apply visual effect (if sprite has glow filter)
            if (entry.sprite.filters) {
                // Update existing glow filter
            }
        }
    }
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(motherboard): add execution loop

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Integrate with InfiniteMap

**Files:**
- Modify: `systems/visual_shell/web/infinite_map.js`

**Step 1: Add GlyphExecutor initialization**

Add to the `InfiniteMap` constructor, after existing initializations (around line 100):

```javascript
        // Phase: Motherboard - Glyph Executor
        if (typeof GlyphExecutor !== 'undefined') {
            this.glyphExecutor = new GlyphExecutor({
                maxCores: 64,
                cyclesPerFrame: 100,
                autoExecute: false, // Manual control initially
            });
            this.glyphExecutor.init().then(() => {
                return this.glyphExecutor.loadAtlas('/assets/universal_font.rts.png');
            }).then(() => {
                console.log('🔮 GlyphExecutor integrated with InfiniteMap');
            }).catch(e => {
                console.warn('⚠️ GlyphExecutor failed to initialize:', e);
            });
        }
```

**Step 2: Add glyph placement method**

Add to `InfiniteMap` class:

```javascript
    /**
     * Place an executable glyph on the map.
     * @param {number} mapX - Map X coordinate
     * @param {number} mapY - Map Y coordinate
     * @param {number} glyphCode - Glyph code (0-255 for ASCII, 200+ for ligatures)
     */
    async placeExecutableGlyph(mapX, mapY, glyphCode) {
        if (!this.glyphExecutor || !this.glyphExecutor.initialized) {
            console.warn('⚠️ GlyphExecutor not ready');
            return null;
        }

        // Calculate atlas position
        const glyphsPerRow = this.glyphExecutor.atlasWidth / 16;
        const atlasX = glyphCode % glyphsPerRow;
        const atlasY = Math.floor(glyphCode / glyphsPerRow);

        // Create sprite from atlas
        const sprite = this.createGlyphSprite(glyphCode, mapX, mapY);

        // Register with executor
        this.glyphExecutor.registerGlyph(mapX, mapY, sprite, atlasX, atlasY);

        // Add to visual container
        this.world.addChild(sprite);

        console.log(`✨ Placed executable glyph ${glyphCode} at (${mapX},${mapY})`);
        return sprite;
    }

    /**
     * Execute all glyphs on the map for one cycle.
     */
    async executeGlyphs() {
        if (!this.glyphExecutor) return;

        await this.glyphExecutor.execute();

        // Log results
        const active = this.glyphExecutor.getActiveGlyphs();
        console.log(`⚡ Executed ${active.length} glyphs`);
    }

    createGlyphSprite(glyphCode, mapX, mapY) {
        // Create a PixiJS sprite from the atlas
        // This is a simplified version - full implementation would
        // extract the correct 16x16 region from the atlas
        const sprite = new PIXI.Sprite();
        sprite.x = mapX * this.config.tileScale;
        sprite.y = mapY * this.config.tileScale;
        sprite.width = 16;
        sprite.height = 16;
        sprite.eventMode = 'static';
        sprite.cursor = 'pointer';

        // Store glyph code for reference
        sprite.glyphCode = glyphCode;

        return sprite;
    }
```

**Step 3: Add keyboard shortcut for execution**

Add to `setupKeyboardShortcuts()` method:

```javascript
        // Ctrl+Enter: Execute glyphs
        document.addEventListener('keydown', (e) => {
            if (e.ctrlKey && e.key === 'Enter') {
                e.preventDefault();
                this.executeGlyphs();
            }
        });
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/infinite_map.js
git commit -m "feat(motherboard): integrate GlyphExecutor with InfiniteMap

- Add placeExecutableGlyph() method
- Add executeGlyphs() method
- Add Ctrl+Enter shortcut for execution

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Create Test Page

**Files:**
- Create: `systems/visual_shell/web/test_motherboard.html`

**Step 1: Create the test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geometry OS - The Motherboard Test</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #0a0a0f;
            color: #e0e0e0;
            font-family: 'JetBrains Mono', monospace;
            overflow: hidden;
        }
        #app {
            width: 100vw;
            height: 100vh;
        }
        #controls {
            position: fixed;
            top: 10px;
            left: 10px;
            background: rgba(0,0,0,0.8);
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #333;
            z-index: 1000;
        }
        #controls h3 {
            margin-bottom: 10px;
            color: #00ff88;
        }
        #controls button {
            background: #1a1a2e;
            color: #00ff88;
            border: 1px solid #00ff88;
            padding: 8px 16px;
            margin: 5px;
            cursor: pointer;
            border-radius: 4px;
        }
        #controls button:hover {
            background: #00ff88;
            color: #0a0a0f;
        }
        #status {
            margin-top: 10px;
            font-size: 12px;
            color: #888;
        }
        #glyph-palette {
            position: fixed;
            bottom: 10px;
            left: 10px;
            background: rgba(0,0,0,0.8);
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #333;
        }
        .glyph-btn {
            width: 32px;
            height: 32px;
            margin: 2px;
            background: #1a1a2e;
            color: #fff;
            border: 1px solid #444;
            cursor: pointer;
        }
        .glyph-btn:hover {
            border-color: #00ff88;
        }
        .glyph-btn.selected {
            background: #00ff88;
            color: #0a0a0f;
        }
    </style>
</head>
<body>
    <div id="app"></div>

    <div id="controls">
        <h3>🔮 The Motherboard</h3>
        <div>
            <button id="btn-execute">Execute (Ctrl+Enter)</button>
            <button id="btn-clear">Clear All</button>
        </div>
        <div id="status">Click map to place glyphs. Press Execute to run.</div>
    </div>

    <div id="glyph-palette">
        <div style="margin-bottom: 8px; color: #888;">Glyph Palette:</div>
        <div id="glyph-buttons"></div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pixi.js/8.0.0/pixi.min.js"></script>
    <script src="GlyphExecutor.js"></script>
    <script src="infinite_map.js"></script>
    <script>
        // Test harness
        const app = new PIXI.Application();
        let map = null;
        let selectedGlyph = 65; // Default: 'A'

        async function init() {
            await app.init({
                width: window.innerWidth,
                height: window.innerHeight,
                backgroundColor: 0x0a0a0f,
            });
            document.getElementById('app').appendChild(app.canvas);

            // Create world container
            const world = new PIXI.Container();
            app.stage.addChild(world);

            // Initialize map
            map = new InfiniteMap(world, {
                gridSize: 100,
                tileScale: 2.0,
            });

            // Create glyph palette
            createGlyphPalette();

            // Setup map click handler
            app.stage.eventMode = 'static';
            app.stage.hitArea = app.screen;
            app.stage.on('pointerdown', onMapClick);

            // Setup buttons
            document.getElementById('btn-execute').onclick = () => executeGlyphs();
            document.getElementById('btn-clear').onclick = () => clearAll();

            console.log('✅ Motherboard test initialized');
        }

        function createGlyphPalette() {
            const container = document.getElementById('glyph-buttons');

            // Add common glyphs
            const glyphs = [
                { code: 65, label: 'A' },
                { code: 43, label: '+' },  // ADD
                { code: 76, label: 'L' },  // LOAD
                { code: 83, label: 'S' },  // STORE
                { code: 74, label: 'J' },  // JUMP
                { code: 200, label: '∑' }, // Ligature
            ];

            glyphs.forEach(g => {
                const btn = document.createElement('button');
                btn.className = 'glyph-btn';
                btn.textContent = g.label;
                btn.onclick = () => {
                    document.querySelectorAll('.glyph-btn').forEach(b => b.classList.remove('selected'));
                    btn.classList.add('selected');
                    selectedGlyph = g.code;
                };
                if (g.code === selectedGlyph) btn.classList.add('selected');
                container.appendChild(btn);
            });
        }

        function onMapClick(e) {
            const pos = e.global;
            const mapX = Math.floor(pos.x / 32);
            const mapY = Math.floor(pos.y / 32);

            if (map && map.glyphExecutor) {
                map.placeExecutableGlyph(mapX, mapY, selectedGlyph);
                updateStatus(`Placed glyph ${selectedGlyph} at (${mapX}, ${mapY})`);
            }
        }

        async function executeGlyphs() {
            if (map && map.glyphExecutor) {
                await map.executeGlyphs();
                updateStatus('Execution complete!');
            }
        }

        function clearAll() {
            if (map && map.glyphExecutor) {
                map.glyphExecutor.glyphRegistry.clear();
                updateStatus('All glyphs cleared');
            }
        }

        function updateStatus(msg) {
            document.getElementById('status').textContent = msg;
        }

        // Keyboard shortcuts
        document.addEventListener('keydown', (e) => {
            if (e.ctrlKey && e.key === 'Enter') {
                e.preventDefault();
                executeGlyphs();
            }
        });

        // Initialize
        init().catch(console.error);
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_motherboard.html
git commit -m "feat(motherboard): add test page

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Add Visual Glow Effect

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add glow filter support**

Add to `updateVisualFeedback()` method:

```javascript
    updateVisualFeedback() {
        for (const [key, entry] of this.glyphRegistry) {
            if (!entry.sprite) continue;

            // Calculate glow intensity based on execution state
            const targetGlow = entry.active ? 0.4 : 0;
            entry.glowIntensity = entry.glowIntensity * 0.85 + targetGlow * 0.15;

            // Apply glow using alpha blend
            if (entry.sprite.alpha !== undefined) {
                entry.sprite.alpha = 0.7 + entry.glowIntensity * 0.3;
            }

            // Add pulsing effect for active glyphs
            if (entry.active && entry.executionCount > 0) {
                const pulse = Math.sin(Date.now() / 300 + entry.coreId) * 0.1;
                if (entry.sprite.scale) {
                    entry.sprite.scale.set(1 + pulse * entry.glowIntensity);
                }
            }

            // Visual indicator for halted glyphs (Geometric Fraud)
            if (!entry.active && entry.lastResult?.fraud) {
                entry.sprite.tint = 0xff0000; // Red for fraud
            }
        }
    }
```

**Step 2: Update `readResults()` to detect fraud**

Modify the halt handling in `readResults()`:

```javascript
            if (halted) {
                entry.active = false;
                entry.lastResult = {
                    cycles: entry.executionCount,
                    fraud: true, // Halted by Geometric Hypervisor
                };
                console.warn(`🛑 Core ${entry.coreId} halted (Geometric Fraud?)`);
            }
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(motherboard): add visual glow and fraud detection

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 8: Add Auto-Execution Mode

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add auto-execution ticker**

Add to the constructor:

```javascript
        // Auto-execution
        this.ticker = null;
        this.frameCount = 0;
```

Add methods after `execute()`:

```javascript
    /**
     * Start auto-execution loop.
     */
    startAutoExecution(fps = 30) {
        if (this.ticker) return;

        const interval = 1000 / fps;
        this.ticker = setInterval(() => {
            this.execute().catch(e => console.error('Auto-execution error:', e));
            this.frameCount++;
        }, interval);

        console.log(`▶️ Auto-execution started at ${fps} FPS`);
    }

    /**
     * Stop auto-execution loop.
     */
    stopAutoExecution() {
        if (this.ticker) {
            clearInterval(this.ticker);
            this.ticker = null;
            console.log('⏹️ Auto-execution stopped');
        }
    }

    /**
     * Toggle auto-execution.
     */
    toggleAutoExecution() {
        if (this.ticker) {
            this.stopAutoExecution();
        } else {
            this.startAutoExecution();
        }
    }
```

**Step 2: Add to InfiniteMap controls**

Add button to test page:

```html
        <button id="btn-auto">Auto Run</button>
```

Add handler:

```javascript
            document.getElementById('btn-auto').onclick = () => {
                if (map && map.glyphExecutor) {
                    map.glyphExecutor.toggleAutoExecution();
                    const btn = document.getElementById('btn-auto');
                    btn.textContent = map.glyphExecutor.ticker ? 'Stop' : 'Auto Run';
                }
            };
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js systems/visual_shell/web/test_motherboard.html
git commit -m "feat(motherboard): add auto-execution mode

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 9: Write Unit Tests

**Files:**
- Create: `systems/visual_shell/web/tests/test_glyph_executor.js`

**Step 1: Create test file**

```javascript
/**
 * Tests for GlyphExecutor - The Motherboard
 */

// Mock WebGPU for testing
const mockGPU = {
    requestAdapter: async () => ({
        requestDevice: async () => ({
            createBuffer: (desc) => ({ size: desc.size, mapAsync: async () => {} }),
            createTexture: (desc) => ({ ...desc }),
            queue: {
                writeBuffer: () => {},
                copyExternalImageToTexture: () => {},
                submit: () => {},
            },
            createCommandEncoder: () => ({
                copyBufferToBuffer: () => {},
                finish: () => ({}),
            }),
        }),
    }),
};

// Test: Constructor
function testConstructor() {
    const executor = new GlyphExecutor({ maxCores: 32 });
    console.assert(executor.options.maxCores === 32, 'maxCores should be 32');
    console.assert(executor.glyphRegistry.size === 0, 'registry should be empty');
    console.log('✅ testConstructor passed');
}

// Test: Registration
function testRegistration() {
    const executor = new GlyphExecutor();
    const mockSprite = { x: 0, y: 0 };

    const coreId = executor.registerGlyph(10, 20, mockSprite, 5, 3);
    console.assert(coreId === 0, 'first glyph should get core 0');
    console.assert(executor.glyphRegistry.size === 1, 'registry should have 1 entry');

    const state = executor.getExecutionState(10, 20);
    console.assert(state !== null, 'should find registered glyph');
    console.assert(state.atlasX === 5, 'atlasX should be 5');
    console.assert(state.active === true, 'glyph should be active');

    console.log('✅ testRegistration passed');
}

// Test: Unregistration
function testUnregistration() {
    const executor = new GlyphExecutor();
    const mockSprite = { x: 0, y: 0 };

    executor.registerGlyph(10, 20, mockSprite, 5, 3);
    const result = executor.unregisterGlyph(10, 20);
    console.assert(result === true, 'unregister should return true');
    console.assert(executor.glyphRegistry.size === 0, 'registry should be empty');

    console.log('✅ testUnregistration passed');
}

// Test: Active glyphs
function testActiveGlyphs() {
    const executor = new GlyphExecutor();
    const mockSprite = { x: 0, y: 0 };

    executor.registerGlyph(0, 0, mockSprite, 0, 0);
    executor.registerGlyph(1, 0, mockSprite, 1, 0);

    // Deactivate one
    executor.glyphRegistry.get('1,0').active = false;

    const active = executor.getActiveGlyphs();
    console.assert(active.length === 1, 'should have 1 active glyph');
    console.assert(active[0].key === '0,0', 'active glyph should be at 0,0');

    console.log('✅ testActiveGlyphs passed');
}

// Run all tests
function runTests() {
    console.log('🧪 Running GlyphExecutor tests...');
    testConstructor();
    testRegistration();
    testUnregistration();
    testActiveGlyphs();
    console.log('✅ All tests passed!');
}

// Export for module systems
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { runTests };
}

// Auto-run if in browser
if (typeof window !== 'undefined') {
    window.runGlyphExecutorTests = runTests;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/tests/test_glyph_executor.js
git commit -m "test(motherboard): add GlyphExecutor unit tests

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 10: Documentation

**Files:**
- Create: `docs/motherboard.md`

**Step 1: Create documentation**

```markdown
# The Motherboard - Executable Infinite Map

## Overview

The Motherboard transforms the Geometry OS Infinite Map from a passive display surface into executable RAM. Glyphs placed on the map are decoded and executed by the GPU using the Resonance Glyph System.

## Architecture

```
User places glyph → PixiJS renders → GlyphExecutor registers → WebGPU decodes → Execution
```

## Quick Start

1. Open `test_motherboard.html` in a WebGPU-compatible browser
2. Click on the map to place glyphs
3. Press Ctrl+Enter (or click Execute) to run
4. Watch glyphs glow as they execute

## API Reference

### GlyphExecutor

```javascript
const executor = new GlyphExecutor({ maxCores: 64 });
await executor.init();
await executor.loadAtlas('/assets/universal_font.rts.png');

// Register a glyph
executor.registerGlyph(x, y, sprite, atlasX, atlasY);

// Execute once
await executor.execute();

// Start auto-execution
executor.startAutoExecution(30); // 30 FPS
```

### InfiniteMap Integration

```javascript
// Place an executable glyph
map.placeExecutableGlyph(10, 10, 65); // 'A' at (10,10)

// Execute all glyphs
await map.executeGlyphs();
```

## Visual Feedback

- **Glowing glyphs**: Active, executing
- **Red glyphs**: Halted (Geometric Fraud detected)
- **Pulsing**: Recent execution activity

## Next Steps

- Add more RISC-V opcodes to the shader
- Implement memory visualization
- Add breakpoint support
- Create AI-assisted glyph composition
```

**Step 2: Commit**

```bash
git add docs/motherboard.md
git commit -m "docs(motherboard): add usage documentation

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

This plan implements "The Motherboard" - the first phase of building Geometry OS outward from the font system.

**What it enables:**
1. Place executable glyphs on the Infinite Map
2. Execute them via WebGPU shader
3. Visual feedback (glow, fraud detection)
4. Auto-execution mode

**Files created:**
- `systems/visual_shell/web/GlyphExecutor.js` - Core execution bridge
- `systems/visual_shell/web/test_motherboard.html` - Test page
- `systems/visual_shell/web/tests/test_glyph_executor.js` - Unit tests
- `docs/motherboard.md` - Documentation

**Files modified:**
- `systems/visual_shell/web/infinite_map.js` - Integration

**Key integration points:**
- Uses existing `visual_cpu_riscv_morph.wgsl` shader
- Uses existing `universal_font.rts.png` atlas
- Uses existing `holographic_encoder.py` encoding scheme
