# Palace Transport Layer - Phase 0.A Complete

## Status: DONE ✓

## What We Built

A binary-to-pixel encoding/decoding system that can store arbitrary data (kernels, initramfs, etc.) in the Memory Palace using the Raw Spatial (RTS) format.

## Format Specification

### Encoding (PALACE_WRITE)
- Each 256×256 PNG image = 65536 pixels = 262,144 bytes
- Each pixel stores 32 bits of big-endian data: `[R][G][B][A]`
- RGBA byte order: R=bits 31:24, G=bits 23:16, B=bits 15:8, A=bits 7:0
- All 4 bytes are preserved (alpha channel stores actual data, not forced opaque)
- Trailing bytes padded with zeros to fill final entry
- Manifest tracks checksum, entry count, byte count

### Capacity
- Single palace entry: 262,144 bytes (256KB)
- For a 5MB kernel: 20 entries
- For a 7MB kernel + 2MB initramfs: 35 entries

## API

### Write Binary to Palace
```bash
python3 palace_transport.py write <binary_file> <palace_name>

# Example: Store Linux kernel
python3 palace_transport.py write vmlinux linux_kernel
python3 palace_transport.py write initramfs.cpio.gz linux_initramfs
```

### Load Binary from Palace
```bash
python3 palace_transport.py load <palace_name> <output_file>

# Example: Recover Linux kernel
python3 palace_transport.py load linux_kernel /tmp/recovered_vmlinux
```

### Test Roundtrip
```bash
python3 palace_transport.py test [size_mb]

# Default 5MB test
python3 palace_transport.py test 5
```

## Test Results

### 5MB Roundtrip Test
- Status: PASS ✓
- Byte-for-byte match: YES
- Checksum verified: YES
- 20 palace entries generated (262,144 bytes each)
- SHA256: `a5d11f2dd95e3dc60abf95d4e454302113526fb71a9beb60925b6e2053381e3c`

### 3MB Real Data Test
- Status: PASS ✓
- Checksum verified: YES
- 12 palace entries generated
- SHA256: `1e48f258027a27d79a239023bd77b2aa56abd56f3f18b2a5604667d6a4dbeb49`

## Manifest Format

```json
{
  "palace_name": {
    "source_file": "/path/to/original.bin",
    "total_bytes": 5242880,
    "checksum": "sha256_hash",
    "num_entries": 20,
    "bytes_per_entry": 262144,
    "timestamp": 1716601234
  }
}
```

Stored at: `programs/palace_manifest.json`

## File Naming Convention

```
palace_<name>_<idx:03d>.png

Example:
  palace_linux_kernel_000.png
  palace_linux_kernel_001.png
  ...
  palace_linux_kernel_019.png
```

## Key Properties

### Why This Is Safe (No Execution Required)
1. Pure byte-level encoding/decoding
2. No assembly, no opcodes, no GeOS internals
3. Simple checksum verification proves correctness
4. Deterministic: same input = same pixels every time

### What We Test
- Roundtrip correctness (checksum comparison)
- Byte-for-byte exact match
- Multi-entry handling (20+ files for 5MB kernel)
- Padding handling
- Manifest integrity

### What We Don't Test (Yet)
- Loading into GeOS RAM (Phase 0.B)
- Hypervisor booting (Phase 0.C)
- Integration (Phase 0.D)

## Storage Requirements

### Original Data
- 5MB Linux kernel → 5MB on disk

### Palace Storage
- 5MB Linux kernel → 20 PNG files × 257KB each = 5.14MB on disk
- Overhead: ~3% (PNG compression + headers)

This is acceptable. Palace stores data visually, so overhead is expected.

## Next Steps (Phase 0.B)

Phase 0.A is complete and verified. Next:

Phase 0.B: Execute from RAM (1-2h, no Palace)
- Build tiny RISC-V ELF "hello world" (1KB)
- Load directly into GeOS RAM at 0x8000_0000
- Execute via mcp_geo_riscv_run (we already have this!)
- Debug with existing tools: vm_registers, screen_ascii, screenshot

This gives us a working RAM execution path that we can later hook Palace data into.

## Implementation

File: `palace_transport.py`
- Lines: ~350
- Dependencies: Pillow (PNG I/O), hashlib, json
- Entry points: write(), load(), test_roundtrip()
- No GeOS dependencies
- Pure Python, easy to debug

## Why Raw Spatial (Not Pixelpack)?

We chose the Raw Spatial (RTS) format because:
1. Simplicity: Each pixel = exactly 32 bits of data
2. Transparency: No compression, no strategy decoding
3. Phase 0.A is about STORAGE, not COMPRESSION
4. Compression strategies (Pixelpack) can be added later in Phase 1+

The `.rts.png` format is essentially a raw RAM dump in pixel form.

---

Phase 0.A Complete. Ready to proceed with Phase 0.B?