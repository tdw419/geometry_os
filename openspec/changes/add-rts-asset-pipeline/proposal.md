# Proposal: Integrated Architectural Framework for Executable Metadata (.rts.png)

## Abstract
This proposal introduces a unified, self-describing asset architecture using the `.rts.png` file extension. The core innovation is binding executable logic (Lua/Python scripts) directly into the metadata chunks (`iTXt`, `zTXt`) of a visual asset (PNG). This ensures that the visual representation and the simulation logic are atomic, reducing "desyncs" and enabling "cartridge-like" portability for the Geometry OS / PixelRTS ecosystem.

## Motivation
Real-time strategy development faces challenges in maintaining synchronization between visual assets and their logic. By embedding code within the image:
1.  **Reliability**: $Reliability = 1 - Failure\_Probability$. Atomic assets eliminate "missing script" errors.
2.  **Portability**: A single file contains everything needed to run a unit/component.
3.  **Visual Debugging**: Textual overlays on the image provide immediate, human-readable status (Health, Version) without needing a separate editor.

## Proposed Architecture
1.  **Container**: PNG (Portable Network Graphics).
    - **Visuals**: `IDAT` chunks (Standard pixel data).
    - **Logic**: `iTXt` (International Text) or `zTXt` (Compressed Text) chunks.
2.  **Injector**: A Python-based tool (`rts_injector.py`) to:
    - Render status text onto the pixel buffer (using Pillow).
    - Inject script code into metadata chunks.
    - Sign the asset (CRC/Signature).
3.  **Loader**: A Rust-based engine module (`infinite_map_rs`) to:
    - Verify CRC.
    - Extract `RTS_Logic` chunk.
    - Execute logic in a sandboxed VM.

## Impact
- **Geometry OS**: Enables "Bootable Cartridges" (e.g. `antigravity.pixelrts.png`) to carry their own OS logic.
- **Community**: Users can share a single image that "comes alive" when dropped into the engine.

## References
- "Integrated Architectural Framework for Executable Metadata in Unified Real-Time Strategy Asset Formats" (User Request).
