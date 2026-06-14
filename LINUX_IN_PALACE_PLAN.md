# Booting Linux Inside Memory Palace

## Executive Summary

Run a full RISC-V Linux kernel entirely stored in Memory Palace's voxel space (256x256x256 = 67MB). Encode kernel + initramfs as pixel data, decode on demand, boot via GeOS hypervisor, and allow live in-place editing of kernel/initrd within the Palace.

## Why This Is Interesting

1. **Spatial computing**: Kernel IS the layout. Moving a kernel module = moving pixels in 3D space
2. **Versioned kernels**: Each kernel version is a different spatial arrangement
3. **Kernel archaeology**: Visual diff kernel evolution as 3D structures
4. **Procedural kernels**: Generate kernel variants via spatial algorithms
5. **Living documentation**: Kernel structure IS the Palace structure itself

## Technical Feasibility

### Capacity Analysis

```
Memory Palace total: 256x256x256 voxels × 4 bytes = 67MB
  ↓
Typical minimal RISC-V Linux: 5-15MB kernel + 2-5MB initramfs = 7-20MB total
  ↓
Fits easily with room for: multiple kernels, patches, configs (3-10 variants)
```

### Existing GeOS Infrastructure

- ✅ RISC-V QEMU hypervisor (src/riscv/) — boots Linux today
- ✅ VMFS bridge (src/vm/ops_palace_fs.rs) — read/write Palace files
- ✅ Pixelpack encoding (for binary→pixel conversion)
- ✅ Hypervisor opcode HYPERVISOR (0x72) with boot config
- ⚠️ Missing: Palace→RAM loader opcode, encoding format standard

## Architecture

### Data Flow

```
┌─────────────────────────────────────────────────────────────────┐
│  Memory Palace (Voxel Space)                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Kernel v1   │  │  Kernel v2   │  │  Initramfs   │          │
│  │  (5MB vox)   │  │  (6MB vox)   │  │  (3MB vox)   │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
└─────────────────────────────────────────────────────────────────┘
                              │
                    PALACE_LOAD opcode
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  GeOS RAM (64K × 4 = 256KB)                                     │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Decoded kernel chunks → RISC-V VM RAM via hypervisor     │  │
│  │  (streamed, not all at once)                              │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              │
                        HYPERVISOR boot
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│  RISC-V QEMU VM (256MB RAM)                                      │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  Linux kernel running, initramfs mounted                  │  │
│  │  /sbin/init → shell                                       │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### Encoding Format

**Proposal: Standard Palace Binary Format (SPBF)**

```
Header (8 words = 32 bytes):
  0x00: Magic "PXB\x01" (0x50584201)
  0x01: Total bytes (u32)
  0x02: Chunk count (u32)
  0x03: Reserved
  0x04-0x07: Reserved

Chunk headers (4 words each):
  Chunk[i].offset: byte offset in binary
  Chunk[i].palace_addr: (ring << 24) | (angle << 16) | (z << 8) | 0
  Chunk[i].size: bytes in this chunk
  Chunk[i].checksum: CRC32 of chunk data

