# Solution for Task: Pause/resume works correctly

Here is the implementation plan for the **Pause/Resume** functionality within the Pixel CPU - PixiJS Integration.

This solution focuses on the `CpuController` class, which acts as the bridge between the `PixelCpu` (logic) and the `InfiniteMap` (rendering). We will implement a state machine to handle the execution loop and hook it into the PixiJS `ticker` to ensure non-blocking operation.

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/pixel_cpu_integration.js` (The core integration controller)
*   **Modified:** `systems/visual_shell/web/infinite_map.js` (To expose the ticker/control hooks)
*   **Created:** `systems/visual_shell/web/cpu_controls.js` (UI overlay for Pause/Resume buttons)

### 2. Implementation Code (JavaScript)

We need to implement the `CpuController` class. This class manages the execution state (`RUNNING`, `PAUSED`) and synchronizes the CPU step with the PixiJS render frame.

**`systems/visual_shell/web/pixel_cpu_integration.js`**

```javascript
import { PixelCpu } from './pixel_cpu.js';

// Execution States
export const CpuState = {
    IDLE: 'IDLE',
    RUNNING: 'RUNNING',
    PAUSED: 'PAUSED',
    HALTED: 'HALTED'
};

export class CpuController {
    constructor(app, infiniteMap) {
        this.cpu = new PixelCpu();
        this.map = infiniteMap;
        this.app = app; // PixiJS Application
        this.state = CpuState.IDLE;
        
        // Configuration: Instructions per frame (tune for performance)
        this.INSTRUCTIONS_PER_FRAME = 1000; 

        // Bind the render loop
        this.app.ticker.add(this._gameLoop.bind(this));
    }

    /**
     * Starts execution of a loaded brick file.
     */
    start(binaryData) {
        this.cpu.loadBinary(binaryData);
        this.state = CpuState.RUNNING;
        console.log("[CpuController] CPU Started.");
    }

    /**
     * Toggles the pause state.
     */
    togglePause() {
        if (this.state === CpuState.RUNNING) {
            this.pause();
        } else if (this.state === CpuState.PAUSED) {
            this.resume();
        }
    }

    pause() {
        if (this.state === CpuState.RUNNING) {
            this.state = CpuState.PAUSED;
            console.log("[CpuController] CPU Paused.");
            // Optional: Emit event for UI update
        }
    }

    resume() {
        if (this.state === CpuState.PAUSED) {
            this.state = CpuState.RUNNING;
            console.log("[CpuController] CPU Resumed.");
            // Optional: Emit event for UI update
        }
    }

    /**
     * The main loop called by PixiJS every frame.
     * Non-blocking: Runs a batch of instructions, then yields to renderer.
     */
    _gameLoop(deltaTime) {
        if (this.state !== CpuState.RUNNING) {
            return; 
        }

        // Execute a batch of instructions
        // We pass 'deltaTime' if the CPU implementation supports timing,
        // otherwise we just run a fixed batch.
        const result = this.cpu.executeBatch(this.INSTRUCTIONS_PER_FRAME);

        // Handle CPU Halted state (e.g., program finished)
        if (result === PixelCpu.Status.HALTED) {
            this.state = CpuState.HALTED;
            console.log("[CpuController] CPU Halted.");
        }

        // Map CPU Memory to PixiJS Textures
        // This reads the framebuffer from CPU memory and updates the texture
        this._updateFramebuffer();
    }

    /**
     * Reads the framebuffer memory address and updates the InfiniteMap texture.
     */
    _updateFramebuffer() {
        const fbAddr = 0x8000; // Example Framebuffer Address
        const fbData = this.cpu.memory.read(fbAddr, 1024); // Read 1KB pixel data
        
        // Update the specific PixiJS Texture
        // Assuming 'map' has a method to update a tile texture dynamically
        this.map.updateTileTexture(fbData);
    }
}
```

### 3. Next Step

**Command:** Create the UI control file to wire the buttons to this logic.

```bash
touch systems/visual_shell/web/cpu_controls.js
```

**Instruction:** Implement the `CpuControls` class in `cpu_controls.js` that creates a PixiJS Container with HTML overlay or Graphics for "Pause" and "Resume" buttons, which will call `controller.togglePause()`.