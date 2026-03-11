# Solution for Task: Sprite is positioned correctly

Here is the implementation plan for the **PixiJS Integration** task, focusing on the specific requirement: **"Sprite is positioned correctly."**

This task involves creating a bridge between the CPU's memory (where the drawing coordinates are stored) and the PixiJS visual container (where the sprite is rendered).

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/pixi_integration.js` (The bridge logic)
*   **Modified:** `systems/visual_shell/web/infinite_map.js` (To expose the container)
*   **Created:** `systems/visual_shell/web/sprites/cpu_sprite.js` (The specific Sprite implementation)

### 2. Code Solution

We need to ensure the CPU can write to a specific memory address (e.g., `0x1000` for X, `0x1004` for Y) and have the PixiJS sprite update its position in the render loop without blocking the CPU.

**A. Define the Memory Map & Sprite Logic (`cpu_sprite.js`)**

```javascript
import { Sprite } from 'pixi.js';

export class CPUSprite extends Sprite {
    constructor(texture, cpuBus) {
        super(texture);
        this.cpuBus = cpuBus;
        this.anchor.set(0.5); // Center pivot
    }

    // Call this once per frame in the render loop
    syncWithCPU() {
        // Memory Mapped I/O Addresses (Example)
        const ADDR_X = 0x1000; 
        const ADDR_Y = 0x1004;

        // Read 32-bit integers from CPU memory
        const x = this.cpuBus.view.getUint32(ADDR_X, true);
        const y = this.cpuBus.view.getUint32(ADDR_Y, true);

        // Update PixiJS position
        // This syncs the "Visual" (Pixi) with the "Logical" (CPU)
        if (this.x !== x || this.y !== y) {
            this.position.set(x, y);
        }
    }
}
```

**B. Integration Hook (`pixi_integration.js`)**

```javascript
export class PixiIntegration {
    constructor(cpu, app) {
        this.cpu = cpu;
        this.app = app;
        this.sprites = [];
    }

    addSprite(texture) {
        const sprite = new CPUSprite(texture, this.cpu.bus);
        this.app.stage.addChild(sprite);
        this.sprites.push(sprite);
    }

    // The Render Loop Hook
    tick() {
        // 1. Advance CPU (Non-blocking chunk)
        this.cpu.executeInstructions(100); // Run small burst

        // 2. Sync Visuals
        for (const sprite of this.sprites) {
            sprite.syncWithCPU();
        }
    }
}
```

### 3. Next Step

Run the following command to generate the specific sprite wrapper class and the unit tests for memory-mapped positioning:

```bash
geometry generate component --name CPUSprite --type logic --dir systems/visual_shell/web/sprites
```