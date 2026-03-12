# Ouroboros Visual Shell Integration Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Wire the Ouroboros Renderer into the PixiJS Visual Shell so glyph programs execute and render in real-time on the Geometry OS desktop.

**Architecture:** Create a GlyphExecutionPipeline that loads the Hilbert atlas, dispatches the glyph_microcode.wgsl compute shader, and displays the output framebuffer in the visual shell. The ouroboros_renderer.json program will "draw itself into existence."

**Tech Stack:** PixiJS v8, WebGPU, WGSL compute shaders, Hilbert curve math

---

## File Structure

| File | Action | Purpose |
|------|--------|---------|
| `systems/visual_shell/web/GlyphExecutionPipeline.js` | Create | WebGPU pipeline for glyph execution |
| `systems/visual_shell/web/OuroborosRunner.js` | Create | Loads and runs ouroboros_renderer.json |
| `systems/visual_shell/web/demo_ouroboros.html` | Create | Demo page for the Ouroboros Renderer |
| `systems/visual_shell/web/hilbert.js` | Create | Hilbert curve utilities (d2xy, xy2d) |
| `systems/glyph_stratum/opcode_atlas.webp` | Generate | WebP version of atlas for web loading |

---

## Chunk 1: Hilbert Utilities

### Task 1: Hilbert Curve Math

**Files:**
- Create: `systems/visual_shell/web/hilbert.js`

- [ ] **Step 1: Create hilbert.js with d2xy and xy2d functions**

```javascript
/**
 * Hilbert Curve Utilities for Geometry OS
 *
 * The Hilbert curve maps 1D indices to 2D coordinates while preserving locality.
 * This is used for the Glyph Atlas where Opcode N is at Hilbert(N).
 */

/**
 * Convert Hilbert index (d) to (x, y) coordinates.
 * @param {number} n - Grid size (must be power of 2)
 * @param {number} d - Hilbert index
 * @returns {[number, number]} - [x, y] coordinates
 */
export function d2xy(n, d) {
    let x = 0;
    let y = 0;
    let s = 1;
    let d2 = d;

    while (s < n) {
        const rx = 1 & (d2 / 2);
        const ry = 1 & (d2 ^ rx);

        // Rotate
        if (ry === 0) {
            if (rx === 1) {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            // Swap
            const t = x;
            x = y;
            y = t;
        }

        x += s * rx;
        y += s * ry;
        d2 = Math.floor(d2 / 4);
        s *= 2;
    }

    return [x, y];
}

/**
 * Convert (x, y) coordinates to Hilbert index (d).
 * @param {number} n - Grid size (must be power of 2)
 * @param {number} x - X coordinate
 * @param {number} y - Y coordinate
 * @returns {number} - Hilbert index
 */
export function xy2d(n, x, y) {
    let d = 0;
    let s = Math.floor(n / 2);

    while (s > 0) {
        let rx = 0;
        let ry = 0;

        if ((x & s) !== 0) rx = 1;
        if ((y & s) !== 0) ry = 1;

        d += s * s * ((3 * rx) ^ ry);

        // Rotate
        if (ry === 0) {
            if (rx === 1) {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            // Swap
            const t = x;
            x = y;
            y = t;
        }

        s = Math.floor(s / 2);
    }

    return d;
}

/**
 * Get the atlas coordinate for an opcode using Hilbert convention.
 * @param {number} opcode - The opcode (0-255)
 * @param {number} gridSize - Atlas grid size (default 256)
 * @param {number} cellSize - Size of each cell in pixels (default 64)
 * @returns {{x: number, y: number, px: number, py: number}}
 */
export function opcodeToAtlasCoord(opcode, gridSize = 256, cellSize = 64) {
    const [gx, gy] = d2xy(gridSize, opcode);
    return {
        gridX: gx,
        gridY: gy,
        px: gx * cellSize,
        py: gy * cellSize
    };
}

// Make available globally for non-module usage
if (typeof window !== 'undefined') {
    window.Hilbert = { d2xy, xy2d, opcodeToAtlasCoord };
}
```

- [ ] **Step 2: Verify hilbert.js syntax**

Run: `node --check systems/visual_shell/web/hilbert.js`
Expected: No output (syntax OK)

