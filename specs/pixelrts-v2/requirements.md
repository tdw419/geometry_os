---
spec: pixelrts-v2
phase: requirements
created: 2026-02-08T20:00:00Z
generated: auto
---

# Requirements: PixelRTS v2

## Summary

PixelRTS v2 shall encode arbitrary binary data into PNG images using RGBA dense packing with Hilbert space-filling curve mapping, supporting Standard (OS images) and Code (WASM semantic visualization) modes, fully integrated into Geometry OS pixel_compiler workflow.

## User Stories

### US-1: Convert Binary to Visual Container
As a **system builder**, I want to convert any binary file to a `.rts.png` image so that I can distribute OS images and tools as viewable PNG files.

**Acceptance Criteria**:
- AC-1.1: Converter CLI accepts input binary and output PNG paths
- AC-1.2: PNG dimensions are power-of-2 (auto-calculated)
- AC-1.3: Data integrity verified via round-trip conversion
- AC-1.4: Metadata embedded in PNG tEXt chunk
- AC-1.5: Sidecar `.meta.json` file generated for redundancy

### US-2: Extract Binary from Visual Container
As a **system operator**, I want to extract the original binary from a `.rts.png` file so that I can boot the OS image.

**Acceptance Criteria**:
- AC-2.1: Extractor CLI recovers exact original data
- AC-2.2: SHA256 hash verification against metadata
- AC-2.3: `--info` flag displays container metadata
- AC-2.4: Graceful error handling for invalid PNG files

### US-3: Boot Visual Container
As a **end user**, I want to boot a `.rts.png` file directly so that I don't need manual extraction steps.

**Acceptance Criteria**:
- AC-3.1: Auto-generated `.boot.sh` script for QEMU/KVM
- AC-3.2: Boot script extracts and launches in one command
- AC-3.3: Support for kernel and OS cartridge types
- AC-3.4: RTS registry recognizes `.rts.png` cartridges

### US-4: Visualize WASM Code
As a **developer**, I want to convert WASM modules to `.rts.png` with semantic coloring so that I can visually inspect code structure.

**Acceptance Criteria**:
- AC-4.1: Code mode applies opcode-aware coloring
- AC-4.2: Control flow opcodes rendered in "hot" colors (high red)
- AC-4.3: Memory operations rendered in "cool" colors (high blue)
- AC-4.4: Round-trip preserves original WASM bytes

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Generate Hilbert curve LUT for power-of-2 grids | Must | US-1 |
| FR-2 | Encode binary data to RGBA pixels (4 bytes/pixel) | Must | US-1 |
| FR-3 | Decode RGBA pixels to binary data | Must | US-2 |
| FR-4 | Embed metadata in PNG tEXt chunk | Must | US-1 |
| FR-5 | Generate sidecar `.meta.json` file | Should | US-1 |
| FR-6 | Calculate auto grid size from data length | Must | US-1 |
| FR-7 | Verify SHA256 hash of extracted data | Should | US-2 |
| FR-8 | Apply WASM semantic coloring in code mode | Should | US-4 |
| FR-9 | Generate QEMU boot script | Should | US-3 |
| FR-10 | Register `.rts.png` in RTS registry | Must | US-3 |
| FR-11 | Auto-extract `.rts.png` in boot manager | Must | US-3 |
| FR-12 | NumPy vectorized encoding for performance | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Encode 10MB file in <10 seconds | Performance |
| NFR-2 | Decode 10MB file in <10 seconds | Performance |
| NFR-3 | Support grid sizes up to 8192×8192 (256MB) | Capacity |
| NFR-4 | 100% data integrity on round-trip | Reliability |
| NFR-5 | CLI tools follow existing pixel_compiler patterns | Usability |
| NFR-6 | Test coverage >90% for core library | Quality |
| NFR-7 | Compatible with existing RTS registry | Integration |

## Out of Scope

- Progressive loading (streaming decode)
- Compression (DEFLATE, LZMA)
- WebGPU shader for GPU-side decoding
- Web-based viewer for `.rts.png` files
- Support for non-power-of-2 grid sizes
- Multi-segment PNG files (single binary per PNG)

## Dependencies

- **Python 3.12+**: Core runtime
- **Pillow (PIL)**: PNG encoding/decoding with tEXt chunk support
- **NumPy**: Vectorized pixel operations for performance
- **PyYAML**: Metadata handling
- **pytest**: Test framework
- **Existing pixel_compiler components**: rts_registry_manager.py, rts_boot_manager.py

## Data Dictionary

| Field | Type | Description |
|-------|------|-------------|
| `format` | string | "PixelRTS-2.0" |
| `version` | int | Format version (2) |
| `grid_size` | int | PNG dimension (power-of-2) |
| `encoding.type` | string | "RGBA-dense" or "RGBA-code" |
| `encoding.bytes_per_pixel` | int | Always 4 |
| `encoding.mapping` | string | "Hilbert space-filling curve" |
| `offsets` | dict | Segment metadata (name, type, sha256) |
| `hashes` | dict | SHA256 hashes by segment name |

## Capacity Matrix

| Grid Size | Capacity | Max File Size |
|-----------|----------|---------------|
| 64×64 | 16 KB | 16,384 bytes |
| 128×128 | 64 KB | 65,536 bytes |
| 256×256 | 256 KB | 262,144 bytes |
| 512×512 | 1 MB | 1,048,576 bytes |
| 1024×1024 | 4 MB | 4,194,304 bytes |
| 2048×2048 | 16 MB | 16,777,216 bytes |
| 4096×4096 | 64 MB | 67,108,864 bytes |
| 8192×8192 | 256 MB | 268,435,456 bytes |
