#!/usr/bin/env python3
"""
Build pixel-native hypervisor by replacing xv6 syscalls with spatial operations.
Starts with write() syscall (84% of all calls) and expands incrementally.
"""

import json
from pathlib import Path
from typing import Dict, List, Optional


class PixelNativeHypervisor:
    """Incrementally replace xv6 hypervisor components with pixel-native implementations."""

    def __init__(self, training_json: str):
        self.training = json.loads(Path(training_json).read_text())
        self.syscalls = self.training["syscalls"]
        self.replaced_syscalls: Dict[int, str] = {}

    def generate_write_syscall_replacement(self) -> str:
        """Generate pixel-native write() syscall implementation."""

        # Analyze write patterns
        write_calls = [s for s in self.syscalls if s["syscall"]["name"] == "write"]

        if not write_calls:
            return "// No write syscalls observed, cannot generate"

        # Count console vs file writes
        console_writes = [s for s in write_calls if s["write_analysis"]["is_stdout"] or s["write_analysis"]["is_stderr"]]
        file_writes = [s for s in write_calls if not s["write_analysis"]["is_stdout"] and not s["write_analysis"]["is_stderr"]]

        console_count = len(console_writes)
        file_count = len(file_writes)

        # Generate Rust code for pixel-native write
        code = f"""
// Auto-generated pixel-native write() syscall replacement
// Based on {len(write_calls)} observed writes:
//   - Console writes: {console_count} (fd=1 or fd=2)
//   - File writes: {file_count} (fd>=3)
//
// Original: ECALL_U → kernel → UART transmit
// Pixel-native: Direct Hilbert coordinate write

use crate::riscv::cpu::CPU;
use crate::memory::Memory;

/// Pixel-native write() implementation - bypasses kernel, writes directly to pixels
pub fn syscall_write_pixel_native(cpu: &mut CPU, memory: &mut Memory) -> u32 {{
    let fd = cpu.x[10];        // a0: file descriptor
    let buffer = cpu.x[11];    // a1: buffer address
    let count = cpu.x[12];     // a2: byte count

    if count == 0 {{
        return 0;  // Nothing to write
    }}

    // Console output (stdout=1, stderr=2)
    if fd == 1 || fd == 2 {{
        return write_console_pixel_native(cpu, memory, buffer, count);
    }}

    // File output (fd >= 3)
    else {{
        return write_file_pixel_native(cpu, memory, buffer, count, fd);
    }}
}}

/// Write directly to console pixels via Hilbert curve mapping
fn write_console_pixel_native(cpu: &mut CPU, memory: &mut Memory, buffer: u32, count: u32) -> u32 {{
    let mut bytes_written = 0u32;

    for i in 0..count {{
        // Read byte from user memory
        let byte_addr = buffer + i;
        let byte_val = match memory.read_u8(byte_addr) {{
            Ok(v) => v,
            Err(_) => return bytes_written,  // Invalid address, stop
        }};

        // Console base Hilbert coordinates
        let console_offset = bytes_written;
        let hilbert_coord = console_hilbert_map(console_offset);

        // Write pixel directly to memory palace
        let pixel_value = (byte_val as u32) | 0xFF000000;  // RGBA: byte=R, full alpha

        memory.write_u32(hilbert_coord * 4, pixel_value).unwrap();

        bytes_written += 1;
    }}

    bytes_written
}}

/// Write directly to file system blocks via Hilbert curve mapping
fn write_file_pixel_native(cpu: &mut CPU, memory: &mut Memory, buffer: u32, count: u32, fd: u32) -> u32 {{
    // TODO: Implement file system block writes
    // For now, fall back to traditional implementation
    syscall_write_traditional(cpu, memory, fd, buffer, count)
}}

/// Hilbert curve mapping for console (linear offset to 1D coordinate)
fn console_hilbert_map(offset: u32) -> u32 {{
    const CONSOLE_BASE: u32 = 0x00F30000;  // Screen base address
    const CONSOLE_WIDTH: u32 = 256;

    // Simple linear mapping (Hilbert curve would be better)
    let linear_offset = offset * 4;  // 4 bytes per pixel
    CONSOLE_BASE + linear_offset
}}

/// Fallback to traditional write() syscall implementation
fn syscall_write_traditional(cpu: &mut CPU, memory: &mut Memory, fd: u32, buffer: u32, count: u32) -> u32 {{
    // Call original hypervisor write implementation
    // This is where we'd integrate with existing virtio/console code
    crate::riscv::cpu::system::syscall_write(cpu, memory, fd, buffer, count)
}}
"""

        return code

    def generate_fork_syscall_replacement(self) -> str:
        """Generate pixel-native fork() syscall implementation."""

        fork_calls = [s for s in self.syscalls if s["syscall"]["name"] == "fork"]

        if not fork_calls:
            return "// No fork syscalls observed, cannot generate"

        code = f"""
// Auto-generated pixel-native fork() syscall replacement
// Based on {len(fork_calls)} observed fork() calls
//
// Original: ECALL_U → kernel process table → child PID
// Pixel-native: Direct spatial process table manipulation

use crate::riscv::cpu::CPU;
use crate::memory::Memory;
use crate::riscv::mmu::PageTable;

/// Pixel-native fork() implementation - bypasses kernel, manipulates process table directly
pub fn syscall_fork_pixel_native(cpu: &mut CPU, memory: &mut Memory, page_table: &PageTable) -> u32 {{
    // Find free process table entry
    let child_idx = match find_free_process_slot(cpu, memory) {{
        Some(idx) => idx,
        None => return u32::MAX,  // No free slots, return error
    }};

    let parent_idx = cpu.process_id;

    // Copy parent state to child (pixel-level memory copy)
    copy_process_entry(cpu, memory, parent_idx, child_idx);

    // Duplicate page table (Hilbert region duplication)
    duplicate_page_table(cpu, memory, page_table, child_idx);

    // Set return values
    // Parent gets child PID
    // Child gets 0 (will be set in child context)

    child_idx as u32
}}

/// Find free process table entry by scanning spatial memory
fn find_free_process_slot(cpu: &mut CPU, memory: &mut Memory) -> Option<usize> {{
    const PROCESS_TABLE_BASE: u32 = 0x00200000;  // Process table base
    const PROCESS_ENTRY_SIZE: u32 = 256;         // Bytes per process
    const MAX_PROCESSES: usize = 1024;

    for i in 0..MAX_PROCESSES {{
        let offset = PROCESS_TABLE_BASE + (i as u32 * PROCESS_ENTRY_SIZE);
        let state = match memory.read_u8(offset) {{
            Ok(v) => v,
            Err(_) => continue,
        }};

        if state == 0 {{  // FREE
            return Some(i);
        }}
    }}

    None  // No free slots
}}

/// Copy process entry from parent to child
fn copy_process_entry(cpu: &mut CPU, memory: &mut Memory, parent_idx: usize, child_idx: usize) {{
    const PROCESS_TABLE_BASE: u32 = 0x00200000;
    const PROCESS_ENTRY_SIZE: u32 = 256;

    let parent_offset = PROCESS_TABLE_BASE + (parent_idx as u32 * PROCESS_ENTRY_SIZE);
    let child_offset = PROCESS_TABLE_BASE + (child_idx as u32 * PROCESS_ENTRY_SIZE);

    // Pixel-level copy (4 bytes at a time)
    for i in 0..(PROCESS_ENTRY_SIZE / 4) {{
        let src = parent_offset + (i * 4);
        let dst = child_offset + (i * 4);

        if let Ok(val) = memory.read_u32(src) {{
            let _ = memory.write_u32(dst, val);
        }}
    }}

    // Set child state to RUNNING
    let _ = memory.write_u8(child_offset, 1);  // state = RUNNING
}}

/// Duplicate page table for child (Hilbert region duplication)
fn duplicate_page_table(cpu: &mut CPU, memory: &mut Memory, page_table: &PageTable, child_idx: usize) {{
    // Get parent page table root
    let parent_root = page_table.root_addr();

    // Allocate new page table for child
    let child_root = allocate_page_table_page(cpu, memory);

    // Copy page table entries (Hilbert region duplication)
    copy_page_table_region(cpu, memory, parent_root, child_root);
}}

/// Allocate a page of memory for page table
fn allocate_page_table_page(cpu: &mut CPU, memory: &mut Memory) -> u32 {{
    // TODO: Implement spatial memory allocator
    // For now, use a simple linear allocator
    0x00500000 + (cpu.next_page_table_page() as u32 * 4096)
}}

/// Copy page table region (Hilbert space duplication)
fn copy_page_table_region(cpu: &mut CPU, memory: &mut Memory, src: u32, dst: u32) {{
    const PAGE_SIZE: u32 = 4096;

    // Copy entire page (4 bytes at a time)
    for i in 0..(PAGE_SIZE / 4) {{
        let src_addr = src + (i * 4);
        let dst_addr = dst + (i * 4);

        if let Ok(val) = memory.read_u32(src_addr) {{
            let _ = memory.write_u32(dst_addr, val);
        }}
    }}
}}
"""

        return code

    def generate_hypervisor_integration(self) -> str:
        """Generate integration code for pixel-native syscall dispatch."""

        code = """
// Integration: Route syscalls to pixel-native or traditional implementations

use crate::riscv::cpu::CPU;
use crate::memory::Memory;
use crate::riscv::mmu::PageTable;

/// Pixel-native syscall dispatcher
/// Routes syscalls to spatial implementations where available,
/// falls back to traditional kernel otherwise
pub fn dispatch_syscall_pixel_native(
    cpu: &mut CPU,
    memory: &mut Memory,
    page_table: &PageTable,
    syscall_num: u32,
) -> Option<u32> {
    match syscall_num {
        16 => Some(syscall_write_pixel_native(cpu, memory)),
        2 => Some(syscall_fork_pixel_native(cpu, memory, page_table)),
        // TODO: Add more syscalls as they're synthesized
        _ => None,  // Fall back to traditional implementation
    }
}

/// Main syscall handler with pixel-native routing
pub fn handle_ecall_pixel_native(
    cpu: &mut CPU,
    memory: &mut Memory,
    page_table: &PageTable,
) -> u32 {
    let syscall_num = cpu.x[17];  // a7: syscall number

    // Try pixel-native implementation first
    if let Some(result) = dispatch_syscall_pixel_native(cpu, memory, page_table, syscall_num) {
        return result;
    }

    // Fall back to traditional kernel implementation
    match syscall_num {
        1 => syscall_exit(cpu, memory),
        3 => syscall_read(cpu, memory),
        5 => syscall_fstat(cpu, memory),
        7 => syscall_close(cpu, memory),
        8 => syscall_pipe(cpu, memory),
        12 => syscall_wait(cpu, memory),
        15 => syscall_openat(cpu, memory),
        18 => syscall_unlink(cpu, memory),
        21 => syscall_unlink(cpu, memory),
        _ => {
            eprintln!("Unknown syscall: {}", syscall_num);
            -1i32 as u32  // Error
        }
    }
}
"""

        return code

    def generate_implementation_plan(self) -> str:
        """Generate step-by-step implementation plan."""

        stats = self.training["statistics"]
        syscall_counts = stats["syscall_counts"]

        plan = f"""
# Pixel-Native Hypervisor Implementation Plan

## Current Status

- **Training data:** {stats['total_syscalls']} syscall pairs collected
- **Unique syscalls:** {stats['unique_syscalls']} types observed
- **Commands:** 1 (ls)

## Syscall Priority Ranking

Based on frequency and impact:

### Phase 1: High Priority (Replace immediately)
- **write(16)** - {syscall_counts.get('write', 0)} calls (84.0%)
  - Impact: Massive performance improvement
  - Complexity: Low (direct pixel writes)
  - Risk: Low (deterministic mapping)

### Phase 2: Medium Priority (Replace next)
- **openat(15)** - {syscall_counts.get('openat', 0)} calls (3.7%)
  - Impact: File system performance
  - Complexity: Medium (inode lookup + Hilbert mapping)
  - Risk: Medium (filesystem state management)

- **fstat(8)** - {syscall_counts.get('fstat', 0)} calls (4.1%)
  - Impact: Metadata queries
  - Complexity: Low (read-only operations)
  - Risk: Low (no state changes)

### Phase 3: Low Priority (Replace later)
- **fork(2)** - {syscall_counts.get('fork', 0)} calls (0.2%)
  - Impact: Process creation overhead
  - Complexity: High (process table + page table duplication)
  - Risk: High (complex state management)

- **read(3)** - {syscall_counts.get('read', 0)} calls (0.2%)
  - Impact: File system performance
  - Complexity: Medium (block cache + Hilbert mapping)
  - Risk: Medium (cache coherency)

### Phase 4: Infrastructure (Support for above)
- **pipe(7)** - {syscall_counts.get('pipe', 0)} calls (3.5%)
- **close(5)** - {syscall_counts.get('close', 0)} calls (0.2%)
- **wait(12)** - {syscall_counts.get('wait', 0)} calls (0.2%)
- **unlink(21)** - {syscall_counts.get('unlink', 0)} calls (3.7%)

## Implementation Steps

### Step 1: Integrate write() syscall replacement
- Add `src/riscv/pixel_native/write.rs`
- Modify `src/riscv/cpu/system.rs` to route write(16) to pixel-native
- Test with 'ls' command (uses write heavily)
- Verify output matches traditional xv6

### Step 2: Add Hilbert curve mapping library
- Add `src/spatial/hilbert.rs`
- Implement efficient 2D ↔ 1D mapping
- Add tests for correctness

### Step 3: Implement openat() replacement
- Add `src/riscv/pixel_native/openat.rs`
- Implement namei via Hilbert-space traversal
- Test with 'cat init' (reads file)

### Step 4: Implement fstat() replacement
- Add `src/riscv/pixel_native/fstat.rs`
- Read inode metadata directly from Hilbert space
- Test with 'ls -l' (uses fstat for each file)

### Step 5: Add process table spatial mapping
- Add `src/riscv/pixel_native/process.rs`
- Map process table to Hilbert coordinates
- Test with fork_test

### Step 6: Replace remaining syscalls
- Read, close, wait, unlink, pipe
- Each follows same pattern

### Step 7: Verification and optimization
- Visual Consistency Contract for all syscalls
- Performance benchmarking
- Refinement and optimization

## Testing Strategy

For each syscall replacement:
1. Run command with traditional xv6
2. Capture final memory palace state
3. Run command with pixel-native hypervisor
4. Compare memory palace states pixel-by-pixel
5. If different: debug and refine
6. If identical: ship pixel-native version

## Success Metrics

- Performance: Pixel-native syscall latency < traditional syscall latency
- Correctness: Pixel-perfect match with traditional xv6
- Coverage: >90% of syscalls pixel-native
- Reliability: No regressions on existing tests

## Expected Outcomes

Phase 1 (write only):
- 84% of syscalls pixel-native
- Significant performance improvement (console output)
- Low risk, high confidence

Phase 2 (write + openat + fstat):
- 92% of syscalls pixel-native
- Major performance improvement (file operations)
- Medium risk, high confidence

Phase 3 (all syscalls):
- 100% of syscalls pixel-native
- Complete pixel-native hypervisor
- Low risk (incremental migration)
"""

        return plan


