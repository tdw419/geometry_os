# Design: Linux PixelRTS Embedding

## Architecture
1.  **Base System**: Tiny Core Linux (Minimal, runs in RAM).
2.  **Payload**: 
    - `vmlinuz64`: Kernel (extracted from ISO).
    - `corepure64.gz`: Initrd (remastered).
    - `/opt/antigravity`: Vectorland daemon code injected into Initrd.
3.  **Container**: PixelRTS v2 (Grid-mapped RGBA).

## Remastering Pipeline
1.  **Extract**: `7z x tiny_core.iso`
2.  **unpack**: `zcat corepure64.gz | cpio -i`
3.  **Inject**: Copy `systems/vectorland` -> `rootfs/opt/antigravity`
4.  **Configure**: Add startup script to `/opt/bootlocal.sh`
5.  **Repack**: `find . | cpio -o | gzip > antigravity_core.gz`
6.  **Encode**: PixelRTS v2 packing.

## Boot Process
1.  **Host**: Infinite Map / Pixel CPU reads PNG.
2.  **Extract**: Decodes Hilbert pixels -> `vmlinuz` + `antigravity_core.gz`.
3.  **Execution**: Spawns `qemu-system-x86_64 -kernel vmlinuz -initrd antigravity_core.gz`.

## Geometric Integrity
- **Hilbert Mapping**: Preserves code locality in 2D space.
- **Entropy**: Encrypted/Compressed binary data looks like "static" or "rock" texture, appropriate for a customized OS.
