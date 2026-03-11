# Solution for Task: Console display updates on writes

Here is the implementation plan for integrating the Pixel CPU with the PixiJS Visual Shell to support console display updates.

### 1. File Modifications

You will need to modify the existing **Pixel CPU** emulator to handle memory-mapped I/O and the **Infinite Map** to render this output.

#### A. Modify `systems/visual_shell/web/pixel_cpu.js`
We need to expose the memory address space and define a memory-mapped I/O (MMIO) region for the console. We will assume address `0xFFFF_0000` is the console output register.

**Snippet:**
```javascript
class PixelCPU {
    constructor() {
        this.memory = new Uint8Array(1024 * 64); // 64KB Memory
        this.consoleBuffer = []; // Stores characters to be rendered
        this.MMIO_CONSOLE_ADDR = 0xFFFF0000;
    }

    // ... existing instruction execution logic ...

    // Intercept writes to memory
    writeMemory(address, value) {
        if (address === this.MMIO_CONSOLE_ADDR) {
            this.handleConsoleWrite(value);
        } else {
            this.memory[address] = value;
        }
    }

    handleConsoleWrite(charCode) {
        const char = String.fromCharCode(charCode);
        this.consoleBuffer.push(char);
        
        // Dispatch event for the UI to listen to
        window.dispatchEvent(new CustomEvent('cpu-console-write', { 
            detail: { char: char } 
        }));
    }
}
```

#### B. Modify `systems/visual_shell/web/infinite_map.js`
We need to add a `ConsoleLayer` to the PixiJS stage that listens for CPU events and updates the texture.

**Snippet:**
```javascript
import { Container, Text, Graphics } from 'pixi.js';

export class InfiniteMap {
    // ... existing initialization ...

    addConsoleLayer() {
        this.consoleContainer = new Container();
        this.consoleContainer.x = 20; // Position on screen
        this.consoleContainer.y = 20;
        
        // Background for console
        const bg = new Graphics();
        bg.rect(0, 0, 600, 400).fill({ color: 0x000000, alpha: 0.8 });
        this.consoleContainer.addChild(bg);

        // The actual text object
        this.consoleText = new Text({
            text: "",
            style: {
                fontFamily: "Courier New",
                fontSize: 16,
                fill: 0x00FF00,
                wordWrap: true,
                wordWrapWidth: 580
            }
        });
        this.consoleContainer.addChild(this.consoleText);
        
        this.stage.addChild(this.consoleContainer);

        // Listen for CPU writes
        window.addEventListener('cpu-console-write', (e) => {
            this.updateConsole(e.detail.char);
        });
    }

    updateConsole(char) {
        let currentText = this.consoleText.text;
        
        if (char === '\n') {
            // Handle scrolling or newlines if necessary
            currentText += "\n";
        } else {
            currentText += char;
        }
        
        // Simple scroll limit (keep last 2000 chars)
        if (currentText.length > 2000) {
            currentText = currentText.substring(currentText.length - 2000);
        }

        this.consoleText.text = currentText;
    }
}
```

### 2. Integration Logic
Since the design requires **Non-Blocking Execution**, the CPU execution loop should be decoupled from the render loop. You should use `requestAnimationFrame` to execute a specific number of CPU instructions (chunks) per frame, allowing the PixiJS render loop to update the console text smoothly as the `cpu-console-write` events fire.

### 3. Next Step

Run the following command to create the new console overlay component stub:

```bash
mkdir -p systems/visual_shell/web/components && touch systems/visual_shell/web/components/console_layer.js
```