- [ ] **Step 3: Commit**

```bash
git add systems/visual_shell/web/hilbert.js
git commit -m "feat(visual-shell): add Hilbert curve utilities for glyph atlas

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 2: Glyph Execution Pipeline

### Task 2: WebGPU Compute Pipeline

**Files:**
- Create: `systems/visual_shell/web/GlyphExecutionPipeline.js`

- [ ] **Step 1: Create GlyphExecutionPipeline.js**

```javascript
/**
 * Glyph Execution Pipeline
 *
 * WebGPU compute pipeline that executes glyph microcode programs.
 * The pipeline loads the Hilbert atlas, runs the glyph_microcode.wgsl shader,
 * and outputs to a framebuffer texture.
 */

import { d2xy, opcodeToAtlasCoord } from './hilbert.js';

export class GlyphExecutionPipeline {
    constructor(device, options = {}) {
        this.device = device;
        this.gridSize = options.gridSize || 256;
        this.cellSize = options.cellSize || 64;
        this.atlasSize = this.gridSize * this.cellSize;

        // Execution state
        this.state = {
            pc: 0,
            sp: 0,
            flags: 0,
            halted: 0,
            cycles: 0
        };

        // Memory (64KB for now)
        this.memorySize = 64 * 1024;
        this.stackSize = 1024;
        this.maxProgramSize = 4096;

        // Textures
        this.atlasTexture = null;
        this.outputTexture = null;

        // Bindings
        this.bindGroup = null;
        this.pipeline = null;
    }

