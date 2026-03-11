# Solution for Task: Frame rate remains at 60 FPS

Here is the implementation plan to address the **60 FPS** requirement while integrating the Pixel CPU with the PixiJS Infinite Map.

### 1. File Path Changes

*   **Modified**: `systems/visual_shell/web/infinite_map.js`
    *   *Reason*: To add the "CPU Render Layer" and integrate the update loop.
*   **Modified**: `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason*: To add a `stepBatch(count)` method for non-blocking execution.
*   **Created**: `systems/visual_shell/web/cpu_render_layer.js`
    *   *Reason*: A new PixiJS Container class responsible for managing the texture that maps to the CPU's framebuffer memory.

### 2. Implementation Code

#### A. Non-Blocking CPU Logic (`pixel_cpu.js` modification)
To maintain 60 FPS, we cannot run the entire CPU cycle in one frame. We must limit the execution time per frame.

```javascript
// systems/visual_shell/web/pixel_cpu.js

class PixelCPU {
    constructor() {
        // ... existing initialization
        this.maxCyclesPerFrame = 5000; // Safety limit to prevent frame drops
    }

    /**
     * Executes up to N instructions or until time runs out.
     * Returns true if execution should continue (yield).
     */
    stepBatch() {
        const start = performance.now();
        let cycles = 0;

        // Execute until we hit the cycle limit OR exceed 8ms (budget for 60fps)
        while (cycles < this.maxCyclesPerFrame) {
            if (performance.now() - start > 8) break; // Yield control
            
            if (this.halted) break;

            this.executeOneInstruction(); // Existing logic
            cycles++;
        }
        
        return !this.halted;
    }
}
```

#### B. PixiJS Render Layer (`cpu_render_layer.js` creation)
This component creates the visual link between CPU memory and the GPU.

```javascript
// systems/visual_shell/web/cpu_render_layer.js
import { Container, Graphics, Texture } from 'pixi.js';

export class CpuRenderLayer extends Container {
    constructor(cpu, memoryStart, width, height) {
        super();
        this.cpu = cpu;
        this.memStart = memoryStart;
        this.width = width;
        this.height = height;
        
        // Create a texture that we will update manually from CPU memory
        this.texture = Texture.createEmpty(width, height);
        
        // Create a sprite to display the texture
        this.screenSprite = new Sprite(this.texture);
        this.addChild(this.screenSprite);
        
        // Debug border
        const border = new Graphics();
        border.rect(0, 0, width, height).stroke({ width: 2, color: 0x00FF00 });
        this.addChild(border);
    }

    // Call this once per frame in the InfiniteMap loop
    updateTexture() {
        // 1. Access the CPU's Uint8Array memory
        const mem = this.cpu.memory;
        
        // 2. Create a view of the framebuffer region
        // Assuming 4 bytes per pixel (RGBA)
        const framebuffer = new Uint8Array(
            mem.buffer, 
            this.memStart, 
            this.width * this.height * 4
        );

        // 3. Update the PixiJS texture
        // Note: In PixiJS v8, replaceRGBA might differ slightly depending on exact version, 
        // but this is the general approach for manual texture updates.
        const resource = this.texture.source;
        resource.resource.update(framebuffer);
    }
}
```

#### C. Integration (`infinite_map.js` modification)
Connecting the pieces into the render loop.

```javascript
// systems/visual_shell/web/infinite_map.js

import { CpuRenderLayer } from './cpu_render_layer.js';
import { PixelCPU } from './pixel_cpu.js';

export class InfiniteMap {
    constructor() {
        // ... existing setup
        
        // Initialize CPU
        this.cpu = new PixelCPU();
        
        // Initialize Render Layer (e.g., mapping framebuffer at 0x8000)
        this.cpuLayer = new CpuRenderLayer(this.cpu, 0x8000, 320, 240);
        this.viewport.addChild(this.cpuLayer);
        
        // Center the CPU screen on the map
        this.cpuLayer.x = 0;
        this.cpuLayer.y = 0;
    }

    // The standard PixiJS update loop
    update(deltaTime) {
        // 1. Execute CPU logic (Non-blocking)
        // We assume the brick file is already loaded into the CPU
        this.cpu.stepBatch();

        // 2. Update Visuals if CPU changed memory
        if (this.cpu.didModifyMemory) {
            this.cpuLayer.updateTexture();
            this.cpu.didModifyMemory = false;
        }
        
        // ... existing map logic
    }
}
```

### 3. Next Step

Create the new render layer component to handle the texture mapping:

```bash
touch systems/visual_shell/web/cpu_render_layer.js
```