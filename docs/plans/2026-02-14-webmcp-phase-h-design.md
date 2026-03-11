# WebMCP Phase H: WGPU Hypervisor — Design Document

**Date:** 2026-02-14
**Phase:** Phase H: WGPU Hypervisor (Pure Client-Side)
**Status:** Complete
**Depends On:** Phase F (AI-Driven Visual Builder)

---

## Overview

Phase H provides **pure client-side virtualization** using WebGPU compute shaders. No Python backend required - all execution happens in the browser GPU. This enables AI agents to boot Linux kernels, send input, read screen content, and manage virtual memory entirely from the browser.

**Paradigm:** "GPU-native virtualization, zero backend dependencies."

---

## Goals

1. **Browser-Native VMs** - Run RISC-V/Linux entirely in WebGPU
2. **Visual Feedback** - Capture and analyze VM framebuffer
3. **Input Control** - Send keyboard/mouse events to VM
4. **Memory Management** - Configure virtual memory (MMU) mappings
5. **AI Observability** - Enable AI agents to read screen content

---

## Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        WebMCP Bridge (JavaScript)                        │
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐│
│  │hypervisor_   │  │hypervisor_   │  │hypervisor_   │  │hypervisor_   ││
│  │    boot      │  │    input     │  │    frame     │  │  read_text   ││
│  └──────────────┘  └──────────────┘  └──────────────┘  └──────────────┘│
│                                                                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                   │
│  │hypervisor_   │  │hypervisor_   │  │hypervisor_   │                   │
│  │find_element  │  │set_page_table│  │  map_page    │                   │
│  └──────────────┘  └──────────────┘  └──────────────┘                   │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                     GPUExecutionSystem (JavaScript)                      │
│                                                                          │
│  ┌──────────────────────────────────────────────────────────────────┐   │
│  │                   WebGPU Compute Pipeline                         │   │
│  │                                                                   │   │
│  │   ┌─────────────────┐    ┌─────────────────┐                    │   │
│  │   │ visual_cpu_     │    │ system_memory   │                    │   │
│  │   │ riscv.wgsl      │    │   (64MB)        │                    │   │
│  │   │ (RISC-V CPU)    │    │                 │                    │   │
│  │   └─────────────────┘    └─────────────────┘                    │   │
│  │           │                       │                              │   │
│  │           ▼                       ▼                              │   │
│  │   ┌─────────────────┐    ┌─────────────────┐                    │   │
│  │   │ cpu_states      │    │ framebuffer     │                    │   │
│  │   │ (registers)     │    │ (video output)  │                    │   │
│  │   └─────────────────┘    └─────────────────┘                    │   │
│  │                                                                   │   │
│  └──────────────────────────────────────────────────────────────────┘   │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                         PixelRTS Cartridge                               │
│                                                                          │
│   ┌───────────────┐    ┌───────────────┐    ┌───────────────┐          │
│   │  Kernel       │    │  Disk Image   │    │  Metadata     │          │
│   │  (RISC-V)     │    │  (ext4)       │    │  (JSON)       │          │
│   │  .rts.png     │    │  .rts.png     │    │  embedded     │          │
│   └───────────────┘    └───────────────┘    └───────────────┘          │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## WebMCP Tools

### Tool H.1: `hypervisor_boot`

Boot a Linux kernel directly on the GPU using WebGPU.

**Input Schema:**
```json
{
  "kernel_url": {
    "type": "string",
    "description": "URL to the .rts.png kernel cartridge"
  },
  "memory_mb": {
    "type": "number",
    "description": "Memory size in MB (default 64)"
  },
  "mounts": {
    "type": "array",
    "items": {
      "type": "object",
      "properties": {
        "url": { "type": "string" },
        "path": { "type": "string" }
      }
    },
    "description": "List of files to mount into the virtual filesystem"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "status": "booted",
  "kernel": "alpine_linux.rts.png"
}
```

---

### Tool H.2: `hypervisor_input`

Send input events to the hypervisor via MMIO.

**Input Schema:**
```json
{
  "type": {
    "type": "string",
    "enum": ["keydown", "keyup", "mousemove", "mousedown", "mouseup"]
  },
  "key": {
    "type": "string",
    "description": "Key code for keyboard events"
  },
  "x": {
    "type": "number",
    "description": "X coordinate for mouse events"
  },
  "y": {
    "type": "number",
    "description": "Y coordinate for mouse events"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "event_processed": true
}
```

---

### Tool H.3: `hypervisor_frame`

Capture the current framebuffer as a base64 PNG.

**Input Schema:**
```json
{
  "kernel_id": {
    "type": "string",
    "description": "Kernel instance ID (default: main_cpu)"
  },
  "format": {
    "type": "string",
    "enum": ["png", "rgba", "bytes"],
    "description": "Output format (default: png)"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "width": 640,
  "height": 480,
  "data": "data:image/png;base64,...",
  "timestamp": 1707926400000
}
```

---

### Tool H.4: `hypervisor_read_text`

Read text from the framebuffer using OCR.

**Input Schema:**
```json
{
  "kernel_id": {
    "type": "string",
    "description": "Kernel instance ID (default: main_cpu)"
  },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    },
    "description": "Region to read (default: full screen)"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "text": "root@alpine:~# ",
  "confidence": 0.95
}
```

