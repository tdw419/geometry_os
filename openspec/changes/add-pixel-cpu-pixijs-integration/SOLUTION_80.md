# Solution for Task: Performance warnings appear when slow

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map, addressing the performance warning requirement.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/cpu_integration_layer.js`
    *   **Purpose**: Manages the CPU execution loop, memory-mapped I/O (MMIO) bridging, and performance monitoring. It ensures the CPU does not block the main render thread.

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   **Change**: Add hooks for pausing/resuming state and accessing memory directly for the framebuffer.
*   `systems/visual_shell/web/infinite_map.js`
    *   **Change**: Add a `PIXI.Container` specifically for rendering the CPU framebuffer texture and a method to update the texture from the CPU's memory.

### 2. Implementation Code

**File:** `systems/visual_shell/web/cpu_integration_layer.js`

This module creates a "Time Budget" based executor. It runs the CPU for a set number of milliseconds (e.g., 8ms) per frame, ensuring the browser has time left to render the UI at 60fps. If the CPU exceeds this budget, it triggers the requested performance warning.

```javascript
import { PixelCPU } from './pixel_cpu.js';

export class CpuIntegrationLayer {
    constructor(pixiApp, infiniteMap) {
        this.cpu = new PixelCPU();
        this.pixiApp = pixiApp;
        this.infiniteMap = infiniteMap;
        
        // Configuration
        this.timeBudgetPerFrame = 8; // ms (Target ~60fps: 16ms frame budget)
        this.framebufferAddress = 0x80000000; // Base address for video memory
        this.consoleAddress = 0x90000000;     // Base address for console output
        
        // Performance State
        this.lastCycleCount = 0;
        this.isOverheating = false;

        // Setup Visuals
        this.setupFramebufferTexture();
        this.setupTicker();
    }

    setupFramebufferTexture() {
        // Create a texture that maps to CPU memory
        // Assuming 64x32 resolution for the demo
        this.fbWidth = 64;
        this.fbHeight = 32;
        
        this.fbTexture = PIXI.Texture.EMPTY;
        this.fbSprite = new PIXI.Sprite(this.fbTexture);
        this.fbSprite.x = 100; // Position on the infinite map
        this.fbSprite.y = 100;
        this.fbSprite.scale.set(4); // Zoom in so pixels are visible
        
        // Add to the PixiJS stage via the InfiniteMap container
        this.infiniteMap.addChild(this.fbSprite);
    }

    setupTicker() {
        // Use Pixi's Ticker to sync CPU execution with the render loop
        this.pixiApp.ticker.add((deltaTime) => {
            this.executeCpuTimeSlice();
            this.updateVisuals();
        });
    }

    executeCpuTimeSlice() {
        const startTime = performance.now();
        let cyclesExecuted = 0;

        // Execute until we run out of time budget
        while (performance.now() - startTime < this.timeBudgetPerFrame) {
            if (!this.cpu.step()) break; // CPU halted or waiting
            cyclesExecuted++;
        }

        // --- PERFORMANCE WARNING LOGIC ---
        // If execution is heavy, we might be dropping frames
        const executionTime = performance.now() - startTime;
        
        if (executionTime > this.timeBudgetPerFrame) {
            if (!this.isOverheating) {
                console.warn(`[Geometry OS] CPU Performance Warning: Execution took ${executionTime.toFixed(2)}ms (Budget: ${this.timeBudgetPerFrame}ms). Reduce load or increase optimization.`);
                this.isOverheating = true;
                // Optional: Visual indicator on map (e.g., turn sprite red)
                this.fbSprite.tint = 0xFF0000;
            }
        } else {
            if (this.isOverheating) {
                this.isOverheating = false;
                this.fbSprite.tint = 0xFFFFFF; // Reset tint
            }
        }
    }

    updateVisuals() {
        // 1. Update Framebuffer Texture from CPU Memory
        // We map the Uint8Array of CPU memory to a PixiJS Texture
        const memView = new Uint8Array(this.cpu.memory.buffer, this.framebufferAddress, this.fbWidth * this.fbHeight * 4); // RGBA
        
        // If the texture doesn't exist or isn't the right size, create it
        if (!this.fbTexture || !this.fbTexture.valid) {
             // Create a PIXI Texture from the raw memory buffer
             // Note: In production, use a RenderTexture or update buffer for speed
             this.fbTexture = new PIXI.Texture(new PIXI.BaseTexture(memView, {
                width: this.fbWidth,
                height: this.fbHeight,
                format: PIXI.FORMATS.RGBA
             }));
             this.fbSprite.texture = this.fbTexture;
        } else {
            // Update existing texture (requires specific Pixi v8 resource update logic)
            // For simplicity in this snippet, we assume a resource update method exists
            this.fbTexture.source.resource.update(memView);
        }
        
        // 2. Check Console Memory Mapped I/O
        // Scan memory for newlines and print to browser console
        this.scanConsoleMmio();
    }

    scanConsoleMmio() {
        // Simple implementation: Read last byte written
        // Real implementation would use a circular buffer in memory
        const statusAddr = this.consoleAddress;
        const dataAddr = this.consoleAddress + 4;
        
        // Pseudo-code for reading MMIO
        // if (this.cpu.memory.read32(statusAddr) == 1) {
        //    const char = this.cpu.memory.read8(dataAddr);
        //    process.stdout.write(String.fromCharCode(char));
        // }
    }

    async loadBrick(url) {
        const response = await fetch(url);
        const buffer = await response.arrayBuffer();
        this.cpu.loadProgram(buffer);
        console.log(`[Geometry OS] Loaded ${url} into Pixel CPU.`);
    }
}
```

### 3. Next Steps

**Command:** Create the integration layer file to bridge the CPU and the visual map.

```bash
# Create the new integration file
touch systems/visual_shell/web/cpu_integration_layer.js
```