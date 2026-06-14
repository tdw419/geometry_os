// glyph_patcher.wgsl -- GPU-Native Spatial Instruction Patcher for Geometry OS
//
// Applies patches to a bytecode buffer on the GPU. Each patch is a
// (address, value, mask) triple that selectively overwrites bytes in RAM.
// Philosophy: "Pixels Move Pixels" -- programs rewrite themselves at the
// pixel level, enabling autonomous self-modifying code.
//
// Two patch modes:
//   PATCH  (mode=0): ram[addr] = (ram[addr] & ~mask) | (val & mask)
//   PATCHW (mode=1): ram[addr] = val  (full word overwrite)
//
// Buffer layout:
//   patch_buf[0]        = atomic patch count
//   patch_buf[1..]      = packed u32 triples: (addr, value, mask)
//     Each patch occupies 3 consecutive u32s:
//       patch_buf[1 + 3*i + 0] = address
//       patch_buf[1 + 3*i + 1] = value
//       patch_buf[1 + 3*i + 2] = packed mode|mask
//         bits[0]    = mode (0=PATCH, 1=PATCHW)
//         bits[31:1] = mask (for PATCH mode; ignored for PATCHW)

struct PatcherParams {
    input_len: u32,
    reserved0: u32,
    reserved1: u32,
    reserved2: u32,
}

@group(0) @binding(0) var<storage, read_write> bytecode: array<u32>;
@group(0) @binding(1) var<storage, read> patch_buf: array<u32>;
@group(0) @binding(2) var<uniform> params: PatcherParams;

const MAX_PATCHES: u32 = 4096u;

@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let idx = gid.x;
    if (idx >= MAX_PATCHES) {
        return;
    }

    // Only process patches that were actually submitted
    let patch_count = patch_buf[0];
    if (idx >= patch_count) {
        return;
    }

    let base = 1u + 3u * idx;
    let addr = patch_buf[base + 0u];
    let val = patch_buf[base + 1u];
    let mode_mask = patch_buf[base + 2u];

    let mode = mode_mask & 1u;
    let mask = mode_mask >> 1u;

    if (addr >= params.input_len) {
        return; // out of bounds, skip
    }

    if (mode == 1u) {
        // PATCHW: full word overwrite
        bytecode[addr] = val;
    } else {
        // PATCH: selective bitwise patch
        // new = (old & ~mask) | (val & mask)
        let old = bytecode[addr];
        bytecode[addr] = (old & ~mask) | (val & mask);
    }
}
