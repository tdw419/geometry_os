# Solution for Task: Memory read/write methods work correctly

Here is the implementation plan for the **Memory read/write methods** task within the Pixel CPU - PixiJS Integration.

### 1. File Paths

This task focuses on creating the Memory Management Unit (MMU) bridge that connects the CPU's memory space to the PixiJS textures and console.

*   **Modified**: `systems/visual_shell/web/pixel_cpu.js`
    *   *Reason*: To hook into the existing `Memory` class or add `MMU` logic to handle specific memory ranges (Framebuffer, Console, MMIO).
*   **Modified**: `systems/visual_shell/web/infinite_map.js`
    *   *Reason*: To expose methods that update the texture data when the CPU writes to video memory.
*   **Created**: `systems/visual_shell/web/pixi_cpu_integration.js`
    *   *Reason*: To hold the `MMU` class and the logic that translates CPU memory addresses into PixiJS texture updates.

### 2. Code Implementation

We will implement an **MMU (Memory Management Unit)** that intercepts read/write calls. It uses a `Uint8Array` for RAM but redirects writes to specific addresses (Memory-Mapped I/O) to PixiJS texture buffers.

#### A. The MMU Class (`pixi_cpu_integration.js`)

This class manages the RAM and bridges the CPU to the visual components.

```javascript
// systems/visual_shell/web/pixi_cpu_integration.js

import { ConsoleView } from './console_view.js'; // Assumed console component

export class MMU {
    constructor(memorySize, framebufferTexture) {
        this.ram = new Uint8Array(memorySize);
        this.framebufferTexture = framebufferTexture;
        
        // Memory Map Configuration (RISC-V style)
        this.MEM_BASE = 0x00000000;
        this.FB_BASE  = 0x80000000; // Framebuffer starts here
        this.CL_BASE  = 0x90000000; // Console starts here
        this.FB_SIZE  = 320 * 240 * 4; // Width * Height * RGBA
        
        // Prepare a buffer for the texture to avoid locking it constantly
        this.textureBuffer = new Uint8Array(this.framebufferTexture.width * this.framebufferTexture.height * 4);
    }

    // Called by CPU to read a 32-bit word
    load32(address) {
        if (address >= this.FB_BASE && address < (this.FB_BASE + this.FB_SIZE)) {
            // Read from texture buffer
            const idx = address - this.FB_BASE;
            return this.textureBuffer[idx] | (this.textureBuffer[idx+1] << 8) | 
                   (this.textureBuffer[idx+2] << 16) | (this.textureBuffer[idx+3] << 24);
        }
        
        // Default RAM read
        if (address >= this.ram.length) return 0; // Guard
        return this.ram[address] | (this.ram[address+1] << 8) | 
               (this.ram[address+2] << 16) | (this.ram[address+3] << 24);
    }

    // Called by CPU to write a 32-bit word
    store32(address, value) {
        const byte0 = value & 0xFF;
        const byte1 = (value >> 8) & 0xFF;
        const byte2 = (value >> 16) & 0xFF;
        const byte3 = (value >> 24) & 0xFF;

        // 1. Handle Framebuffer Writes (Video Memory)
        if (address >= this.FB_BASE && address < (this.FB_BASE + this.FB_SIZE)) {
            const idx = address - this.FB_BASE;
            this.textureBuffer[idx] = byte0;
            this.textureBuffer[idx+1] = byte1;
            this.textureBuffer[idx+2] = byte2;
            this.textureBuffer[idx+3] = byte3;
            
            // Flag texture for update (PixiJS will handle this on next render)
            this.framebufferTexture.update(); 
            return;
        }

        // 2. Handle Console Writes (Character Output)
        if (address === this.CL_BASE) {
            // Assuming ASCII char in lowest byte
            if (byte0 === 10) { 
                ConsoleView.println(); // Newline
            } else {
                ConsoleView.print(String.fromCharCode(byte0));
            }
            return;
        }

        // 3. Standard RAM Write
        if (address < this.ram.length) {
            this.ram[address] = byte0;
            this.ram[address+1] = byte1;
            this.ram[address+2] = byte2;
            this.ram[address+3] = byte3;
        }
    }
    
    // Helper to load binary data into RAM
    loadBinary(data, offset) {
        this.ram.set(data, offset);
    }
}
```

#### B. CPU Integration (`pixel_cpu.js`)

Modify the CPU execution loop to use the MMU for memory access instead of raw arrays.

```javascript
// systems/visual_shell/web/pixel_cpu.js

export class PixelCPU {
    constructor(mmu) {
        this.mmu = mmu; // Inject the MMU dependency
        this.registers = new Int32Array(32);
        this.pc = 0;
    }

    step() {
        // Fetch instruction
        const instruction = this.mmu.load32(this.pc);
        
        // Decode & Execute (Simplified Example)
        const opcode = instruction & 0x7F;
        
        if (opcode === 0x23) { // SW (Store Word) Example
            // Decode rs2, rs1, imm...
            // const rs2_val = this.registers[rs2];
            // const addr = this.registers[rs1] + imm;
            
            // USE MMU FOR WRITE
            // this.mmu.store32(addr, rs2_val); 
        }
        else if (opcode === 0x03) { // LW (Load Word) Example
            // const addr = this.registers[rs1] + imm;
            
            // USE MMU FOR READ
            // this.registers[rd] = this.mmu.load32(addr);
        }

        this.pc += 4;
    }
}
```

### 3. Next Step

**Command:** Create the integration file to define the Memory Map logic.

```bash
touch systems/visual_shell/web/pixi_cpu_integration.js
```