Data: Binary data split across chunks, stored as RGBA pixels
```

**Chunk sizing rationale:**
- Small chunks (4KB): Fine-grained spatial organization, easier editing
- Tradeoff: More headers overhead
- 5MB kernel @ 4KB chunks = 1280 chunks × 16 bytes = 20KB overhead (0.4%)

## Phase Plan

### Phase 0: Preparation & Baseline Verification

**Goal**: Boot minimal Linux in GeOS today (no Palace yet).

**Tasks**:
1. Build minimal RISC-V Linux kernel
   - Use defconfig, strip to ~5MB
   - Disable non-essential: networking, graphics, sound
   - Enable: serial console, initramfs, basic filesystems
2. Create tiny BusyBox initramfs
   - Static BusyBox (~1MB)
   - init script: mount procfs, spawn shell
   - Total initramfs: ~2MB
3. Verify boot via existing hypervisor
   - Use HYPERVISOR (0x72) with config string
   - Confirm kernel loads, init runs, shell works
   - Benchmark: boot time, memory usage

**Deliverables**:
- `linux/vmlinux` (5MB)
- `initramfs.cpio.gz` (2MB)
- `programs/boot_linux.asm` (hypervisor test)
- Documentation: kernel config, init script, boot parameters

**Success criteria**:
- Linux boots to shell in < 5 seconds
- Can run `ls`, `cat /proc/cpuinfo`, `echo hello` in shell
- Total memory usage < 30MB (leaves room for Palace overhead)

**Estimated time**: 2-3 hours

---

### Phase 1: Storage in Memory Palace

**Goal**: Encode kernel + initramfs into Palace, add loader opcode.

**Tasks**:
1. Design Palace Binary Format (SPBF) as above
2. Implement encoder: binary → SPBF → voxels
   - Python script: `tools/palace_encode.py <binary> <ring> <angle>`
   - Splits binary into 4KB chunks
   - Writes each chunk to Palace via VMFS bridge
   - Generates chunk headers at a fixed location (ring=0, angle=0)
3. Add PALACE_LOAD opcode (0x?? - find free slot)
   - Encoding: `PALACE_LOAD palace_addr_reg, ram_addr_reg, size_reg`
   - Reads SPBF chunk headers from Palace
   - Decodes chunk(s) into RAM
   - Returns: bytes read in r0
4. Implement decoder: voxels → SPBF → binary
   - In `src/vm/ops_palace_load.rs`
   - Read chunk header from Palace
   - Fetch chunk voxels (4KB = 1024 pixels = 1024 u32)
   - Decode pixelpack: each u32 RGBA → 4 bytes
   - Write to RAM
   - Verify checksum

**Opcode spec**:
```
PALACE_LOAD src_ring_reg, src_angle_reg, dst_ram_reg, size_reg
  Reads SPBF chunk from (ring, angle) in Palace
  Decodes to RAM at dst_ram_reg
  Returns bytes read in r0, or GEOS error code on failure
