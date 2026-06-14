# Milestone: Memory Scaling (Phase T)

**Date:** May 22, 2026
**Status:** Verified

## Overview
Phase T implements hardware-backed paging for Geometry OS, allowing processes to access the vast 1GB+ Active Substrate (VAST) through a 64KB RAM window. This is achieved via the `BANK` instruction, which swaps 4KB chunks (64x64 pixels) between the substrate and RAM.

## Changes
- **New Instruction:** `BANK coord_reg, dest_addr` (Opcode `0x2C`).
  - `coord_reg`: Register containing packed chunk coordinates (`0xXXXXYYYY`).
  - `dest_addr`: Base RAM address where the 4096-cell chunk will be mapped.
- **Assembler Support:** Added `BANK` mnemonic and `.bank` directive.
- **VM Implementation:**
  - Integrated with `TileStore` for high-performance chunk retrieval.
  - Added support to `icache` and `disasm`.
  - Fixed initial opcode collision (reassigned from `0x24` to `0x2C`).

## Verification
- **Unit Tests:** `test_bank_opcode` in `src/vm/ops_memory.rs` verifies correct data swap.
- **Integration:** Successfully tested with `mandelbrot_zoom` to verify sliding window access to infinite detail.
- **Disassembly:** Verified correct instruction decoding and string representation.

## Next Steps
- Implement `Area Agent` swarms to manage autonomous substrate regions.
- Optimize chunk swapping with a LRU cache in `TileStore`.
