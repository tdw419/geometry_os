# Design: Pixel-Native App Architecture

## MORPHOLOGY: The Living Brick
The `.rts.png` file structure:

[ PNG HEADER ]
[ IDAT CHUNKS (Visual Image) ]
[ tEXt CHUNK (Metadata: "geometry_os_manifest") ]
[ zTXt CHUNK (Compressed Payload: App Code / Overlay) ]
[ PNG END ]

## EXECUTION FLOW: "Possession"

1. **DORMANT STATE (Static)**
   - File sits on desktop.
   - Renderer draws the IDAT image (the "cover art").
   - Resources: 0 CPU, 0 RAM.

2. **AWAKENING (User Click)**
   - Hypervisor reads `geometry_os_manifest` from PNG.
   - Allocates a "Micro-Container" (Namespace or QEMU-Lite).
   - Mounts `geometry_os_kernel.rts` (Read-only System).
   - Mounts `app.payload` (Read-write App State).
   - Boots entry point.

3. **POSSESSION (Live)**
   - App renders its framebuffer.
   - Geometry OS Compositor PIPES this framebuffer directly into the Texture Memory of the icon.
   - The "Icon" comes alive and animates.

## VISUAL LANGUAGE
- **Dormant**: Dim, static, glass-like reflection.
- **Booting**: Pulse animation on the icon border.
- **Active**: Full brightness, live video feed of the app.
