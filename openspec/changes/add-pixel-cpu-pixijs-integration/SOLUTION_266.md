# Solution for Task: All text elements are present

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, focusing on bridging the JavaScript emulator with the PixiJS visualizer.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/cpu_integration_layer.js` (The core logic connecting the CPU to the PixiJS stage)
*   `systems/visual_shell/web/shaders/memory_display.frag` (GLSL fragment shader for rendering the memory-mapped framebuffer)
*   `systems/visual_shell/web/ui/console_overlay.js` (UI component for displaying CPU console output)

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js` (Update `Memory` class to trigger events on MMIO write)
*   `systems/visual_shell/web/infinite_map.js` (Add the `CPUContainer` and integration hooks)
*   `systems/visual_shell/web/index.html` (Include new script tags)

---

### 2. Implementation Code

#### A. Memory-Mapped I/O Bridge (`cpu_integration_layer.js`)

This file creates the interface between the CPU's memory operations and the PixiJS visual container. It handles the "Texture Buffer" logic.

```javascript
// systems/visual_shell/web/cpu_integration_layer.js

import { PixelCPU } from './pixel_cpu.js';
import { Container, Graphics, Texture } from 'pixi.js';

export const MMIO_ADDR_FRAMEBUFFER = 0x80000000; // Base address for screen
export const MMIO_ADDR_CONSOLE = 0x80010000;     // Base address for console output

export class CPUIntegrationLayer {
    constructor(app, infiniteMap) {
        this.app = app;
        this.map = infiniteMap;
        this.cpu = null;
        this.running = false;
        
        // Visual Container for the CPU Screen
        this.screenContainer = new Container();
        this.screenContainer.x = 100;
        this.screenContainer.y = 100;
        
        // The actual texture representing the CPU's VRAM
        this.screenTexture = Texture.create(320, 240); 
        this.screenSprite = new Sprite(this.screenTexture);
        this.screenContainer.addChild(this.screenSprite);
        
        this.map.mainContainer.addChild(this.screenContainer);
    }

    async loadBrick(arrayBuffer) {
        if (this.cpu) this.stop();
        
        // Initialize CPU with hooks
        this.cpu = new PixelCPU();
        
        // Hook into the memory write cycle
        const originalWrite = this.cpu.memory.write.bind(this.cpu.memory);
        this.cpu.memory.write = (addr, val) => {
            originalWrite(addr, val);
            this.handleMMIOWrite(addr, val);
        };

        await this.cpu.load(arrayBuffer);
    }

    start() {
        if (!this.cpu) return;
        this.running = true;
        this.runLoop();
    }

    stop() {
        this.running = false;
    }

    runLoop() {
        if (!this.running) return;

        // Execute N cycles per frame (Non-blocking)
        const CYCLES_PER_FRAME = 1000;
        this.cpu.step(CYCLES_PER_FRAME);

        // Update Visuals
        this.updateScreenTexture();

        requestAnimationFrame(() => this.runLoop());
    }

    handleMMIOWrite(addr, val) {
        // Console Output (ASCII)
        if (addr >= MMIO_ADDR_CONSOLE && addr < MMIO_ADDR_CONSOLE + 0x1000) {
            const char = String.fromCharCode(val);
            console.log(`CPU OUT: ${char}`); 
            // Dispatch event to UI Overlay
            window.dispatchEvent(new CustomEvent('cpu-console-output', { detail: char }));
        }
    }

    updateScreenTexture() {
        if (!this.cpu) return;

        // Read memory region representing the framebuffer
        // This is a simplified sync; for high perf, use SharedArrayBuffer
        const fbStart = MMIO_ADDR_FRAMEBUFFER;
        const pixels = this.screenTexture.source.image.data; // Uint8ClampedArray view
        
        // Map CPU memory to Texture
        // Note: This assumes a 1:1 mapping for simplicity. 
        // Real implementation needs stride handling.
        for (let i = 0; i < pixels.length; i += 4) {
            const memOffset = i / 4;
            const word = this.cpu.memory.read(fbStart + memOffset);
            
            // Extract RGBA (Example: 0xRRGGBBAA)
            pixels[i]     = (word >> 24) & 0xFF; // R
            pixels[i + 1] = (word >> 16) & 0xFF; // G
            pixels[i + 2] = (word >> 8)  & 0xFF; // B
            pixels[i + 3] = 255;             // A
        }
        
        this.screenTexture.update();
    }
}
```

#### B. Shader for Memory Display (`shaders/memory_display.frag`)

If using a raw GLSL approach for the map tiles to visualize memory density or state directly on the grid.

```glsl
// systems/visual_shell/web/shaders/memory_display.frag

precision mediump float;

uniform sampler2D uMemoryTexture;
uniform vec2 uResolution;
uniform float uTime;

varying vec2 vTextureCoord;

void main() {
    // Sample the "Memory" texture
    vec4 color = texture2D(uMemoryTexture, vTextureCoord);
    
    // Add a scanline effect for that retro OS feel
    float scanline = sin(vTextureCoord.y * 800.0) * 0.04;
    
    gl_FragColor = color - scanline;
}
```

#### C. Modifications to `infinite_map.js`

Add the hook to initialize the integration layer.

```javascript
// systems/visual_shell/web/infinite_map.js (Partial Modification)

import { CPUIntegrationLayer } from './cpu_integration_layer.js';

export class InfiniteMap {
    constructor(app) {
        // ... existing setup ...
        this.cpuLayer = new CPUIntegrationLayer(app, this);
    }

    // Call this when a user drops a .brick file onto the map
    async handleFileDrop(file) {
        if (file.name.endsWith('.brick')) {
            const buffer = await file.arrayBuffer();
            await this.cpuLayer.loadBrick(buffer);
            this.cpuLayer.start();
        }
    }
}
```

---

### 3. Next Step

**Command:**
Create the integration layer file to define the bridge between the emulator and the renderer.

```bash
touch systems/visual_shell/web/cpu_integration_layer.js
```