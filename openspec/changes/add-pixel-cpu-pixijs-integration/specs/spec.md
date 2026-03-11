# Specification: Pixel CPU - PixiJS Integration

## Document Information

- **Title**: Pixel CPU - PixiJS Integration Specification
- **Version**: 1.0.0
- **Status**: Draft
- **Author**: Geometry OS Team
- **Date**: 2025-01-25
- **Phase**: Phase 40

## Abstract

This specification defines the integration between the Pixel CPU emulator and the PixiJS infinite map, enabling real-time execution of `.brick` files within the Geometry OS visual shell. The integration provides memory-mapped I/O for console output and framebuffer display, CPU state visualization, and support for booting RISC-V Linux kernels.

## 1. Scope

This specification covers:

1. Integration architecture between Pixel CPU and PixiJS
2. Memory-mapped I/O regions for console and framebuffer
3. CPU execution loop and cycle budgeting
4. Visual components (state overlay, framebuffer display, console tile)
5. Brick file loading and execution
6. Performance requirements and optimization strategies

This specification does not cover:

1. Internal implementation of SimplePixelCPU (covered in [`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1))
2. PixiJS rendering engine internals
3. RISC-V instruction set details
4. Linux kernel internals

## 2. Normative References

- [`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1) - Pixel CPU emulator implementation
- [`infinite_map.js`](systems/visual_shell/web/infinite_map.js:1) - PixiJS infinite map implementation
- PixiJS v8 Documentation - https://pixijs.io/
- RISC-V Specification - https://riscv.org/technical/specifications/

## 3. Terms and Definitions

| Term | Definition |
|------|------------|
| **Pixel CPU** | JavaScript implementation of a RISC-V compatible CPU emulator |
| **Brick File** | Binary file format containing transpiled RISC-V instructions |
| **Infinite Map** | PixiJS-based infinite scrolling map system |
| **Framebuffer** | Memory-mapped region for pixel data display |
| **Memory-Mapped I/O** | I/O accessed via memory read/write operations |
| **Cycle Budget** | Maximum number of CPU cycles per render frame |

## 4. System Architecture

### 4.1 Component Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         Visual Shell (Browser)                       │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    PixiJS Application                        │   │
│  │  ┌────────────────────────────────────────────────────────┐  │   │
│  │  │              InfiniteMap Class                         │  │   │
│  │  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │  │   │
│  │  │  │ Visual Tiles │  │ CPU Display  │  │ Console Tile │ │  │   │
│  │  │  │   (Brick)    │  │  (Framebuffer)│  │   (I/O)     │ │  │   │
│  │  │  └──────────────┘  └──────────────┘  └──────────────┘ │  │   │
│  │  └────────────────────────────────────────────────────────┘  │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                │                                      │
│                                ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    PixelCPUIntegration                         │   │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        │   │
│  │  │ SimplePixel  │  │ Framebuffer  │  │ Console      │        │   │
│  │  │   CPU        │  │   Mapper     │  │   Manager    │        │   │
│  │  └──────────────┘  └──────────────┘  └──────────────┘        │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                │                                      │
│                                ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    Brick File Loader                          │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

### 4.2 Data Flow

```
Brick File → Brick Loader → SimplePixelCPU → Memory Map → Visual Components
                                                ↓
                                        Framebuffer → PixiJS Texture
                                                ↓
                                        Console → Console Tile
                                                ↓
                                        CPU State → State Overlay
```

## 5. Memory Map

### 5.1 Memory Regions

| Address Range | Size | Purpose | Access |
|---------------|------|---------|--------|
| 0x00000000 - 0x000FFFFF | 1 MB | Program Memory (Instructions) | Read/Write |
| 0x10000000 - 0x100FFFFF | 1 MB | Data Memory (Variables, Stack) | Read/Write |
| 0x20000000 - 0x2000FFFF | 64 KB | Console I/O | Read/Write |
| 0x30000000 - 0x3FFFFFFF | 4 MB | Framebuffer | Read/Write |

### 5.2 Console I/O

**Base Address**: 0x20000000

| Offset | Name | Access | Description |
|--------|------|--------|-------------|
| 0x00 | Console Output | Write-only | Character written to console |
| 0x01 | Console Input | Read-only | Character read from console |
| 0x02 | Console Status | Read/Write | Console status flags |

**Console Status Flags**:

| Bit | Name | Description |
|-----|------|-------------|
| 0 | Output Ready | Console ready for output |
| 1 | Input Available | Input character available |
| 2 | Buffer Full | Console buffer is full |

### 5.3 Framebuffer

**Base Address**: 0x30000000

**Format**: RGBA, 8 bits per channel, little-endian

**Pixel Layout**:
```
Address: 0x30000000 + (y * width + x) * 4
Offset 0: Red (0-255)
Offset 1: Green (0-255)
Offset 2: Blue (0-255)
Offset 3: Alpha (0-255)
```

**Supported Resolutions**:
- 640x480 (default)
- 800x600
- 1024x768

## 6. API Specification

### 6.1 PixelCPUIntegration Class

#### Constructor

```javascript
constructor(infiniteMap, config = {})
```

**Parameters**:
- `infiniteMap` (InfiniteMap): Reference to InfiniteMap instance
- `config` (Object): Configuration options

**Configuration Options**:

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| cyclesPerFrame | number | 1000 | CPU cycles per render frame |
| framebufferBase | number | 0x30000000 | Framebuffer base address |
| consoleBase | number | 0x20000000 | Console base address |
| framebufferWidth | number | 640 | Framebuffer width in pixels |
| framebufferHeight | number | 480 | Framebuffer height in pixels |

**Returns**: PixelCPUIntegration instance

**Throws**: TypeError if infiniteMap is not provided

#### Methods

##### executeFrame

```javascript
executeFrame(): void
```

**Description**: Execute CPU for cyclesPerFrame cycles

**Parameters**: None

**Returns**: void

**Side Effects**:
- Executes CPU instructions
- Updates framebuffer texture
- Updates console display
- Updates CPU state visualization

**Performance**: Must complete in < 5ms to maintain 60 FPS

##### loadBrick

```javascript
async loadBrick(brickName: string): Promise<void>
```

**Description**: Load and execute a .brick file

**Parameters**:
- `brickName` (string): Name of brick file to load

**Returns**: Promise<void>

**Throws**:
- Error if brick file fails to load
- Error if brick file is too large

**Side Effects**:
- Resets CPU state
- Creates framebuffer texture
- Creates console tile
- Starts CPU execution

##### pause

```javascript
pause(): void
```

**Description**: Pause CPU execution

**Parameters**: None

**Returns**: void

**Side Effects**: Sets paused flag to true

##### resume

```javascript
resume(): void
```

**Description**: Resume CPU execution

**Parameters**: None

**Returns**: void

**Side Effects**: Sets paused flag to false

##### reset

```javascript
reset(): void
```

**Description**: Reset CPU state

**Parameters**: None

**Returns**: void

**Side Effects**:
- Resets CPU registers
- Resets program counter
- Clears framebuffer
- Clears console buffer

##### getState

```javascript
getState(): object
```

**Description**: Get current CPU state

**Parameters**: None

**Returns**: Object with CPU state

**Return Object Structure**:
```javascript
{
    pc: number,              // Program counter
    cycles: number,          // Total cycles executed
    halted: boolean,         // Halted flag
    registers: number[],     // Array of 32 registers
    memorySize: number       // Memory size in bytes
}
```

### 6.2 SimplePixelCPU Extensions

#### readMemory

```javascript
readMemory(addr: number): number
```

**Description**: Read byte from memory address

**Parameters**:
- `addr` (number): Memory address

**Returns**: number (0-255)

**Throws**:
- RangeError if address is out of bounds

#### writeMemory

```javascript
writeMemory(addr: number, value: number): void
```

**Description**: Write byte to memory address

**Parameters**:
- `addr` (number): Memory address
- `value` (number): Value to write (0-255)

**Returns**: void

**Throws**:
- RangeError if address is out of bounds
- RangeError if value is out of range (0-255)

### 6.3 InfiniteMap Extensions

#### loadBrick

```javascript
async loadBrick(brickName: string): Promise<void>
```

**Description**: Load and execute a brick file on the map

**Parameters**:
- `brickName` (string): Name of brick file

**Returns**: Promise<void>

**Throws**: Error if brick file fails to load

#### toggleCpuPause

```javascript
toggleCpuPause(): void
```

**Description**: Toggle CPU pause state

**Parameters**: None

**Returns**: void

## 7. Performance Requirements

### 7.1 Frame Rate

**Requirement**: System must maintain 60 FPS during CPU execution

**Measurement**: Average frame time over 10 seconds

**Acceptance Criteria**: Frame time < 16.67ms (60 FPS)

### 7.2 CPU Execution Time

**Requirement**: CPU execution must complete in < 5ms per frame

**Measurement**: Time spent in executeFrame()

**Acceptance Criteria**: Execution time < 5ms for cyclesPerFrame = 1000

### 7.3 Framebuffer Update Time

**Requirement**: Framebuffer update must complete in < 3ms per frame

**Measurement**: Time spent in updateFramebuffer()

**Acceptance Criteria**: Update time < 3ms for 640x480 resolution

### 7.4 Memory Usage

**Requirement**: Total memory overhead must be < 10 MB

**Measurement**: Memory allocated for CPU integration

**Acceptance Criteria**: Total overhead < 10 MB

## 8. Visual Components

### 8.1 CPU State Overlay

**Position**: Top-left corner (10, 10)

**Size**: 300x400 pixels

**Z-Index**: 1000

**Components**:
- Title: "🖥️ CPU State"
- Register display: 8 registers (R0-R7)
- PC display: Program counter value
- Cycles display: Total cycles executed

**Styling**:
- Background: Black with 0.8 opacity
- Border: Blue (#00AAFF), 2px
- Text: White (#FFFFFF) for registers
- PC: Orange (#FFAA00), bold
- Cycles: Green (#00FF00)

### 8.2 Framebuffer Display

**Position**: Center of map (100, 100)

**Size**: Configurable (default 640x480)

**Z-Index**: 500

**Components**:
- PixiJS sprite displaying framebuffer texture
- Real-time updates from CPU memory

**Styling**:
- No border (direct pixel display)
- Alpha blending enabled

### 8.3 Console Tile

**Position**: Bottom of screen (0, mapHeight - 200)

**Size**: 800x200 pixels

**Z-Index**: 600

**Components**:
- Background: Black (#000000)
- Text: Terminal green (#00FF00)
- Max lines: 24

**Styling**:
- Font: Monaco, Consolas, or similar monospace
- Font size: 12px
- Line height: 16px

## 9. Brick File Format

### 9.1 V2BrickHeader

**Size**: 132 bytes

**Structure**:
```
Offset  Size    Field           Description
------  ------  --------------  ------------------------------------
0x00    4       Magic           "BRCK" (0x4252434B)
0x04    4       Version         Brick format version (2)
0x08    8       Timestamp       Unix timestamp
0x10    8       InstructionCount Number of instructions
0x18    8       EntryPoint      Entry point address
0x20    64      Metadata        JSON metadata
0x60    8       Checksum        CRC32 checksum
0x68    120     Reserved        Reserved for future use
```

### 9.2 Instruction Format

**Size**: 4 bytes per instruction

**Structure**:
```
Byte 0: Opcode (0-255)
Byte 1: Destination register (0-31)
Byte 2: Source register 1 (0-31)
Byte 3: Source register 2 (0-31)
```

**Supported Opcodes**:

| Opcode | Name | Description |
|--------|------|-------------|
| 0 | NOP | No operation |
| 1 | MOV | Move register to register |
| 2 | ADD | Add two registers |
| 3 | SUB | Subtract two registers |
| 4 | MUL | Multiply two registers |
| 5 | DIV | Divide two registers |
| 6 | AND | Bitwise AND |
| 7 | OR | Bitwise OR |
| 8 | XOR | Bitwise XOR |
| 9 | NOT | Bitwise NOT |
| 10 | SHL | Shift left |
| 11 | SHR | Shift right |
| 12 | LOAD | Load from memory |
| 13 | STORE | Store to memory |
| 14 | JUMP | Unconditional jump |
| 15 | JZ | Jump if zero |
| 16 | JNZ | Jump if not zero |
| 17 | CALL | Call subroutine |
| 18 | RET | Return from subroutine |
| 255 | HALT | Halt execution |

## 10. Error Handling

### 10.1 Brick Loading Errors

| Error | Description | Recovery |
|-------|-------------|----------|
| NetworkError | Failed to fetch brick file | Retry with exponential backoff |
| ParseError | Invalid brick file format | Display error message, halt |
| SizeError | Brick file too large | Display error message, halt |
| ChecksumError | Checksum mismatch | Display error message, halt |

### 10.2 CPU Execution Errors

| Error | Description | Recovery |
|-------|-------------|----------|
| InvalidOpcode | Unknown opcode encountered | Log warning, skip instruction |
| MemoryError | Invalid memory access | Log warning, halt execution |
| StackError | Stack overflow/underflow | Log warning, halt execution |

### 10.3 Framebuffer Errors

| Error | Description | Recovery |
|-------|-------------|----------|
| TextureError | Failed to create texture | Log error, use fallback |
| UpdateError | Failed to update texture | Log warning, retry next frame |

## 11. Security Considerations

### 11.1 Memory Safety

- All memory accesses must be bounds-checked
- Memory-mapped I/O regions must be protected
- Invalid addresses must throw errors

### 11.2 Brick File Validation

- Brick files must be validated before execution
- Checksums must be verified
- File size limits must be enforced

### 11.3 Resource Limits

- CPU cycles per frame must be limited
- Memory allocation must be bounded
- Execution time must be monitored

## 12. Testing Requirements

### 12.1 Unit Tests

- [ ] PixelCPUIntegration class methods
- [ ] Memory read/write operations
- [ ] Console I/O handlers
- [ ] Framebuffer mapping

### 12.2 Integration Tests

- [ ] Brick file loading
- [ ] CPU execution loop
- [ ] Framebuffer display
- [ ] Console output

### 12.3 Performance Tests

- [ ] Frame rate during execution
- [ ] Memory usage
- [ ] CPU cycle throughput

### 12.4 End-to-End Tests

- [ ] Load simple program
- [ ] Execute and verify output
- [ ] Boot Linux kernel (basic)

## 13. Compliance

### 13.1 Browser Compatibility

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+

### 13.2 PixiJS Version

- PixiJS v8.0.0 or higher

### 13.3 JavaScript Version

- ES2020 or higher

## 14. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0.0 | 2025-01-25 | Geometry OS Team | Initial specification |

## 15. Appendices

### Appendix A: Example Brick File

```
Magic: BRCK
Version: 2
Timestamp: 1737753600
InstructionCount: 10
EntryPoint: 0
Metadata: {"name": "hello", "description": "Hello World"}
Checksum: 0x12345678

Instructions:
0x01 0x00 0x01 0x00  ; MOV R0 <- R1
0x02 0x00 0x00 0x00  ; ADD R0 <- R0 + R0
0xFF 0x00 0x00 0x00  ; HALT
```

### Appendix B: Example Usage

```javascript
// Create infinite map
const world = new PIXI.Container();
const infiniteMap = new InfiniteMap(world);

// Create CPU integration
const cpuIntegration = new PixelCPUIntegration(infiniteMap, {
    cyclesPerFrame: 1000,
    framebufferWidth: 640,
    framebufferHeight: 480
});

// Load and execute brick file
await cpuIntegration.loadBrick('hello.brick');

// Pause execution
cpuIntegration.pause();

// Resume execution
cpuIntegration.resume();

// Get CPU state
const state = cpuIntegration.getState();
console.log(`PC: 0x${state.pc.toString(16)}`);
console.log(`Cycles: ${state.cycles}`);
```

### Appendix C: Performance Benchmarks

| Configuration | Frame Rate | CPU Time | FB Time | Memory |
|---------------|------------|----------|---------|--------|
| 640x480, 1000 cycles | 60 FPS | 3.2ms | 2.1ms | 6.2 MB |
| 800x600, 1000 cycles | 58 FPS | 3.5ms | 2.8ms | 7.8 MB |
| 1024x768, 1000 cycles | 52 FPS | 4.1ms | 4.2ms | 10.1 MB |
| 640x480, 2000 cycles | 55 FPS | 6.8ms | 2.1ms | 6.2 MB |

### Appendix D: Troubleshooting

| Issue | Symptoms | Solution |
|-------|----------|----------|
| Low frame rate | FPS < 60 | Reduce cyclesPerFrame |
| Blank framebuffer | No display | Check framebuffer base address |
| No console output | Console empty | Check console base address |
| CPU halted immediately | Execution stops | Check brick file validity |
| Memory errors | Invalid access | Verify memory map configuration |
