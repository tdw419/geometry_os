# Solution for Task: Console tile is created

Here is the implementation plan for the **Console Tile** feature. This step bridges the Pixel CPU's memory-mapped output with the PixiJS visual layer.

### 1. File Paths

*   **Modified**: `systems/visual_shell/web/infinite_map.js`
    *   *Reason*: To add logic for rendering the "Console Tile" within the infinite grid.
*   **Modified**: `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason*: To expose the memory buffer required for the console readout.
*   **Created**: `systems/visual_shell/web/pixi_components/console_tile.js`
    *   *Reason*: To encapsulate the specific rendering logic for the console (text handling, background, and blinking cursor) as a reusable PixiJS container.

### 2. Implementation Code

#### A. Create the Console Tile Component
**File**: `systems/visual_shell/web/pixi_components/console_tile.js`

This component creates a visual representation of a terminal. It expects a reference to the CPU's memory to read characters.

```javascript
import { Container, Graphics, Text, TextStyle } from 'pixi.js';

export class ConsoleTile extends Container {
    constructor(cpu, width = 320, height = 240) {
        super();
        this.cpu = cpu;
        this.width = width;
        this.height = height;

        // 1. Background (Dark terminal look)
        const bg = new Graphics();
        bg.rect(0, 0, width, height).fill({ color: 0x1e1e1e }); // Dark grey
        this.addChild(bg);

        // 2. Text Object for Console Output
        const style = new TextStyle({
            fontFamily: 'Monaco, "Courier New", monospace',
            fontSize: 14,
            fill: 0x00ff00, // Hacker green
            align: 'left',
            breakWords: true,
            wordWrap: true,
            wordWrapWidth: width - 20
        });
        
        this.consoleText = new Text({ text: "", style: style });
        this.consoleText.x = 10;
        this.consoleText.y = 10;
        this.addChild(this.consoleText);

        // 3. State tracking
        this.lastCursorPos = 0;
    }

    // Called every frame by the InfiniteMap
    update() {
        if (!this.cpu) return;

        // Memory Mapped I/O Constants
        const CONSOLE_BASE = 0x8000; // Hypothetical base address for console
        const CURSOR_OFFSET = 0x1000;
        
        // Read current cursor position from CPU memory
        const currentCursor = this.cpu.read32(CONSOLE_BASE + CURSOR_OFFSET);

        // Optimization: Only update text if cursor moved
        if (currentCursor !== this.lastCursorPos) {
            const start = CONSOLE_BASE;
            const end = CONSOLE_BASE + currentCursor;
            
            // Extract bytes from memory and decode to string
            const bytes = this.cpu.memory.subarray(start, end);
            const textContent = new TextDecoder().decode(bytes);
            
            this.consoleText.text = textContent;
            this.lastCursorPos = currentCursor;
        }
    }
}
```

#### B. Integrate into Infinite Map
**File**: `systems/visual_shell/web/infinite_map.js`

You need to instantiate the `ConsoleTile` and add it to the tile management system.

```javascript
import { ConsoleTile } from './pixi_components/console_tile.js';

class InfiniteMap {
    // ... existing constructor ...
    
    addConsoleTile(cpuInstance, gridX, gridY) {
        // Create the visual component
        const consoleTile = new ConsoleTile(cpuInstance);
        
        // Position it based on grid coordinates
        consoleTile.x = gridX * this.TILE_SIZE;
        consoleTile.y = gridY * this.TILE_SIZE;

        // Add to the main container
        this.container.addChild(consoleTile);
        
        // Register it for updates if you have an update loop
        this.updatables.push(consoleTile);
    }
}
```

### 3. Next Step

**Command:** Create the component file and wire up the memory pointer.

```bash
# 1. Create the directory structure for components
mkdir -p systems/visual_shell/web/pixi_components

# 2. Create the ConsoleTile logic
touch systems/visual_shell/web/pixi_components/console_tile.js

# 3. (Manual) Copy the code from section A into console_tile.js
```

**After coding:** Verify that the `PixelCPU` class exposes a `memory` Uint8Array and a `read32` method, as the `ConsoleTile` relies on direct memory access to render text efficiently.