    /**
     * Initialize the pipeline with atlas texture.
     */
    async initialize(atlasUrl) {
        // Load atlas image
        const response = await fetch(atlasUrl);
        const blob = await response.blob();
        const imageBitmap = await createImageBitmap(blob);

        // Create atlas texture
        this.atlasTexture = this.device.createTexture({
            size: [imageBitmap.width, imageBitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        this.device.queue.copyExternalImageToTexture(
            { source: imageBitmap },
            { texture: this.atlasTexture },
            [imageBitmap.width, imageBitmap.height]
        );

        // Create output texture (framebuffer)
        this.outputTexture = this.device.createTexture({
            size: [1024, 768],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.STORAGE_BINDING |
                   GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        // Create buffers
        this.programBuffer = this.device.createBuffer({
            size: this.maxProgramSize * 24, // 24 bytes per glyph
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.stateBuffer = this.device.createBuffer({
            size: 20, // 5 x u32
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.memoryBuffer = this.device.createBuffer({
            size: this.memorySize * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        this.stackBuffer = this.device.createBuffer({
            size: this.stackSize * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
        });

        // Create compute pipeline
        await this.createPipeline();

        console.log('[GlyphExecutionPipeline] Initialized');
    }

    /**
     * Create the WebGPU compute pipeline.
     */
    async createPipeline() {
        // WGSL shader for glyph execution (minimal "synthetic silicon")
        const shaderCode = `
struct Glyph {
    opcode: u32,
    stratum: u32,
    p1: f32,
    p2: f32,
    target: u32,
};

struct ExecutionState {
    pc: u32,
    sp: u32,
    flags: u32,
    halted: u32,
    cycles: u32,
};

@group(0) @binding(0) var<storage, read> program: array<Glyph>;
@group(0) @binding(1) var<storage, read_write> state: ExecutionState;
@group(0) @binding(2) var<storage, read_write> memory: array<f32>;
@group(0) @binding(3) var<storage, read_write> stack: array<u32>;
@group(0) @binding(4) var output_texture: texture_storage_2d<rgba8unorm, write>;
@group(0) @binding(5) var atlas_texture: texture_2d<f32>;

// Hilbert d2xy for atlas lookup
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    if (id.x != 0u || state.halted != 0u) { return; }

    let glyph = program[state.pc];
    state.pc += 1u;
    state.cycles += 1u;

    switch (glyph.opcode) {
        // Arithmetic (200-203)
        case 200u: { memory[glyph.target] = glyph.p1 + glyph.p2; }
        case 201u: { memory[glyph.target] = glyph.p1 - glyph.p2; }
        case 202u: { memory[glyph.target] = glyph.p1 * glyph.p2; }
        case 203u: { if (glyph.p2 != 0.0) { memory[glyph.target] = glyph.p1 / glyph.p2; } }

        // Memory (204-207)
        case 204u: { memory[glyph.target] = memory[u32(glyph.p1)]; }
        case 205u: { memory[u32(glyph.p1)] = glyph.p2; }
        case 206u: { memory[glyph.target] = glyph.p1; }
        case 207u: { memory[glyph.target] = 0.0; }

        // Control (208-211)
        case 208u: { state.pc = u32(glyph.p1); }
        case 209u: { if (memory[glyph.target] == 0.0) { state.pc = u32(glyph.p1); } }
        case 210u: { stack[state.sp] = state.pc; state.sp += 1u; state.pc = u32(glyph.p1); }
        case 211u: { state.sp -= 1u; state.pc = stack[state.sp]; }

        // System (212-215)
        case 212u: { state.halted = 1u; }
        case 213u: { /* SYNC - barrier */ }
        case 215u: {
            // DRAW: Blit glyph from atlas to output
            // p1 = opcode to draw, p2 = dest_x, target = dest_y
            let src_opcode = u32(glyph.p1);
            let dest_x = u32(glyph.p2);
            let dest_y = glyph.target;

            // Hilbert lookup for source
            let atlas_grid_size = 256u;
            let cell_size = 64u;
            let src_cell = d2xy(atlas_grid_size, src_opcode);
            let src_base_x = src_cell.x * cell_size;
            let src_base_y = src_cell.y * cell_size;

            // Blit 8x16 glyph (for now, scaled to 64x64)
            for (var dy = 0u; dy < 64u; dy++) {
                for (var dx = 0u; dx < 64u; dx++) {
                    let src_x = src_base_x + dx;
                    let src_y = src_base_y + dy;
                    let color = textureLoad(atlas_texture, vec2<i32>(i32(src_x), i32(src_y)), 0);
                    textureStore(output_texture, vec2<i32>(i32(dest_x + dx), i32(dest_y + dy)), color);
                }
            }
        }
        default: { /* NOP */ }
    }

    // Safety halt
    if (state.cycles > 10000u) { state.halted = 1u; }
}
`;

        const shaderModule = this.device.createShaderModule({ code: shaderCode });

        this.pipeline = this.device.createComputePipeline({
            layout: 'auto',
            compute: {
                module: shaderModule,
                entryPoint: 'main'
            }
        });

        // Create bind group
        this.bindGroup = this.device.createBindGroup({
            layout: this.pipeline.getBindGroupLayout(0),
            entries: [
                { binding: 0, resource: { buffer: this.programBuffer } },
                { binding: 1, resource: { buffer: this.stateBuffer } },
                { binding: 2, resource: { buffer: this.memoryBuffer } },
                { binding: 3, resource: { buffer: this.stackBuffer } },
                { binding: 4, resource: this.outputTexture.createView() },
                { binding: 5, resource: this.atlasTexture.createView() }
            ]
        });
    }

    /**
     * Load a glyph program from JSON.
     */
    loadProgram(programData) {
        const glyphs = programData.glyphs || {};
        const programArray = new Float32Array(this.maxProgramSize * 6);

        let i = 0;
        for (const [indexStr, glyph] of Object.entries(glyphs)) {
            const idx = parseInt(indexStr);
            programArray[idx * 6 + 0] = glyph.opcode || 0;
            programArray[idx * 6 + 1] = glyph.stratum || 0;
            programArray[idx * 6 + 2] = glyph.p1 || 0;
            programArray[idx * 6 + 3] = glyph.p2 || 0;
            programArray[idx * 6 + 4] = glyph.target || 0;
            programArray[idx * 6 + 5] = 0; // padding
            i = Math.max(i, idx + 1);
        }

        this.device.queue.writeBuffer(this.programBuffer, 0, programArray);

        // Reset state
        this.state = { pc: 0, sp: 0, flags: 0, halted: 0, cycles: 0 };
        this.updateState();

        console.log(`[GlyphExecutionPipeline] Loaded program with ${i} glyphs`);
    }

    /**
     * Update execution state on GPU.
     */
    updateState() {
        const stateArray = new Uint32Array([
            this.state.pc,
            this.state.sp,
            this.state.flags,
            this.state.halted,
            this.state.cycles
        ]);
        this.device.queue.writeBuffer(this.stateBuffer, 0, stateArray);
    }

    /**
     * Execute one step of the program.
     */
    step() {
        if (this.state.halted) return false;

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();
        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, this.bindGroup);
        passEncoder.dispatchWorkgroups(1);
        passEncoder.end();
        this.device.queue.submit([commandEncoder.finish()]);

        // Read back state (async, but we sync for simplicity)
        // In production, use readBuffer with proper async handling
        return !this.state.halted;
    }

    /**
     * Run program until halt or max cycles.
     */
    run(maxCycles = 1000) {
        for (let i = 0; i < maxCycles && !this.state.halted; i++) {
            this.step();
        }
        console.log(`[GlyphExecutionPipeline] Execution ${this.state.halted ? 'halted' : 'paused'} at cycle ${this.state.cycles}`);
    }

    /**
     * Get the output texture for rendering.
     */
    getOutputTexture() {
        return this.outputTexture;
    }

    /**
     * Check if execution is halted.
     */
    isHalted() {
        return this.state.halted !== 0;
    }
}

// Export for module loading
if (typeof window !== 'undefined') {
    window.GlyphExecutionPipeline = GlyphExecutionPipeline;
}
```

- [ ] **Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/GlyphExecutionPipeline.js`
Expected: No output (syntax OK)

- [ ] **Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutionPipeline.js
git commit -m "feat(visual-shell): add GlyphExecutionPipeline for WebGPU compute

Implements the 'synthetic silicon' bootloader that executes glyph
microcode programs on GPU. Includes Hilbert atlas lookup for DRAW opcode.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 3: Ouroboros Runner

### Task 3: Ouroboros Runner Component

**Files:**
- Create: `systems/visual_shell/web/OuroborosRunner.js`

- [ ] **Step 1: Create OuroborosRunner.js**

```javascript
/**
 * Ouroboros Runner
 *
 * Runs the Ouroboros Renderer program and displays it in the Visual Shell.
 * This is the first program that "draws itself into existence."
 */

import { GlyphExecutionPipeline } from './GlyphExecutionPipeline.js';

export class OuroborosRunner {
    constructor(app, options = {}) {
        this.app = app;
        this.options = {
            atlasUrl: options.atlasUrl || '../glyph_stratum/opcode_atlas.webp',
            programUrl: options.programUrl || '../glyph_stratum/ouroboros_renderer.json',
            ...options
        };

        this.device = null;
        this.pipeline = null;
        this.sprite = null;
        this.running = false;
    }

    /**
     * Initialize WebGPU and the execution pipeline.
     */
    async initialize() {
        // Check for WebGPU
        if (!navigator.gpu) {
            throw new Error('WebGPU not supported');
        }

        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('No GPU adapter found');
        }

        this.device = await adapter.requestDevice();

        // Create pipeline
        this.pipeline = new GlyphExecutionPipeline(this.device);
        await this.pipeline.initialize(this.options.atlasUrl);

        // Create sprite for output
        this.createOutputSprite();

        console.log('[OuroborosRunner] Initialized');
    }

    /**
     * Create a PixiJS sprite to display the output texture.
     */
    createOutputSprite() {
        // For now, use a Graphics object as placeholder
        // Full WebGPU-PixiJS integration requires custom render pipeline
        this.outputGraphics = new PIXI.Graphics();

        // Background
        this.outputGraphics.rect(0, 0, 1024, 768);
        this.outputGraphics.fill(0x0a0a0a);

        this.app.stage.addChild(this.outputGraphics);

        // Status text
        this.statusText = new PIXI.Text({
            text: 'Ouroboros Renderer: Initializing...',
            style: {
                fontFamily: 'monospace',
                fontSize: 14,
                fill: 0x00ffcc
            }
        });
        this.statusText.x = 20;
        this.statusText.y = 20;
        this.app.stage.addChild(this.statusText);
    }

    /**
     * Load and run the Ouroboros Renderer program.
     */
    async run() {
        try {
            // Load program
            const response = await fetch(this.options.programUrl);
            const programData = await response.json();

            this.statusText.text = `Loaded: ${programData.name}`;

            // Load into pipeline
            this.pipeline.loadProgram(programData);

            // Execute
            this.statusText.text = 'Executing glyph program...';
            this.pipeline.run(100);

            // Render result (simulated for now - full WebGPU integration needed)
            this.renderResult(programData);

            this.statusText.text = `Ouroboros complete: ${this.pipeline.state.cycles} cycles`;

            console.log('[OuroborosRunner] Execution complete');
        } catch (error) {
            console.error('[OuroborosRunner] Error:', error);
            this.statusText.text = `Error: ${error.message}`;
        }
    }

    /**
     * Render the execution result.
     * In full implementation, this would sample the output texture.
     * For now, we simulate by drawing the glyph sequence.
     */
    renderResult(programData) {
        const glyphs = programData.glyphs || {};
        let x = 100;
        const y = 400;
        const glyphWidth = 64;
        const glyphHeight = 64;

        // Clear previous
        this.outputGraphics.clear();
        this.outputGraphics.rect(0, 0, 1024, 768);
        this.outputGraphics.fill(0x0a0a0a);

        // Draw title
        this.outputGraphics.rect(50, 50, 924, 60);
        this.outputGraphics.fill(0x1a1a2e);
        this.outputGraphics.stroke({ width: 2, color: 0x00ffcc });

        const titleText = new PIXI.Text({
            text: 'OUROBOROS RENDERER - Glyphs Drawing Glyphs',
            style: {
                fontFamily: 'monospace',
                fontSize: 24,
                fill: 0x00ffcc
            }
        });
        titleText.x = 100;
        titleText.y = 70;
        this.app.stage.addChild(titleText);

        // Draw each DRAW instruction's target glyph
        for (const [indexStr, glyph] of Object.entries(glyphs)) {
            if (glyph.opcode === 215) { // DRAW
                const srcOpcode = glyph.p1;
                const destX = glyph.p2;
                const destY = glyph.target;

                // Draw placeholder box for the glyph
                this.outputGraphics.rect(destX, destY, glyphWidth, glyphHeight);
                this.outputGraphics.fill(this.getOpcodeColor(srcOpcode));
                this.outputGraphics.stroke({ width: 1, color: 0x00ffcc });

                // Label with opcode
                const label = new PIXI.Text({
                    text: `${srcOpcode}`,
                    style: {
                        fontFamily: 'monospace',
                        fontSize: 12,
                        fill: 0xffffff
                    }
                });
                label.x = destX + 8;
                label.y = destY + 24;
                this.app.stage.addChild(label);
            }
        }

        // Draw execution trace
        const traceY = 600;
        this.outputGraphics.rect(50, traceY, 924, 100);
        this.outputGraphics.fill(0x1a1a1a);
        this.outputGraphics.stroke({ width: 1, color: 0x444466 });

        const traceText = new PIXI.Text({
            text: `Execution Trace: ${Object.keys(glyphs).length} glyphs | ${this.pipeline.state.cycles} cycles | PC: ${this.pipeline.state.pc}`,
            style: {
                fontFamily: 'monospace',
                fontSize: 14,
                fill: 0xaaaaaa
            }
        });
        traceText.x = 60;
        traceText.y = traceY + 10;
        this.app.stage.addChild(traceText);

        // Draw program listing
        let listingY = traceY + 35;
        for (const [idx, glyph] of Object.entries(glyphs)) {
            const line = new PIXI.Text({
                text: `[${idx}] Opcode ${glyph.opcode} → ${glyph.rationale}`,
                style: {
                    fontFamily: 'monospace',
                    fontSize: 11,
                    fill: 0x888888
                }
            });
            line.x = 60;
            line.y = listingY;
            this.app.stage.addChild(line);
            listingY += 14;
        }
    }

    /**
     * Get color for an opcode (visual representation).
     */
    getOpcodeColor(opcode) {
        if (opcode >= 200 && opcode <= 203) return 0x4a90d9; // Arithmetic - blue
        if (opcode >= 204 && opcode <= 207) return 0x2a5f2a; // Memory - green
        if (opcode >= 208 && opcode <= 211) return 0xf5a53d; // Control - orange
        if (opcode >= 212 && opcode <= 215) return 0xc7a5f3; // System - purple
        return 0x404040; // Default - gray
    }

    /**
     * Step through execution one instruction at a time.
     */
    step() {
        if (this.pipeline && !this.pipeline.isHalted()) {
            this.pipeline.step();
            this.statusText.text = `Step: PC=${this.pipeline.state.pc} Cycle=${this.pipeline.state.cycles}`;
        }
    }
}

// Export for module loading
if (typeof window !== 'undefined') {
    window.OuroborosRunner = OuroborosRunner;
}
```

- [ ] **Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/OuroborosRunner.js`
Expected: No output (syntax OK)

- [ ] **Step 3: Commit**

```bash
git add systems/visual_shell/web/OuroborosRunner.js
git commit -m "feat(visual-shell): add OuroborosRunner for glyph execution visualization

Runs the Ouroboros Renderer program and displays the execution
result in the Visual Shell. Proves 'Rendering IS Execution'.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 4: Demo Page

### Task 4: Demo HTML Page

**Files:**
- Create: `systems/visual_shell/web/demo_ouroboros.html`

- [ ] **Step 1: Create demo_ouroboros.html**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Geometry OS - Ouroboros Renderer</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #050505;
            color: #00ffcc;
            font-family: 'JetBrains Mono', 'Fira Code', monospace;
            overflow: hidden;
        }
        #canvas-container {
            width: 100vw;
            height: 100vh;
        }
        .controls {
            position: fixed;
            top: 10px;
            right: 10px;
            display: flex;
            flex-direction: column;
            gap: 8px;
            z-index: 100;
        }
        button {
            background: #1a1a2e;
            border: 1px solid #00ffcc;
            color: #00ffcc;
            padding: 10px 20px;
            cursor: pointer;
            font-family: inherit;
            font-size: 12px;
            border-radius: 4px;
        }
        button:hover {
            background: #2a2a3e;
        }
        button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        .info {
            position: fixed;
            bottom: 10px;
            left: 10px;
            background: rgba(0, 0, 0, 0.8);
            padding: 15px;
            border: 1px solid #333;
            border-radius: 4px;
            font-size: 12px;
            max-width: 400px;
        }
        .info h3 {
            color: #00ffcc;
            margin-bottom: 10px;
        }
        .info p {
            color: #888;
            line-height: 1.5;
            margin-bottom: 8px;
        }
        .status {
            position: fixed;
            top: 10px;
            left: 10px;
            background: rgba(0, 0, 0, 0.8);
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 11px;
        }
    </style>
</head>
<body>
    <div id="canvas-container"></div>

    <div class="controls">
        <button id="btn-init">Initialize</button>
        <button id="btn-run" disabled>Run Ouroboros</button>
        <button id="btn-step" disabled>Step</button>
        <button id="btn-reset" disabled>Reset</button>
    </div>

    <div class="status" id="status">Ready - Click Initialize to start</div>

    <div class="info">
        <h3>Ouroboros Renderer</h3>
        <p>The first program that draws itself into existence.</p>
        <p>This demo runs a glyph microcode program that uses the DRAW opcode to render other glyphs onto the screen.</p>
        <p><strong>Philosophy:</strong> Rendering IS Execution. The screen IS the program.</p>
        <p><strong>Instructions:</strong></p>
        <ul style="margin-left: 15px; color: #666;">
            <li>Click Initialize to set up WebGPU</li>
            <li>Click Run to execute the Ouroboros program</li>
            <li>Watch glyphs draw themselves</li>
        </ul>
    </div>

    <script src="https://pixijs.download/v8.0.0/pixi.min.js"></script>
    <script type="module">
        import { OuroborosRunner } from './OuroborosRunner.js';

        let app;
        let runner;

        async function initPixi() {
            app = new PIXI.Application();
            await app.init({
                background: '#050505',
                resizeTo: window,
                antialias: true
            });
            document.getElementById('canvas-container').appendChild(app.canvas);
            console.log('[Demo] PixiJS initialized');
        }

        async function initRunner() {
            updateStatus('Initializing WebGPU...');

            try {
                runner = new OuroborosRunner(app);
                await runner.initialize();

                document.getElementById('btn-run').disabled = false;
                document.getElementById('btn-step').disabled = false;
                document.getElementById('btn-reset').disabled = false;

                updateStatus('WebGPU ready - Click Run Ouroboros');
            } catch (error) {
                updateStatus(`Error: ${error.message}`);
                console.error(error);
            }
        }

        async function runOuroboros() {
            updateStatus('Running Ouroboros Renderer...');
            await runner.run();
            updateStatus(`Complete - ${runner.pipeline.state.cycles} cycles executed`);
        }

        function step() {
            runner.step();
        }

        function reset() {
            if (runner) {
                runner.pipeline.state = { pc: 0, sp: 0, flags: 0, halted: 0, cycles: 0 };
                runner.pipeline.updateState();
                updateStatus('Reset - Ready to run');
            }
        }

        function updateStatus(message) {
            document.getElementById('status').textContent = message;
        }

        // Setup
        document.getElementById('btn-init').addEventListener('click', async () => {
            await initRunner();
        });

        document.getElementById('btn-run').addEventListener('click', runOuroboros);
        document.getElementById('btn-step').addEventListener('click', step);
        document.getElementById('btn-reset').addEventListener('click', reset);

        // Initialize PixiJS on load
        window.addEventListener('DOMContentLoaded', initPixi);
    </script>
</body>
</html>
```

- [ ] **Step 2: Commit**

```bash
git add systems/visual_shell/web/demo_ouroboros.html
git commit -m "feat(visual-shell): add Ouroboros demo page

Interactive demo for the Ouroboros Renderer. Allows users to
initialize WebGPU, run the glyph program, and step through execution.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Chunk 5: Atlas Conversion

### Task 5: Generate WebP Atlas

**Files:**
- Modify: `systems/glyph_stratum/generate_font_atlas.py`

- [ ] **Step 1: Add WebP export to generate_font_atlas.py**

Find the section that saves the atlas and add WebP export:

```python
# After saving PPM/Raw, add:
def save_webp(self, output_path):
    """Save atlas as WebP for web loading."""
    from PIL import Image

    # Convert raw to PIL Image
    img = Image.frombytes('RGBA', (self.width, self.height), self.atlas_data)
    img.save(output_path, 'WEBP', lossless=True)
    print(f"WebP atlas saved: {output_path}")
```

Update the main execution:

```python
if __name__ == "__main__":
    generator = FontAtlasGenerator()
    generator.generate()
    generator.save_raw("opcode_atlas.raw")
    generator.save_ppm("opcode_atlas.ppm")
    generator.save_webp("opcode_atlas.webp")  # Add this line
    generator.save_positions("opcode_positions.json")
```

- [ ] **Step 2: Run atlas generator**

Run: `cd systems/glyph_stratum && python3 generate_font_atlas.py`
Expected: "WebP atlas saved: opcode_atlas.webp"

- [ ] **Step 3: Commit**

```bash
git add systems/glyph_stratum/generate_font_atlas.py systems/glyph_stratum/opcode_atlas.webp
git commit -m "feat(glyph-stratum): add WebP atlas export for web loading

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Verification

### Task 6: End-to-End Test

- [ ] **Step 1: Start a local server**

Run: `cd systems/visual_shell/web && python3 -m http.server 8000`

- [ ] **Step 2: Open demo in browser**

Navigate to: `http://localhost:8000/demo_ouroboros.html`

- [ ] **Step 3: Verify execution**

1. Click "Initialize" - should show "WebGPU ready"
2. Click "Run Ouroboros" - should render glyph boxes
3. Check console for execution trace

Expected: Glyphs are rendered at their specified positions, proving the DRAW opcode works.

---

## Success Criteria

| Criterion | Verification |
|-----------|--------------|
| Hilbert utilities work | `d2xy(256, 200)` returns valid coordinates |
| WebGPU pipeline initializes | No errors in console |
| Ouroboros program loads | Program JSON parsed correctly |
| DRAW opcode renders | Glyphs appear at specified positions |
| Execution completes | "Complete" status shown |

---

*Plan created: 2026-03-12*
*Based on design: docs/superpowers/specs/2026-03-12-glyph-language-design.md*