def main():
    """Generate pixel-native hypervisor implementation files."""
    import sys

    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <training_json> <output_dir>", file=sys.stderr)
        sys.exit(1)

    training_json = sys.argv[1]
    output_dir = Path(sys.argv[2])
    output_dir.mkdir(parents=True, exist_ok=True)

    # Generate hypervisor
    hypervisor = PixelNativeHypervisor(training_json)

    # Generate write() syscall replacement
    write_code = hypervisor.generate_write_syscall_replacement()
    (output_dir / "write_syscall.rs").write_text(write_code)

    # Generate fork() syscall replacement
    fork_code = hypervisor.generate_fork_syscall_replacement()
    (output_dir / "fork_syscall.rs").write_text(fork_code)

    # Generate integration code
    integration_code = hypervisor.generate_hypervisor_integration()
    (output_dir / "integration.rs").write_text(integration_code)

    # Generate implementation plan
    plan = hypervisor.generate_implementation_plan()
    (output_dir / "IMPLEMENTATION_PLAN.md").write_text(plan)

    print(f"✓ Generated write_syscall.rs", file=sys.stderr)
    print(f"✓ Generated fork_syscall.rs", file=sys.stderr)
    print(f"✓ Generated integration.rs", file=sys.stderr)
    print(f"✓ Generated IMPLEMENTATION_PLAN.md", file=sys.stderr)
    print(f"✓ Output directory: {output_dir}", file=sys.stderr)
    print(file=sys.stderr)
    print("Next steps:", file=sys.stderr)
    print("  1. Review generated code in output_dir/", file=sys.stderr)
    print("  2. Add files to src/riscv/pixel_native/", file=sys.stderr)
    print("  3. Integrate with src/riscv/cpu/system.rs", file=sys.stderr)
    print("  4. Test with 'ls' command", file=sys.stderr)
    print("  5. Verify output matches traditional xv6", file=sys.stderr)


if __name__ == "__main__":
    main()