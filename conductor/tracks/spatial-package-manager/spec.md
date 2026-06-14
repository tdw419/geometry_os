# Phase S: Spatial Package Manager (Specification)

## Overview
The Spatial Package Manager (SPM) enables modularity within the Geometry OS computational substrate. It allows developers to export verified substrate regions as '.rts.png' packages and share them via a central registry.

## Goals
- **Circuit Portability:** Export/Import 32-bit geometric bytecode with zero data loss.
- **Ecosystem Growth:** Establish a registry of standard spatial components (ALU, Memory, Neural Layers).
- **Infinite map Integration:** Paste packages at arbitrary Hilbert coordinates.

## Architecture

### 1. RTS Container Format (.rts.png)
- **Engine:** Standard PNG (32-bit RGBA).
- **Mapping:**
  - Red: Taxonomy (Bits 28-31) + Direction (Bits 24-27).
  - Green: Weight / Color High (Bits 16-23).
  - Blue: Color Mid (Bits 8-15).
  - Alpha: Threshold / Color Low (Bits 0-7).
- **Verification:** Metadata chunk (optional) containing SHA256 of raw bytecode.

### 2. Spatial Registry (registry.json)
A central catalog of verified circuits:
```json
{
  "packages": [
    {
      "name": "math/add24",
      "version": "1.0.0",
      "path": "packages/add24.rts.png",
      "description": "24-bit synchronous spatial adder."
    },
    {
      "name": "neural/xor_gate",
      "version": "1.0.0",
      "path": "packages/xor_gate.rts.png",
      "description": "Pre-trained 2-layer XOR neural network."
    }
  ]
}
```

### 3. Shell Commands
- `export <filename>`: Dumps the current active substrate to a 32-bit PNG.
- `import <filename>`: Loads a PNG into the active substrate.
- `install <pkg_name>`: (Future) Downloads from registry.

## Verification Path
1.  Train a circuit (e.g. AND gate).
2.  `export and_gate.rts.png`.
3.  `clear` substrate.
4.  `import and_gate.rts.png`.
5.  `pulse` to verify execution continues correctly.
