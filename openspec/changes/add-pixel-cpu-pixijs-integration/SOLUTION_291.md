# Solution for Task: Registers are displayed correctly

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, focusing on the task: **Registers are displayed correctly**.

### 1. File Paths

Create the following new file to handle the bridge between the CPU state and the PixiJS rendering engine. This file will define the UI component responsible for listing the registers.

*   **`systems/visual_shell/web/cpu_visualizer.js`** (New)
    *   Contains the `CpuVisualizer` class.
    *   Manages the PixiJS container and text objects for the register display.
    *   Updates the visual text based on the CPU state.

Modify the following existing file to instantiate and update the visualizer:

*   **`systems/visual_shell/web/infinite_map.js`** (Modified)
    *   Import and initialize `CpuVisualizer`.
    *   Pass CPU state data to the visualizer in the render loop.

### 2. Code Implementation

#### **File: `systems/visual_shell/web/cpu_visualizer.js`**
This class creates a "Heads Up Display" (HUD) overlay on top of the infinite map. It iterates through the 32 standard RISC-V registers and creates PixiJS Text objects for them.

```javascript
import { Container, Text, Graphics } from 'pixi.js';

export class CpuVisualizer {
    constructor(app) {
        this.app = app;
        this.container = new Container();
        
        // Position the register display in the top-left corner
        this.container.x = 20;
        this.container.y = 20;

        // Create a semi-transparent background for readability
        const background = new Graphics();
        background.rect(0, 0, 250, 600).fill({ color: 0x000000, alpha: 0.6 });
        this.container.addChild(background);

        this.registerTexts = [];
        this.initRegisters();
        
        // Add to the main stage (assuming app is the Pixi Application)
        app.stage.addChild(this.container);
    }

    initRegisters() {
        // Create text objects for registers x0 to x31
        for (let i = 0; i < 32; i++) {
            const textStyle = {
                fontFamily: 'Monaco, "Courier New", monospace',
                fontSize: 14,
                fill: 0x00FF00, // Terminal green
                align: 'left'
            };
            
            // Format: "x01: 0x00000000"
            const textObj = new Text(`x${i.toString().padStart(2, '0')}: 0x00000000`, textStyle);
            textObj.x = 10;
            textObj.y = 10 + (i * 18); // 18px line height
            
            this.registerTexts.push(textObj);
            this.container.addChild(textObj);
        }
    }

    /**
     * Updates the register display with the current state of the CPU
     * @param {Array} registers - Array of 32 integers representing the register file
     */
    update(registers) {
        if (!registers || registers.length < 32) return;

        for (let i = 0; i < 32; i++) {
            const val = registers[i];
            // Convert to hex string and update text
            const hexStr = val.toString(16).padStart(8, '0').toUpperCase();
            this.registerTexts[i].text = `x${i.toString().padStart(2, '0')}: 0x${hexStr}`;
        }
    }
}
```

#### **Modification: `systems/visual_shell/web/infinite_map.js`**
Integrate the visualizer into the map system. We assume the `InfiniteMap` class has access to the `pixelCpu` instance.

```javascript
import { CpuVisualizer } from './cpu_visualizer.js';

export class InfiniteMap {
    // ... existing constructor code ...
    constructor(app, pixelCpu) {
        this.app = app;
        this.cpu = pixelCpu; // The PixelCPU instance

        // ... existing map initialization ...

        // Initialize the Register Display
        this.cpuViz = new CpuVisualizer(this.app);
    }

    // ... existing methods ...

    /**
     * The main render loop or update method called by PixiJS ticker
     */
    onTick() {
        // ... existing camera/tile logic ...

        // CRITICAL: Update register display every frame
        // Accessing the registers directly from the CPU instance
        if (this.cpu && this.cpuViz) {
            this.cpuViz.update(this.cpu.registers);
        }
    }
}
```

### 3. Next Step

Create the `cpu_visualizer.js` file and integrate it into `infinite_map.js` to verify that the RISC-V registers update in real-time as the CPU executes instructions.

```bash
# Create the new visualizer component
touch systems/visual_shell/web/cpu_visualizer.js
```