---

### Tool H.5: `hypervisor_find_element`

Find UI elements on screen by visual characteristics.

**Input Schema:**
```json
{
  "kernel_id": {
    "type": "string",
    "description": "Kernel instance ID (default: main_cpu)"
  },
  "element_type": {
    "type": "string",
    "enum": ["button", "text", "input", "window", "icon"],
    "description": "Type of element to find"
  },
  "text_pattern": {
    "type": "string",
    "description": "Text content to match (optional)"
  },
  "color": {
    "type": "string",
    "description": "Expected color (hex format, optional)"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "elements": [
    {
      "type": "button",
      "text": "Submit",
      "bounds": {"x": 100, "y": 200, "width": 80, "height": 30},
      "confidence": 0.92
    }
  ],
  "count": 1
}
```

---

### Tool H.6: `hypervisor_set_page_table`

Configure the MMU page table root (satp CSR).

**Input Schema:**
```json
{
  "kernel_id": {
    "type": "string",
    "description": "Kernel instance ID (default: main_cpu)"
  },
  "root_pa": {
    "type": "string",
    "description": "Physical address of page table root (hex format)"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "satp": "0x8030000",
  "mode": "Sv32",
  "root_ppn": "0x3000"
}
```

---

### Tool H.7: `hypervisor_map_page`

Create a page table entry mapping virtual to physical address.

**Input Schema:**
```json
{
  "kernel_id": {
    "type": "string",
    "description": "Kernel instance ID (default: main_cpu)"
  },
  "va": {
    "type": "string",
    "description": "Virtual address (hex format)"
  },
  "pa": {
    "type": "string",
    "description": "Physical address (hex format)"
  },
  "flags": {
    "type": "number",
    "description": "Page flags (R=1, W=2, X=4, U=8). Example: 7 for RWX"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "va": "0x80000000",
  "pa": "0x00000000",
  "pte": "0x00000007",
  "pte_addr": "0x03000000",
  "description": "Mapped VA 0x80000000 -> PA 0x00000000"
}
```

---

## Memory Layout

### Physical Memory (64MB)

```
┌─────────────────────────────────────────────────────────────────┐
│ 0x00000000 - 0x00FFFFFF  (16MB)  Kernel Code + Data            │
│ 0x01000000 - 0x01FFFFFF  (16MB)  Framebuffer (Video)           │
│ 0x02000000 - 0x02FFFFFF  (16MB)  MMIO Region (Input/Devices)  │
│ 0x03000000 - 0x03FFFFFF  (16MB)  Page Tables + User Memory    │
└─────────────────────────────────────────────────────────────────┘
```

### Virtual Address Space (Sv32)

```
┌─────────────────────────────────────────────────────────────────┐
│ 0x00000000 - 0x7FFFFFFF  (2GB)   User Space                    │
│ 0x80000000 - 0xFFFFFFFF  (2GB)   Kernel Space                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Usage Examples

### Boot and Interact with Linux

```javascript
// Boot Alpine Linux
await hypervisor_boot({
    kernel_url: 'https://example.com/alpine.rts.png',
    memory_mb: 64
});

// Wait for boot
await new Promise(r => setTimeout(r, 3000));

// Read terminal output
const screen = await hypervisor_read_text({});
console.log(screen.text); // "root@alpine:~# "

// Type a command
await hypervisor_input({ type: 'keydown', key: 'l' });
await hypervisor_input({ type: 'keydown', key: 's' });
await hypervisor_input({ type: 'keydown', key: 'Enter' });

// Capture screenshot
const frame = await hypervisor_frame({});
```

### Configure Virtual Memory

```javascript
// Set up page table root
await hypervisor_set_page_table({
    kernel_id: 'main_cpu',
    root_pa: '0x03000000'
});

// Map virtual page to physical
await hypervisor_map_page({
    va: '0x80000000',
    pa: '0x00000000',
    flags: 7  // RWX
});
```

---

## Files

| File | Description |
|------|-------------|
| `webmcp_bridge.js` | Phase H tool registrations (7 tools) |
| `gpu_execution_system.js` | WebGPU compute pipeline manager |
| `shaders/visual_cpu_riscv.wgsl` | RISC-V CPU compute shader |
| `docs/plans/2026-02-13-wgpu-linux-hypervisor-mmu.md` | MMU implementation plan |

---

## Success Criteria

| # | Criteria | Status |
|---|----------|--------|
| 1 | Hypervisor boots Linux kernel | ✅ |
| 2 | Framebuffer capture works | ✅ |
| 3 | Input events reach VM | ✅ |
| 4 | OCR text extraction works | ✅ |
| 5 | MMU tools functional | ✅ |
| 6 | No Python backend required | ✅ |

---

## Future Enhancements

1. **hypervisor_status** - Get current VM state (running, halted, memory usage)
2. **hypervisor_pause/resume** - Pause and resume VM execution
3. **hypervisor_snapshot** - Save/restore VM state
4. **hypervisor_network** - Virtual network interface
5. **Multi-VM support** - Run multiple VMs simultaneously
