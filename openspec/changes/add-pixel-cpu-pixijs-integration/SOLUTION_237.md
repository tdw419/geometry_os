# Solution for Task: Performance is acceptable

Here is the implementation plan for integrating the Pixel CPU Emulator with the PixiJS Infinite Map.

### 1. Files to be Created and Modified

**New Files**
*   `systems/visual_shell/web/cpu_renderer.js`
    *   **Purpose**: A PixiJS `Container` subclass responsible for visualizing the CPU state (registers, PC) and managing the `PIXI.Texture` update from the framebuffer memory.
*   `systems/visual_shell/web/brick_loader.js`
    *   **Purpose**: Utility to fetch and parse `.brick` files into the format expected by the Pixel CPU.

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   **Change**: Expose the `step()` or `execute()` method to be called externally. Ensure memory access allows reading the framebuffer range (e.g., `0x8000_0000`).
*   `systems/visual_shell/web/infinite_map.js`
    *   **Change**: Instantiate the `CpuRenderer` and add it to the scene. Integrate the CPU execution loop into the map's update cycle.

---

### 2. Implementation Code

Below are the core logic snippets required to bridge the two systems.

#### A. The CPU Visualizer (`cpu_renderer.js`)
This component creates a PixiJS texture that maps directly to the Pixel CPU's memory, allowing the CPU to "draw" to the screen by writing to memory addresses.

```javascript
// systems/visual_shell/web/cpu_renderer.js
import { Container, Graphics, Texture, Sprite } from 'pixi.js';

export class CpuRenderer extends Container {
    constructor(cpu, width, height) {
        super();
        this.cpu = cpu;
        this.width = width;
        this.height = height;
        
        // Create a buffer for the texture (RGBA)
        this.buffer = new Uint8ClampedArray(width * height * 4);
        
        // Create a PixiJS texture from this buffer
        this.texture = new Texture({ 
            source: this.buffer, 
            width: width, 
            height: height,
            antialias: false 
        });
        
        const sprite = new Sprite(this.texture);
        sprite.x = 0;
        sprite.y = 0;
        this.addChild(sprite);

        // Debug UI overlay for Registers
        this.debugGraphics = new Graphics();
        this.addChild(this.debugGraphics);
    }

    // Call this every frame or every N CPU cycles
    syncFramebuffer() {
        // 1. Read from CPU Memory (Assuming framebuffer starts at 0x80000000)
        // This depends on how pixel_cpu.js exposes memory. 
        // Assuming this.cpu.memory is a Uint8Array or DataView.
        const fbStart = 0x80000000; 
        const fbSize = this.width * this.height * 4;
        
        // Update the local buffer (Fast copy if using SharedArrayBuffer, otherwise manual loop)
        // For this example, we assume we have to copy data manually
        const cpuMem = new Uint8Array(this.cpu.memory.buffer, fbStart, fbSize);
        this.buffer.set(cpuMem);

        // 2. Update PixiJS Texture
        this.texture.source.update();
    }

    drawDebug() {
        this.debugGraphics.clear();
        this.debugGraphics.fillRect(0, 0, 200, 150);
        this.debugGraphics.fillStyle(0x000000);
        
        // Draw PC and Registers
        const pc = this.cpu.pc;
        this.debugGraphics.fillText(`PC: 0x${pc.toString(16)}`, 10, 20);
        
        // Draw first few registers
        for(let i = 0; i < 8; i++) {
            const val = this.cpu.registers[i];
            this.debugGraphics.fillText(`x${i}: 0x${val.toString(16)}`, 10, 40 + (i * 12));
        }
    }
}
```

#### B. Integration Logic (`infinite_map.js`)
This snippet shows how to run the CPU without blocking the PixiJS render loop (Cooperative Multitasking).

```javascript
// systems/visual_shell/web/infinite_map.js
import { CpuRenderer } from './cpu_renderer.js';
import { PixelCpu } from './pixel_cpu.js'; // Assuming class export

export class InfiniteMap {
    constructor() {
        // ... existing setup ...
        
        // Initialize CPU
        this.cpu = new PixelCpu();
        
        // Initialize Visualizer (Screen size 256x256 for example)
        this.cpuViz = new CpuRenderer(this.cpu, 256, 256);
        this.cpuViz.setPosition(20, 20); // Position on the map
        
        // Add to the Pixi stage
        this.stage.addChild(this.cpuViz);
        
        // Load OS
        this.loadBrick("os_core.brick");
    }

    async loadBrick(filename) {
        const response = await fetch(filename);
        const buffer = await response.arrayBuffer();
        this.cpu.loadProgram(buffer);
    }

    // The main render loop provided by PixiJS
    update(deltaTime) {
        // ... existing map logic (scrolling, tiles) ...

        // --- CPU Integration Step ---
        
        // Performance Budget: Execute CPU for max 2ms per frame
        const startTime = performance.now();
        const budget = 2; 
        
        while (performance.now() - startTime < budget) {
            if (!this.cpu.step()) break; // Stop if CPU halts
        }

        // Sync visuals
        this.cpuViz.syncFramebuffer();
        this.cpuViz.drawDebug();
    }
}
```

---

### 3. Next Step

**Command:** Create the visualizer component to handle the memory-to-texture mapping.

```bash
touch systems/visual_shell/web/cpu_renderer.js
```

**Reasoning:** We need a dedicated UI component that owns the PixiJS texture and manages the synchronization between the raw memory bytes of the CPU and the visual output. This is the foundational step for the "Visual-First" principle.