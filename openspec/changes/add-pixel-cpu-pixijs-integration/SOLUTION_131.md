# Solution for Task: CPU memory is copied to framebuffer

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Infinite Map, addressing the specific requirement to map CPU memory to the framebuffer.

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason:* Expose the memory buffer (Uint8Array) to the visual system so PixiJS can read it directly.
*   **Modified:** `systems/visual_shell/web/infinite_map.js`
    *   *Reason:* Add the logic to create a PixiJS Texture from the CPU memory and update it every frame.
*   **Created:** `systems/visual_shell/web/cpu_container.js`
    *   *Reason:* A new component to manage the lifecycle of the CPU, the PixiJS display object (Sprite), and the update loop synchronization.

### 2. Implementation Code (JavaScript)

Since this is a browser-based rendering task, the solution requires **JavaScript**. We will use the PixiJS `Texture.fromBuffer` API to map the CPU's memory directly to a GPU texture without copying data every frame.

#### Step A: Modify `pixel_cpu.js` to expose Memory
We need to ensure the RISC-V memory is accessible.

```javascript
// systems/visual_shell/web/pixel_cpu.js

class PixelCPU {
    constructor() {
        // Initialize memory (e.g., 4MB RAM)
        this.memory = new Uint8Array(4 * 1024 * 1024); 
        this.pc = 0;
        this.registers = new Uint32Array(32);
        // ... existing init code ...
    }

    // ... existing execution logic ...

    /**
     * Returns the raw memory buffer.
     * In a real RISC-V, the framebuffer is mapped to a specific address range.
     * We will map a texture to a slice of this memory.
     */
    getMemoryBuffer() {
        return this.memory;
    }
}
```

#### Step B: Create `cpu_container.js` (The Integration Logic)
This component bridges the CPU and the PixiJS scene. It maps a slice of CPU memory to a texture.

```javascript
// systems/visual_shell/web/cpu_container.js
import * as PIXI from 'pixi.js';

export class CPUDisplayContainer extends PIXI.Container {
    constructor(cpu) {
        super();
        this.cpu = cpu;

        // Configuration for the framebuffer
        // We map a specific region of CPU memory to this texture
        this.fbWidth = 320;
        this.fbHeight = 240;
        this.fbOffset = 0x1000; // The CPU address where the screen starts

        // Create a texture directly from the CPU's memory buffer
        // We pass a VIEW of the memory (subarray) so no copying occurs
        const framebufferData = this.cpu.memory.subarray(
            this.fbOffset, 
            this.fbOffset + (this.fbWidth * this.fbHeight * 4) // 4 bytes per pixel (RGBA)
        );

        // Create texture from the buffer
        // PixiJS v8 specific syntax
        this.texture = PIXI.Texture.fromBuffer(framebufferData, this.fbWidth, this.fbHeight);
        
        // Create a sprite to display in the world
        this.sprite = new PIXI.Sprite(this.texture);
        this.sprite.anchor.set(0.5);
        this.scale.set(2); // Zoom in a bit so we can see pixels
        this.addChild(this.sprite);

        // Flag to track if we need to update the GPU texture
        this.needsUpdate = true;
    }

    // Call this from the main application loop
    update(deltaTime) {
        // 1. Execute some CPU instructions
        // (Non-blocking: execute a small batch per frame)
        this.cpu.executeBatch(1000); 

        // 2. Update the visual if CPU wrote to video memory
        // In a real system, we'd check a "dirty bit" register.
        // Here, we assume the CPU running implies screen changes.
        if (this.needsUpdate) {
            this.texture.update(); // Uploads the Uint8Array data to GPU
            this.needsUpdate = false;
        }
    }
}
```

#### Step C: Integration into `infinite_map.js`

```javascript
// systems/visual_shell/web/infinite_map.js
import { CPUDisplayContainer } from './cpu_container.js';

export class InfiniteMap {
    constructor(app) {
        this.app = app;
        this.container = new PIXI.Container();
        this.app.stage.addChild(this.container);
        
        // ... existing map logic ...
    }

    loadCPU(cpu) {
        // Create the visual representation of the CPU
        this.cpuDisplay = new CPUDisplayContainer(cpu);
        
        // Place the "Screen" at a specific coordinate in the infinite world
        this.cpuDisplay.x = 500;
        this.cpuDisplay.y = 500;
        
        this.container.addChild(this.cpuDisplay);
    }

    // Existing render loop
    tick(deltaTime) {
        // ... camera logic ...

        // Update CPU and Screen
        if (this.cpuDisplay) {
            this.cpuDisplay.update(deltaTime);
        }
    }
}
```

### 3. Next Step

**Command:** Create the integration component.

```bash
touch systems/visual_shell/web/cpu_container.js
```

Then, paste the **Step B** code provided above into that file to establish the bridge between the RISC-V memory and the PixiJS rendering engine.