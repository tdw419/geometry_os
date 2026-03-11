# Solution for Task: PC is updated in real-time

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map.

### 1. Files to be Created or Modified

**Modified:**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   Add `stepCPU()` and `getMemoryBuffer()` methods to expose state to the renderer.
*   `systems/visual_shell/web/infinite_map.js`
    *   Add `CPUContainer` to the scene graph.
    *   Implement `updateCPUDisplay()` to sync texture with memory.

**Created:**
*   `systems/visual_shell/web/cpu_bridge.js`
    *   New module to handle the event loop, throttling, and memory mapping between the two systems.
*   `systems/visual_shell/web/shaders/cpu_filter.frag`
    *   (Optional) Custom PixiJS filter for CRT effects on the CPU framebuffer.

---

### 2. Code Implementation

#### A. The Bridge Logic (`cpu_bridge.js`)
This file orchestrates the non-blocking execution loop. It uses `requestAnimationFrame` to ensure the CPU doesn't block the UI.

```javascript
// systems/visual_shell/web/cpu_bridge.js

import { PixelCPU } from './pixel_cpu.js';

export class CPUBridge {
    constructor(pixiApp, mapInstance) {
        this.cpu = new PixelCPU();
        this.app = pixiApp;
        this.map = mapInstance;
        this.isRunning = false;
        
        // Configuration
        this.cyclesPerFrame = 1000; // Execute 1000 instructions per render frame
        this.frameBufferAddr = 0x80000000; // Base address for video memory
        
        // Initialize Texture
        this.frameTexture = null; 
    }

    async loadBrick(arrayBuffer) {
        await this.cpu.loadBinary(arrayBuffer);
        this.start();
    }

    start() {
        if (this.isRunning) return;
        this.isRunning = true;
        this.app.ticker.add(this._updateLoop, this);
    }

    stop() {
        this.isRunning = false;
        this.app.ticker.remove(this._updateLoop, this);
    }

    _updateLoop() {
        // 1. Execute CPU Instructions (Non-blocking chunk)
        const cycles = this.cpu.stepCycles(this.cyclesPerFrame);

        // 2. Check for Memory Mapped I/O updates
        this._updateFrameBuffer();

        // 3. Update UI/Console if dirty
        if (this.cpu.isConsoleDirty()) {
            this.map.updateConsole(this.cpu.getConsoleOutput());
        }
    }

    _updateFrameBuffer() {
        // Access the raw memory from the CPU emulator
        const memory = this.cpu.getMemory();
        
        // Assuming 320x200 resolution for this example
        // We create a Uint8ClampedArray view of the memory region
        const pixelData = new Uint8ClampedArray(
            memory.buffer, 
            this.frameBufferAddr, 
            320 * 200 * 4
        );

        // Update the PixiJS texture
        if (!this.frameTexture) {
            // Create texture on first run
            this.frameTexture = this.app.renderer.generateTexture(pixelData);
            this.map.addCPUDisplay(this.frameTexture);
        } else {
            // Update existing texture (requires PIXI.Texture.update)
            this.frameTexture.update(); 
        }
    }
}
```

#### B. Modifying the Pixel CPU (`pixel_cpu.js`)
We need to ensure the CPU class exposes its memory safely and supports chunk-based execution.

```javascript
// systems/visual_shell/web/pixel_cpu.js (Additions)

class PixelCPU {
    // ... existing constructor ...

    /**
     * Executes N instructions or until a halt.
     * @param {number} maxCycles - Maximum instructions to execute this frame.
     * @returns {number} - Actual cycles executed.
     */
    stepCycles(maxCycles) {
        let cycles = 0;
        while (cycles < maxCycles && !this.halted) {
            this.executeInstruction(); // Existing logic
            cycles++;
        }
        return cycles;
    }

    /**
     * Returns the Uint8Array memory buffer for direct mapping.
     */
    getMemory() {
        return this.memory; // Assuming 'this.memory' is the backing Uint8Array
    }

    isConsoleDirty() {
        // Check a flag or memory address for console updates
        return this.memory[0xFFFF] === 1; 
    }
}
```

---

### 3. Next Step

**Command:** Create the bridge file to initialize the loop.

```bash
touch systems/visual_shell/web/cpu_bridge.js
```

Then, copy the **Bridge Logic** code above into that file. After creation, you will need to instantiate `CPUBridge` inside your main `index.js` entry point when the PixiJS application initializes.