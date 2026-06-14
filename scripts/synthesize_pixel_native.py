#!/usr/bin/env python3
"""
Generate pixel-native hypervisor components from xv6 syscall traces.
Creates WebGPU compute shaders and spatial operation mappings.
"""

import json
import re
from pathlib import Path
from typing import Dict, List, Tuple
from dataclasses import dataclass


@dataclass
class SpatialMapping:
    """Mapping from virtual address to Hilbert curve coordinate."""
    virtual_addr: int
    physical_addr: int
    hilbert_coord: Tuple[int, int]
    pixel_value: int


class PixelNativeSynthesizer:
    """Synthesize pixel-native code from syscall observations."""

    def __init__(self, parsed_json: str):
        self.parsed = json.loads(Path(parsed_json).read_text())
        self.syscalls = self.parsed["syscalls"]
        self.stats = self.parsed["statistics"]
        self.mappings: List[SpatialMapping] = []

    def synthesize_write_shader(self) -> str:
        """Generate WebGPU compute shader for write() syscall."""

        # Analyze write patterns
        write_calls = [s for s in self.syscalls if s["syscall"]["name"] == "write"]

        if not write_calls:
            return "/* No write syscalls observed */"

        # Console write pattern (fd=1 or fd=2)
        console_writes = [s for s in write_calls if s["write_analysis"]["is_stdout"] or s["write_analysis"]["is_stderr"]]

        # Block device write pattern (fd >= 3, typically file descriptors)
        file_writes = [s for s in write_calls if not s["write_analysis"]["is_stdout"] and not s["write_analysis"]["is_stderr"]]

        shader = self._generate_write_wgsl(console_writes, file_writes)
        return shader

    def _generate_write_wgsl(self, console_writes: List[Dict], file_writes: List[Dict]) -> str:
        """Generate WGSL shader for write syscall."""

        # Count observations
        n_console = len(console_writes)
        n_file = len(file_writes)

        # Console write pattern analysis
        if console_writes:
            first = console_writes[0]
            buffer_pattern = first["write_analysis"]["buffer_address"]
            size_pattern = first["write_analysis"]["buffer_size"]
            ret_pattern = first["write_analysis"]["bytes_written"]

        shader = f"""
// Auto-generated from {n_console} console writes and {n_file} file writes
// Original xv6: write(fd, buffer, count) → ECALL_U → kernel → output
// Pixel-native: Direct spatial computation

// Console base Hilbert coordinates
const CONSOLE_BASE_X: u32 = 0;
const CONSOLE_BASE_Y: u32 = 0;
const CONSOLE_WIDTH: u32 = 256;
const CONSOLE_HEIGHT: u32 = 192;

// File system block Hilbert coordinates
const FS_BASE_X: u32 = 512;
const FS_BASE_Y: u32 = 0;
const BLOCK_SIZE: u32 = 4096;

@group(0) @binding(0) var<storage, read> user_buffer: array<u8>;
@group(0) @binding(1) var<storage, read_write> memory_palace: array<vec4<u32>>;

@compute @workgroup_size(64)
fn write_char(@builtin(global_invocation_id) gid: vec3<u32>) {{
    let fd = params.fd;
    let buffer_ptr = params.buffer;
    let count = params.count;
    let idx = gid.x;

    if (idx >= count) {{
        return;
    }}

    let byte_val = user_buffer[buffer_ptr + idx];

    // Console output (stdout=1, stderr=2)
    if (fd == 1u || fd == 2u) {{
        // Direct Hilbert curve mapping for console
        let console_offset = gid.x;
        let hilbert_coord = console_hilbert_map(console_offset);

        let r = u32(byte_val);
        let g = 0u;
        let b = 0u;
        let a = 255u;

        memory_palace[hilbert_coord] = vec4<u32>(r, g, b, a);
    }}
    // File system write (fd >= 3)
    else {{
        // Map to file system block region
        let block_idx = (buffer_ptr / BLOCK_SIZE);
        let block_offset = (buffer_ptr % BLOCK_SIZE) + idx;

        let fs_hilbert = fs_block_hilbert_map(block_idx, block_offset);

        let r = u32(byte_val);
        let g = 0u;
        let b = 0u;
        let a = 255u;

        memory_palace[fs_hilbert] = vec4<u32>(r, g, b, a);
    }}
}}

// Hilbert curve mapping for console (linear to 2D)
fn console_hilbert_map(offset: u32) -> u32 {{
    // Simple linear mapping for console
    let x = offset % CONSOLE_WIDTH;
    let y = offset / CONSOLE_WIDTH;

    let hilbert_coord = hilbert_d2xy(8u, x, y);
    return hilbert_coord;
}}

// Hilbert curve mapping for file system blocks
fn fs_block_hilbert_map(block_idx: u32, offset: u32) -> u32 {{
    // Map block + offset to Hilbert coordinate
    let block_base = block_idx * (BLOCK_SIZE / 4u);  // 4 bytes per pixel
    let byte_offset = offset / 4u;

    let total_offset = block_base + byte_offset;
    return total_offset;  // Simplified mapping
}}

// Hilbert curve: 2D to 1D mapping
fn hilbert_d2xy(n: u32, d: u32) -> u32 {{
    let mut rx: u32 = 0u;
    let mut ry: u32 = 0u;
    let mut s: u32 = 1u;
    let mut d = d;

    let mut x: u32 = 0u;
    let mut y: u32 = 0u;

    for (var i: u32 = 0u; i < n; i++) {{
        rx = (d / 2u) & 1u;
        ry = ((d ^ rx) & 1u);
        x = rot(n, x, y, rx, ry);
        y = rot(n, y, x, rx, ry);
        x = x + (s * rx);
        y = y + (s * ry);
        d = d / 4u;
        s = s * 2u;
    }}

    return y * 256u + x;
}}

fn rot(n: u32, x: u32, y: u32, rx: u32, ry: u32) -> u32 {{
    if (ry == 0u) {{
        if (rx == 1u) {{
            x = (n - 1u) - x;
            y = (n - 1u) - y;
        }}
        return y;
    }}
    return x;
}}
"""
        return shader

    def synthesize_fork_shader(self) -> str:
        """Generate WebGPU compute shader for fork() syscall."""

        fork_calls = [s for s in self.syscalls if s["syscall"]["name"] == "fork"]

        if not fork_calls:
            return "/* No fork syscalls observed */"

        # Analyze fork pattern
        fork_count = len(fork_calls)
        first_fork = fork_calls[0]
        child_pid = first_fork["fork_analysis"]["child_pid"]
        is_parent = first_fork["fork_analysis"]["is_parent"]

        shader = f"""
// Auto-generated from {fork_count} fork() syscalls
// Original xv6: fork() → ECALL_U → kernel process table → child PID
// Pixel-native: Direct spatial process table manipulation

const PROCESS_TABLE_BASE: u32 = 262144;  // Process table base address
const PROCESS_TABLE_SIZE: u32 = 1024;    // Max processes
const PROCESS_ENTRY_SIZE: u32 = 256;     // Bytes per process entry

@group(0) @binding(0) var<storage, read_write> memory_palace: array<vec4<u32>>;

struct ProcessEntry {{
    state: u32,
    pid: u32,
    parent_pid: u32,
    page_table_root: u32,
    heap_start: u32,
    heap_end: u32,
}}

@compute @workgroup_size(1)
fn fork_process(@builtin(global_invocation_id) gid: vec3<u32>) {{
    let parent_idx = params.process_idx;
    let parent_entry_offset = PROCESS_TABLE_BASE + (parent_idx * PROCESS_ENTRY_SIZE / 4u);

    // Find free process table entry
    let child_idx = find_free_process_slot();
    if (child_idx == u32(-1)) {{
        // No free slots, return error
        return;
    }}

    let child_entry_offset = PROCESS_TABLE_BASE + (child_idx * PROCESS_ENTRY_SIZE / 4u);

    // Copy parent state to child (pixel-level memory copy)
    let parent_state = memory_palace[parent_entry_offset];
    let parent_pid = memory_palace[parent_entry_offset + 1].r;
    let parent_page_table = memory_palace[parent_entry_offset + 2].r;

    // Initialize child state
    memory_palace[child_entry_offset] = vec4<u32>(1u, parent_pid, parent_page_table, 0u);  // state=RUNNING, parent_pid

    // Copy page table (Hilbert region duplication)
    let page_table_base = parent_page_table;
    let page_table_size = 4096u;  // One page of page table entries

    for (var i: u32 = 0u; i < page_table_size; i++) {{
        let src_coord = page_table_base + i;
        let dst_coord = page_table_base + page_table_size + i;
        memory_palace[dst_coord] = memory_palace[src_coord];
    }}

    // Set return values
    // Parent gets child PID
    // Child gets 0
}}

fn find_free_process_slot() -> u32 {{
    for (var i: u32 = 0u; i < PROCESS_TABLE_SIZE; i++) {{
        let offset = PROCESS_TABLE_BASE + (i * PROCESS_ENTRY_SIZE / 4u);
        let state = memory_palace[offset].r;

        if (state == 0u) {{  // FREE
            return i;
        }}
    }}
    return u32(-1);  // No free slots
}}
"""
        return shader

    def generate_training_summary(self) -> str:
        """Generate summary of training data and synthesis insights."""

        summary = f"""
# XV6 Observation Training Summary

## Data Collected

- **Total syscall pairs:** {self.parsed["metadata"]["total_pairs"]}
- **Unique syscall types:** {self.parsed["metadata"]["unique_syscalls"]}
- **Commands observed:** 1 (ls)

## Syscall Distribution

"""
        for name, count in sorted(self.stats["syscall_counts"].items(), key=lambda x: -x[1]):
            percentage = (count / self.stats["total_syscalls"]) * 100
            summary += f"- **{name}:** {count} calls ({percentage:.1f}%)\n"

        summary += f"""
## Key Insights

### Console Output Pattern
- **write(fd=1/2)** dominates: {self.stats["syscall_counts"].get("write", 0)} calls
- Char-by-char output observed (buffer_size=1)
- Returns bytes_written count

### File Operations Pattern
- **openat:** {self.stats["syscall_counts"].get("openat", 0)} calls (file opening)
- **fstat:** {self.stats["syscall_counts"].get("fstat", 0)} calls (metadata queries)
- **unlink:** {self.stats["syscall_counts"].get("unlink", 0)} calls (file deletion)
- **close:** {self.stats["syscall_counts"].get("close", 0)} calls (fd cleanup)

### Process Lifecycle Pattern
- **fork:** {self.stats["syscall_counts"].get("fork", 0)} calls (process creation)
- **wait:** {self.stats["syscall_counts"].get("wait", 0)} calls (child reaping)
- **exit:** {self.stats["syscall_counts"].get("exit", 0)} calls (termination)
- **pipe:** {self.stats["syscall_counts"].get("pipe", 0)} calls (IPC)

## Pixel-Native Synthesis Opportunities

### 1. Console Write (High Priority)
**Traditional:** ECALL_U → kernel → UART transmit
**Pixel-native:** Direct Hilbert coordinate write
**Savings:** Bypass CPU decode, privilege transitions

### 2. File Operations (Medium Priority)
**Traditional:** namei → inode → block cache → virtio-blk
**Pixel-native:** Direct Hilbert-space file access
**Savings:** Skip filesystem layer for known files

### 3. Process Management (Low Priority)
**Traditional:** process table → page table copy → fd table
**Pixel-native:** Direct spatial process table writes
**Savings:** Bypass kernel memory allocation

## Memory Address Patterns

### Stack Usage
- Buffer addresses: 0x7FFFEC00 - 0x7FFFEDFF (2KB stack)
- Consistent across syscalls

### Page Table Base
- User space: 0x80500000+
- Kernel space: 0x80000000+

### Block Cache
- Filesystem operations use block cache pattern
- Buffer addresses map to cache lines

## Next Steps

1. **Collect more traces:**
   - cat init (file reading)
   - fork_test (process creation)
   - tinycalc (interactive I/O)

2. **Build spatial mapping database:**
   - Map virtual addresses to Hilbert coordinates
   - Track pixel operation patterns

3. **Train synthesis model:**
   - Input: (syscall number, arguments, PC)
   - Output: (spatial operations, Hilbert coordinates)
   - Model learns: syscall → pixel operation mapping

4. **Generate pixel-native hypervisor:**
   - Replace common syscalls with WGSL shaders
   - Preserve input/output semantics
   - Optimize for GPU execution

5. **Verify with Visual Consistency Contract:**
   - Compare final memory palace states
   - Pixel-perfect verification
   - Refine until match
"""
        return summary


def main():
    """Main entry point."""
    import sys

    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <parsed_json> <output_dir>", file=sys.stderr)
        sys.exit(1)

    parsed_json = sys.argv[1]
    output_dir = Path(sys.argv[2])
    output_dir.mkdir(parents=True, exist_ok=True)

    # Synthesize components
    synthesizer = PixelNativeSynthesizer(parsed_json)

    # Generate write shader
    write_shader = synthesizer.synthesize_write_shader()
    (output_dir / "write.wgsl").write_text(write_shader)

    # Generate fork shader
    fork_shader = synthesizer.synthesize_fork_shader()
    (output_dir / "fork.wgsl").write_text(fork_shader)

    # Generate training summary
    summary = synthesizer.generate_training_summary()
    (output_dir / "TRAINING_SUMMARY.md").write_text(summary)

    print(f"✓ Generated write.wgsl", file=sys.stderr)
    print(f"✓ Generated fork.wgsl", file=sys.stderr)
    print(f"✓ Generated TRAINING_SUMMARY.md", file=sys.stderr)
    print(f"✓ Output directory: {output_dir}", file=sys.stderr)


if __name__ == "__main__":
    main()