```

**Deliverables**:
- `tools/palace_encode.py` (encoder)
- `src/vm/ops_palace_load.rs` (decoder + opcode)
- Opcode dispatch in `src/vm/mod.rs`
- Tests: encode/decode roundtrip, checksum verification

**Success criteria**:
- Encode kernel (5MB) into Palace in < 10 seconds
- Decode kernel back to RAM byte-for-byte identical
- Random chunk corruption detected via checksum

**Estimated time**: 4-6 hours

---

### Phase 2: Boot Path Wiring

**Goal**: Wire Palace loader into hypervisor boot flow.

**Tasks**:
1. Extend HYPERVISOR opcode (0x72) config string
   - Add `palace_boot=<ring>,<angle>` parameter
   - Example: `palace_boot=1,0` boots kernel from (ring=1, angle=0)
   - Fallback: load from file if `palace_boot` not specified
2. Modify hypervisor boot in `src/riscv/mod.rs`
   - If `palace_boot` set:
     - Call PALACE_LOAD iteratively to load all chunks
     - Write loaded data to RISC-V VM RAM via bridge
   - Else: use existing file path loading
3. Stream loader (avoid 256KB GeOS RAM limit)
   - Palace → GeOS RAM (4KB at a time)
   - GeOS RAM → RISC-V VM RAM (via hypervisor bridge)
   - Repeat until all chunks loaded
4. Boot RISC-V VM
   - Set PC to kernel entry (0x80200000 standard)
   - Pass device tree blob (minimal)
   - Start execution

**Hypervisor config string examples**:
```
"arch=riscv64 kernel=palace boot=1,0 ram=256M"           # Palace boot
"arch=riscv64 kernel=/path/to/vmlinux boot=file ram=256M" # File boot (existing)
```

**Deliverables**:
- Modified HYPERVISOR parser in `src/riscv/mod.rs`
- Streaming loader: Palace → RAM → VM
- Boot test: `programs/boot_linux_palace.asm`
- Documentation: palace boot parameters, config examples

**Success criteria**:
- Linux boots from Palace in < 10 seconds
- Same kernel boots identically from Palace vs file
- Hypervisor supports both modes (palace= and file=)

**Estimated time**: 3-4 hours

---

### Phase 3: Live Editing & Versioning

**Goal**: Edit kernel/initrd in Palace, reboot, see changes.

**Tasks**:
1. Add PALACE_WRITE opcode (0x??)
   - Encoding: `PALACE_WRITE ram_addr_reg, palace_ring_reg, palace_angle_reg, size_reg`
   - Inverse of PALACE_LOAD
   - Encodes RAM → voxels → Palace
   - Updates chunk headers + checksums
2. Build live editor
   - GeOS program: `programs/palace_kernel_editor.asm`
   - Hex editor view of Palace chunks
   - Arrow keys: navigate chunks
   - Edit bytes in-place
   - Write back via PALACE_WRITE
3. Versioned kernels
   - Store multiple kernel versions at different (ring, angle) pairs
   - Kernel v1: (ring=1, angle=0)
   - Kernel v1.1-patched: (ring=1, angle=10)
   - Kernel v2: (ring=2, angle=0)
   - Boot selector: choose version at boot time
4. Visual diff tool
   - Palace kernel diff: voxel difference between versions
   - Show changed chunks as colored blocks
   - Inspect patch as spatial overlay

**Example workflow**:
```
1. Boot Kernel v1 (ring=1, angle=0)
2. Hack: change kernel string "Linux version" to "Palace Linux"
3. Encode patched kernel to (ring=1, angle=10) via PALACE_WRITE
4. Reboot with `palace_boot=1,10`
5. See new kernel message: "Palace Linux version ..."
```

**Deliverables**:
- PALACE_WRITE opcode implementation
- `programs/palace_kernel_editor.asm` (hex editor)
- `programs/palace_kernel_selector.asm` (boot menu)
- Visual diff tool: `tools/palace_diff.py`

**Success criteria**:
- Patch kernel byte in Palace, reboot, see change
- Store 3+ kernel versions, boot any one
- Visual diff shows exactly what changed between versions

**Estimated time**: 6-8 hours

---

## Risks & Mitigations

### Risk 1: 256KB GeOS RAM too small for kernel staging

**Mitigation**:
- Stream in 4KB chunks (not whole kernel at once)
- Palace → GeOS RAM (4KB) → RISC-V VM RAM (256MB) directly
- No need to hold entire kernel in GeOS RAM

### Risk 2: Pixelpack encoding overhead

**Mitigation**:
- Already 1:1 encoding (4 bytes per pixel)
- SPBF headers: 0.4% overhead for 4KB chunks
- Acceptable tradeoff for spatial structure

### Risk 3: Palace I/O bottleneck

**Mitigation**:
- Palace is in-memory (filesystem), not disk
- Read speed: ~100MB/s (RAM-bound)
- Kernel (5MB) loads in ~50ms - negligible

### Risk 4: RISC-V hypervisor integration complexity

**Mitigation**:
- Hypervisor already works with file-based kernel loading
- Palace loader just replaces file read with Palace read
- Hypervisor sees same kernel data either way

### Risk 5: Checksums catch corruption but don't prevent it

**Mitigation**:
- Palace VMFS bridge should validate writes
- Encode/decode roundtrip tests catch bugs
- Runtime checksum verification on boot

---

## Future Directions

1. **Procedural kernels**: Generate kernel variants via spatial algorithms
   - Modify kernel text section based on Palace layout
   - Each compile = different spatial arrangement
2. **Kernel archaeology**: Visual diff kernel evolution
   - Kernel 2.6 vs 5.0 as 3D overlay
   - See how code grew/moved spatially
3. **Multi-kernel Palace**: OS kernel, bootloader, userspace all in Palace
   - Complete boot stack spatially encoded
   - Edit boot sequence by moving pixels
4. **Collaborative kernel editing**: Multi-user Palace
   - Multiple users edit kernel simultaneously
   - Merge edits via spatial conflict resolution

---

## Timeline Summary

| Phase | Tasks | Estimated Time | Deliverables |
|-------|-------|----------------|--------------|
| 0: Preparation | Build minimal Linux, initramfs, verify boot | 2-3h | vmlinux, initramfs, boot test |
| 1: Storage | SPBF format, encoder, PALACE_LOAD opcode | 4-6h | encoder, decoder, tests |
| 2: Wiring | Hypervisor palace_boot, streaming loader | 3-4h | boot from Palace |
| 3: Editing | PALACE_WRITE, editor, versioning | 6-8h | live editor, diff tool |

**Total**: 15-21 hours (spread across sessions)

---

## Next Step Recommendation

Start with **Phase 0** — establish baseline. Without a working Linux kernel, later phases are speculative. Phase 0 confirms the kernel boots, provides test data for Palace encoding, and validates the hypervisor infrastructure.

After Phase 0, proceed sequentially through Phases 1-3. Each phase builds on the previous, with tests and verification at each step.