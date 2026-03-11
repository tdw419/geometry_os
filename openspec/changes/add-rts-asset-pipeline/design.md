# Design: Visual & Geometric Impact of RTS Assets

## Morphological Shift
The adoption of `.rts.png` changes the nature of assets from "passive textures" to "active cartridges".

### Visual Layering
- **Typography**: Text should be rendered directly onto the texture using high-contrast fonts (e.g., "Terminus" or "Roboto Mono").
- **Effects**:
    - **Drop Shadows**: Essential for legibility against chaotic game textures. $\Delta x, \Delta y$ offsets.
    - **Glows**: Gaussian blur layers to denote "active" or "powered" states.
    - **Data Viz**: Health bars or version numbers rendered effectively "baked" into the icon.

### Geometric Integrity
- **PAS Score**: Negligible impact. The metadata is invisible to the rendering pipeline (PAS neutral).
- **Texture Power**: Textures remain Power-of-Two (POT) friendly (e.g., 256x256, 4096x4096).
- **Hilbert Mapping**: The injector must preserve strict pixel alignment if the asset is a Memory Map.

## User Experience
- **"The Cartridge Metaphor"**: Users perceive the PNG as a physical object.
- **Drag & Drop**: Dropping the PNG into the window immediately executes the `RTS_Logic`.
