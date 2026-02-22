# Solution for Task: Printable characters are added to buffer

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, specifically addressing the **Printable characters are added to buffer** requirement.

This solution focuses on bridging the `PixelCPU` and `InfiniteMap` using a Memory-Mapped I/O (MMIO) system. We will create a `TerminalContainer` within PixiJS that listens to a specific memory address in the CPU emulator.

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/infinite_map.js`
    *   *Reason:* To add the `TerminalContainer` visual layer and the logic to sync CPU memory to the display.
*   **Modified:** `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason:* To implement the `writeMMIO` method (Memory-Mapped I/O) which the Brick file instruction set will trigger.
*   **Modified:** `systems/visual_shell/web/main.js` (or entry point)
    *   *Reason:* To instantiate the CPU, link it to the Map, and handle the asynchronous loading of `.brick` files.

### 2. Implementation Code

#### A. Define Memory Map Constants (`pixel_cpu.js` update)
We need to define the address space where the CPU will write characters.

```javascript
// systems/visual_shell/web/pixel_cpu.js

// Memory Map Configuration for MMIO
export const MMIO_CONSOLE_CHAR = 0x10000000; // Address for a single character write
export const MMIO_CONSOLE_FLAG = 0x10000004; // Address to signal write event

export class PixelCPU {
    constructor(memorySize) {
        this.memory = new Uint8Array(memorySize);
        this.registers = new Uint32Array(32);
        this.pc = 0;
        // ... existing initialization ...
        
        // Callback for MMIO updates (to be connected to PixiJS)
        this.onMMIOWrite = null; 
    }

    // ... existing execution logic ...

    // Helper to handle 32-bit writes
    writeMemory(address, value) {
        if (address === MMIO_CONSOLE_CHAR) {
            // Trigger the visual update callback
            if (this.onMMIOWrite) {
                this.onMMIOWrite(value);
            }
        } else {
            // Standard memory write logic
            this.memory[address] = value; 
        }
    }
}
```

#### B. PixiJS Terminal Container (`infinite_map.js` update)
This component renders the text buffer onto the infinite map.

```javascript
// systems/visual_shell/web/infinite_map.js
import * as PIXI from 'pixi.js';

export class TerminalContainer extends PIXI.Container {
    constructor() {
        super();
        this.textStyle = new PIXI.TextStyle({
            fontFamily: 'Courier New',
            fontSize: 14,
            fill: 0x00FF00, // Hacker green
            backgroundColor: 0x000000
        });
        
        // Create a bitmap text object for performance
        this.bitmapText = new PIXI.Text("", this.textStyle);
        this.bitmapText.x = 20;
        this.bitmapText.y = 20;
        this.addChild(this.bitmapText);
        
        this.buffer = "";
    }

    // Call this when CPU writes to MMIO
    addChar(charCode) {
        const char = String.fromCharCode(charCode);
        
        // Handle basic newlines or buffer limits
        if (char === '\n') {
            this.buffer += "\n";
        } else if (charCode >= 32 && charCode <= 126) {
            // Only add printable characters
            this.buffer += char;
        }
        
        // Update the PixiJS text object
        this.bitmapText.text = this.buffer;
    }
}
```

#### C. Integration Logic (The "Glue" Code)
This connects the CPU execution cycle to the visual update.

```javascript
// systems/visual_shell/web/app.js (Example Integration)

import { PixelCPU, MMIO_CONSOLE_CHAR } from './pixel_cpu.js';
import { InfiniteMap } from './infinite_map.js';

async function initSystem() {
    // 1. Initialize the Visual Map
    const map = new InfiniteMap();
    const terminal = new TerminalContainer();
    map.addChild(terminal); // Add terminal to the visual map
    
    // 2. Initialize the CPU
    const cpu = new PixelCPU(1024 * 1024); // 1MB RAM
    
    // 3. Connect CPU to Visuals (The Bridge)
    cpu.onMMIOWrite = (value) => {
        // This function runs inside the CPU cycle
        // We defer the visual update to avoid blocking the CPU too long
        requestAnimationFrame(() => {
            terminal.addChar(value);
        });
    };

    // 4. Load and Execute Brick File
    const brickData = await fetch('./os_kernel.brick').then(r => r.arrayBuffer());
    cpu.loadProgram(brickData);
    
    // 5. Start the Loop
    function gameLoop() {
        // Execute a batch of instructions (e.g., 1000 per frame)
        // This prevents the browser from freezing
        for(let i = 0; i < 1000; i++) {
            cpu.step(); 
        }
        
        map.render(); // Render PixiJS
        requestAnimationFrame(gameLoop);
    }
    
    gameLoop();
}
```

### 3. Next Step

**Create the `TerminalContainer` class in `systems/visual_shell/web/infinite_map.js`.**

You can implement this by adding the code snippet provided in Section B to the file. This will create the visual buffer that accepts characters. After that, modify `pixel_cpu.js` to include the `MMIO_CONSOLE_CHAR` constant and the write hook.