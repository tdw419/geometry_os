# Solution for Task: Cycles counter works

Based on the provided OpenSpec context and design, here is the implementation plan to integrate the Pixel CPU with the PixiJS Infinite Map, focusing on enabling the **Cycles Counter**.

### 1. File Paths

**New File:**
*   `systems/visual_shell/web/cpu_container.js`
    *   *Role*: A PixiJS `Container` subclass that manages the visual representation of the CPU, including the cycles counter display.

**Modified Files:**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Role*: Add logic to track `cycle_count` and expose it to the visual container.
*   `systems/visual_shell/web/infinite_map.js`
    *   *Role*: Instantiate the `CpuContainer` and add it to the scene graph.

---

### 2. Implementation Code

Here is the JavaScript implementation required to make the cycles counter work.

#### A. Create `cpu_container.js`
This file creates a visual overlay for the CPU state.

```javascript
// systems/visual_shell/web/cpu_container.js
import { Container, Text, TextStyle } from 'pixi.js';

export class CpuContainer extends Container {
    constructor() {
        super();
        
        // Initialize the Cycles Counter Text
        const style = new TextStyle({
            fontFamily: 'Monaco, "Courier New", monospace',
            fontSize: 14,
            fill: 0x00FF00, // Matrix green
            align: 'left',
            dropShadow: true,
            dropShadowAlpha: 0.5,
            dropShadowDistance: 1
        });

        this.cyclesText = new Text({ text: "CPU Cycles: 0", style });
        this.cyclesText.x = 10;
        this.cyclesText.y = 10;
        
        this.addChild(this.cyclesText);
    }

    /**
     * Updates the visual state based on CPU data.
     * Called every frame by the InfiniteMap loop.
     * @param {number} cycleCount 
     */
    updateStats(cycleCount) {
        this.cyclesText.text = `CPU Cycles: ${cycleCount}`;
    }
}
```

#### B. Modify `pixel_cpu.js`
We need to ensure the CPU exposes its cycle count.

```javascript
// systems/visual_shell/web/pixel_cpu.js
// ... existing class definition ...

class PixelCPU {
    constructor() {
        // ... existing initialization ...
        this.cycle_count = 0;
    }

    step() {
        // ... existing instruction execution logic ...
        this.cycle_count++;
    }

    // Helper to get current state
    getState() {
        return {
            cycles: this.cycle_count,
            pc: this.pc,
            // ... other registers
        };
    }
}
```

#### C. Modify `infinite_map.js`
Integrate the CPU and the UI Container into the render loop.

```javascript
// systems/visual_shell/web/infinite_map.js
import { CpuContainer } from './cpu_container.js';
import { PixelCPU } from './pixel_cpu.js';

export class InfiniteMap {
    constructor() {
        // ... existing Pixi setup ...

        // 1. Initialize CPU
        this.cpu = new PixelCPU();

        // 2. Initialize Visual Container
        this.cpuContainer = new CpuContainer();
        this.stage.addChild(this.cpuContainer);

        // Start the render loop
        this.ticker.add((time) => this.renderLoop(time));
    }

    renderLoop(time) {
        // 1. Execute CPU instructions (Non-blocking batch)
        // Example: Execute up to 1000 instructions per frame to prevent UI freezing
        for(let i = 0; i < 1000; i++) {
            this.cpu.step();
        }

        // 2. Update Visuals
        // Pass the current cycle count from the CPU to the visual container
        const state = this.cpu.getState();
        this.cpuContainer.updateStats(state.cycles);

        // ... existing map rendering logic ...
    }
}
```

---

### 3. Next Step

**Command:** Create the new visual component file.

```bash
touch systems/visual_shell/web/cpu_container.js
```