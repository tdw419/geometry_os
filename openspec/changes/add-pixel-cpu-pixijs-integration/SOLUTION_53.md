# Solution for Task: Console I/O writes characters to buffer

Based on the provided context and design, here is the implementation plan for **Phase 40**, focusing on the specific requirement: **"Console I/O writes characters to buffer."**

This phase establishes the link between the emulated CPU's standard output and the PixiJS visual layer.

### 1. File Paths

*   **Create:** `systems/visual_shell/web/cpu_memory_map.js`
    *   *Role:* Defines the memory addresses for the MMIO (Memory-Mapped I/O) Console.
*   **Modify:** `systems/visual_shell/web/pixel_cpu.js`
    *   *Role:* Hooking the CPU's write cycle to check for MMIO addresses.
*   **Modify:** `systems/visual_shell/web/infinite_map.js`
    *   *Role:* Rendering the character buffer to the PixiJS container.

---

### 2. Code Implementation

#### A. Define Memory Map & Console Buffer
**File:** `systems/visual_shell/web/cpu_memory_map.js`
We need a centralized location for memory addresses and a buffer to store characters before rendering.

```javascript
export const CPU_MEMORY_MAP = {
    // Base address for Console I/O
    CONSOLE_BASE: 0x8000_0000,
    // Write-only register to push a char to the buffer
    CONSOLE_WRITE: 0x8000_0000,
    // Control register (e.g., to flush or clear)
    CONSOLE_CTRL: 0x8000_0004
};

export class ConsoleBuffer {
    constructor(maxChars = 1024) {
        this.buffer = [];
        this.maxChars = maxChars;
        this.isDirty = false;
    }

    write(charCode) {
        // Convert byte to character
        const char = String.fromCharCode(charCode);
        
        // Handle newline
        if (charCode === 0x0A) {
            this.buffer.push('\n');
        } else if (charCode >= 32 && charCode <= 126) {
            // Printable ASCII
            this.buffer.push(char);
        }
        
        // Mark for rendering
        this.isDirty = true;
        
        // Simple scrolling buffer logic
        if (this.buffer.length > this.maxChars) {
            this.buffer.shift();
        }
    }

    getText() {
        this.isDirty = false;
        return this.buffer.join('');
    }
}
```

#### B. CPU Integration (The "Trap")
**File:** `systems/visual_shell/web/pixel_cpu.js`
Modify the CPU execution loop to intercept writes to the `CONSOLE_WRITE` address.

```javascript
import { CPU_MEMORY_MAP } from './cpu_memory_map.js';

class PixelCPU {
    constructor(memoryMap) {
        // ... existing cpu setup ...
        this.memoryMap = memoryMap; // Pass in the shared ConsoleBuffer instance
    }

    // Inside your executeInstruction or storeWord method
    storeWord(address, value) {
        // 1. Check for Memory-Mapped I/O
        if (address === CPU_MEMORY_MAP.CONSOLE_WRITE) {
            // Write LSB of value to console buffer
            this.memoryMap.console.write(value & 0xFF);
            return; // Don't write to physical RAM
        }

        // 2. Standard RAM write
        this.ram[address] = value;
    }
}
```

#### C. PixiJS Visualization
**File:** `systems/visual_shell/web/infinite_map.js`
Create a text object attached to the "CPU" entity in the infinite map that updates every frame.

```javascript
import { ConsoleBuffer } from './cpu_memory_map.js';

export class InfiniteMap {
    constructor() {
        // ... existing pixi setup ...
        
        // Initialize Console System
        this.consoleBuffer = new ConsoleBuffer();
        
        // Create PixiJS Text object
        this.consoleText = new PIXI.Text({
            text: "",
            style: {
                fontFamily: "Courier New",
                fontSize: 14,
                fill: 0x00FF00, // Matrix green
                backgroundColor: 0x000000,
                breakWords: true,
                wordWrap: true,
                wordWrapWidth: 300
            }
        });
        
        // Position text near the CPU "Avatar" on the map
        this.consoleText.x = 20;
        this.consoleText.y = 500; // Offset from center
        this.container.addChild(this.consoleText);
    }

    update() {
        // ... existing map update logic ...

        // Check if CPU wrote new data
        if (this.consoleBuffer.isDirty) {
            this.consoleText.text = this.consoleBuffer.getText();
        }
    }
}
```

---

### 3. Next Step

To implement this design, run the following command in your terminal to scaffold the new memory map file:

```bash
touch systems/visual_shell/web/cpu_memory_map.js
```

Then, paste the **Code Implementation A** into that file, and proceed to update `pixel_cpu.js` and `infinite_map.js` according to snippets B and C.