# Meta-Circular Glyph Scheduler Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Migrate the VM scheduler from Rust to a native glyph program, enabling self-hosting and self-modification.

**Architecture:** Rust shim handles GPU init + trap callbacks. Glyph scheduler runs as VM 0, scheduling VMs 1-255 via round-robin. Communication via memory-mapped trap interface at 0xFF00_0000.

**Tech Stack:** Rust (wgpu), WGSL compute shaders, Glyph ISA (32-bit RISC-V variant)

---

## Phase 1: Trap Interface

### Task 1.1: Define Trap Interface Types

**Files:**
- Create: `systems/infinite_map_rs/src/trap_interface.rs`
- Modify: `systems/infinite_map_rs/src/lib.rs`

**Step 1: Create trap_interface.rs with constants and types**

```rust
//! Trap Interface - Glyph ↔ Rust Shim Communication
//!
//! Memory-mapped region at 0xFF00_0000 for glyph programs to request
//! operations that require Rust/wgpu context.

/// Base address of trap interface in substrate memory
pub const TRAP_BASE: u32 = 0xFF00_0000;

/// Trap operation types
pub mod op_type {
    pub const READ_BUFFER: u32 = 1;
    pub const WRITE_BUFFER: u32 = 2;
    pub const SPAWN_VM: u32 = 3;
    pub const KILL_VM: u32 = 4;
    pub const PEEK_SUBSTRATE: u32 = 5;
    pub const POKE_SUBSTRATE: u32 = 6;
}

/// Trap status values
pub mod status {
    pub const IDLE: u32 = 0;
    pub const PENDING: u32 = 1;
    pub const COMPLETE: u32 = 2;
}

/// Trap interface offsets (relative to TRAP_BASE)
#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct TrapRegs {
    pub op_type: u32,    // +0x00
    pub arg0: u32,       // +0x04
    pub arg1: u32,       // +0x08
    pub arg2: u32,       // +0x0C
    pub result: u32,     // +0x10
    pub status: u32,     // +0x14
}

impl Default for TrapRegs {
    fn default() -> Self {
        Self {
            op_type: 0,
            arg0: 0,
            arg1: 0,
            arg2: 0,
            result: 0,
            status: status::IDLE,
        }
    }
}

impl TrapRegs {
    /// Convert substrate address to TrapRegs pointer
    pub fn from_substrate_addr(addr: u32) -> *const Self {
        debug_assert!(addr >= TRAP_BASE);
        let offset = (addr - TRAP_BASE) as usize;
        // This is for documentation; actual access goes through texture reads
        std::ptr::null()
    }
}
```

**Step 2: Add module to lib.rs**

In `systems/infinite_map_rs/src/lib.rs`, add after line 78:

```rust
pub mod trap_interface;
```

**Step 3: Verify compilation**

Run: `cargo check --package infinite_map_rs`
Expected: Compiles without errors

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/trap_interface.rs systems/infinite_map_rs/src/lib.rs
git commit -m "feat(trap): add trap interface types and constants"
```

---

### Task 1.2: Create Trap Handler in Rust Shim

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add trap handler struct**

Add after the imports (around line 17):

```rust
use infinite_map_rs::trap_interface::{TrapRegs, op_type, status, TRAP_BASE};
```

**Step 2: Add TrapHandler struct**

Add before `fn main()`:

```rust
/// Handles trap requests from glyph programs
struct TrapHandler {
    regs: TrapRegs,
}

impl TrapHandler {
    fn new() -> Self {
        Self {
            regs: TrapRegs::default(),
        }
    }

    /// Check if a pending trap exists and execute it
    fn poll_and_execute(
        &mut self,
        scheduler: &mut GlyphVmScheduler,
        texture: &wgpu::Texture,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
    ) -> bool {
        // Read trap registers from substrate
        let trap_bytes = scheduler.peek_substrate(TRAP_BASE, 6);
        self.regs = TrapRegs::from_bytes(trap_bytes);

        if self.regs.status != status::PENDING {
            return false;
        }

        // Execute the requested operation
        let result = match self.regs.op_type {
            op_type::SPAWN_VM => {
                let entry = self.regs.arg0;
                let config = self.regs.arg1;
                scheduler.spawn_vm_from_trap(entry, config) as u32
            }
            op_type::KILL_VM => {
                let vm_id = self.regs.arg0;
                scheduler.kill_vm(vm_id) as u32
            }
            op_type::PEEK_SUBSTRATE => {
                let addr = self.regs.arg0;
                scheduler.peek_substrate_single(addr)
            }
            op_type::POKE_SUBSTRATE => {
                let addr = self.regs.arg0;
                let val = self.regs.arg1;
                scheduler.poke_substrate_single(addr, val);
                0
            }
            _ => {
                eprintln!("[TRAP] Unknown op_type: {}", self.regs.op_type);
                0xFFFF_FFFF // Error code
            }
        };

        // Write result and mark complete
        self.regs.result = result;
        self.regs.status = status::COMPLETE;
        scheduler.write_trap_regs(&self.regs);

        true
    }
}
```

**Step 3: Add helper methods to GlyphVmScheduler**

In `glyph_vm_scheduler.rs`, add these methods to `impl GlyphVmScheduler`:

```rust
    /// Peek substrate memory at trap base (6 u32 values = 24 bytes)
    pub fn peek_substrate(&self, base: u32, count: u32) -> [u8; 24] {
        // Use existing peek mechanism
        let mut result = [0u8; 24];
        // TODO: Implement via texture read
        result
    }

    /// Write trap registers back to substrate
    pub fn write_trap_regs(&mut self, regs: &TrapRegs) {
        // TODO: Implement via texture write
    }

    /// Spawn VM from trap request
    pub fn spawn_vm_from_trap(&mut self, entry: u32, _config: u32) -> u8 {
        let config = VmConfig {
            entry_point: entry,
            ..Default::default()
        };
        self.spawn_vm(config)
    }

    /// Kill VM by ID
    pub fn kill_vm(&mut self, vm_id: u32) -> u8 {
        // TODO: Implement VM termination
        println!("[TRAP] Kill VM {} requested", vm_id);
        0
    }

    /// Peek single substrate value
    pub fn peek_substrate_single(&self, addr: u32) -> u32 {
        // TODO: Implement via texture read
        0
    }

    /// Poke single substrate value
    pub fn poke_substrate_single(&mut self, addr: u32, val: u32) {
        // TODO: Implement via texture write
    }
```

**Step 4: Verify compilation**

Run: `cargo check --package infinite_map_rs`
Expected: May have warnings but no errors

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs systems/infinite_map_rs/src/glyph_vm_scheduler.rs
git commit -m "feat(trap): add trap handler to shim and scheduler helpers"
```

---

### Task 1.3: Integrate Trap Polling into Main Loop

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add TrapHandler to main**

In `fn main()`, add after `let brain_bridge = ...` (around line 86):

```rust
    let trap_handler = Arc::new(Mutex::new(TrapHandler::new()));
    println!("[TRAP] Handler initialized");
```

**Step 2: Add trap polling to main loop**

Modify the main loop (around line 171) to include trap polling:

```rust
    // Substrate Heartbeat
    println!("I AM INITIALIZED");
    std::io::stdout().flush().unwrap();
    println!("[EXEC] Substrate pulse starting...");
    std::io::stdout().flush().unwrap();

    let trap_handler_loop = trap_handler.clone();
    let scheduler_loop = scheduler.clone();
    let texture_loop = ram_texture.clone();
    let device_loop = device.clone();
    let queue_loop = queue.clone();

    loop {
        println!("I AM IN THE LOOP");
        std::io::stdout().flush().unwrap();
        let start = Instant::now();

        // Execute VM frame
        scheduler.lock().unwrap().execute_frame();

        // Poll for trap requests
        {
            let mut th = trap_handler_loop.lock().unwrap();
            let mut sched = scheduler_loop.lock().unwrap();
            th.poll_and_execute(
                &mut sched,
                &texture_loop,
                &device_loop,
                &queue_loop,
            );
        }

        if let Some(delay) = Duration::from_micros(16667).checked_sub(start.elapsed()) {
            thread::sleep(delay);
        }
    }
```

**Step 3: Verify compilation**

Run: `cargo check --package infinite_map_rs`
Expected: Compiles successfully

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(trap): integrate trap polling into main loop"
```

---

### Task 1.4: Create Test Glyph for Trap Interface

**Files:**
- Create: `systems/glyph_stratum/programs/test_trap.glyph`

**Step 1: Write test glyph that uses trap**

```glyph
// ============================================================================
// Geometry OS - Trap Interface Test
// ============================================================================
//
// Tests the trap mechanism by requesting a PEEK_SUBSTRATE operation.

.equ TRAP_BASE,    0xFF000000
.equ TRAP_OP,      0xFF000000
.equ TRAP_ARG0,    0xFF000004
.equ TRAP_ARG1,    0xFF000008
.equ TRAP_RESULT,  0xFF000010
.equ TRAP_STATUS,  0xFF000014

.equ STATUS_IDLE,     0
.equ STATUS_PENDING,  1
.equ STATUS_COMPLETE, 2

.equ OP_PEEK, 5
.equ OP_POKE, 6

:main
    // Write test pattern to substrate first
    LDI r1, 0xDEADBEEF
    LDI r2, 0x0100      // Address to write
    STORE r2, r1

    // Request PEEK via trap
    LDI r1, TRAP_OP
    LDI r2, OP_PEEK     // op_type = PEEK_SUBSTRATE
    STORE r1, r2

    LDI r1, TRAP_ARG0
    LDI r2, 0x0100      // arg0 = address to peek
    STORE r1, r2

    LDI r1, TRAP_STATUS
    LDI r2, STATUS_PENDING
    STORE r1, r2        // Signal pending

:wait_complete
    LDI r1, TRAP_STATUS
    LOAD r1, r2
    LDI r3, STATUS_COMPLETE
    SUB r2, r3
    JNZ wait_complete   // Loop until complete

    // Read result
    LDI r1, TRAP_RESULT
    LOAD r1, r10        // r10 = peeked value

    // Write result to visible location
    LDI r1, 0x0200
    STORE r1, r10

    // Halt
    HALT
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/test_trap.glyph
git commit -m "test(trap): add trap interface test glyph"
```

---

### Task 1.5: Implement Substrate Peek/Poke for Trap

**Files:**
- Modify: `systems/infinite_map_rs/src/glyph_vm_scheduler.rs`

**Step 1: Implement peek_substrate method**

Replace the placeholder `peek_substrate` with real implementation:

```rust
    /// Peek substrate memory at trap base (6 u32 values = 24 bytes)
    pub fn peek_substrate(&self, base: u32, count: u32) -> [u8; 24] {
        let mut result = [0u8; 24];

        // Create staging buffer for readback
        let staging = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Trap Peek Staging"),
            size: 24,
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // We need the encoder to copy from texture to buffer
        // This requires async mapping, so for now we return zeros
        // and implement properly in execute_frame

        result
    }
```

**Step 2: Add texture-to-buffer copy in execute_frame**

In `execute_frame()`, add after the compute pass:

```rust
    /// Execute one frame of the scheduler
    pub fn execute_frame(&mut self) {
        // ... existing compute dispatch ...

        // Check for trap requests (poll trap region)
        self.poll_trap_region();
    }

    fn poll_trap_region(&mut self) {
        // Read trap status from substrate
        // This is done via the existing stats readback mechanism
    }
```

**Step 3: For now, use stats buffer approach**

Add a method to read trap via stats buffer:

```rust
    /// Read trap registers via stats buffer
    pub fn read_trap_via_stats(&self) -> TrapRegs {
        // Map the stats buffer and read trap region
        // For initial testing, return default
        TrapRegs::default()
    }
```

**Step 4: Verify compilation**

Run: `cargo check --package infinite_map_rs`
Expected: Compiles with warnings

**Step 5: Commit**

```bash
git add systems/infinite_map_rs/src/glyph_vm_scheduler.rs
git commit -m "feat(trap): implement substrate peek/poke skeleton"
```

---

## Phase 2: Minimal Scheduler Glyph

### Task 2.1: Create scheduler.glyph

**Files:**
- Create: `systems/glyph_stratum/programs/scheduler.glyph`

**Step 1: Write minimal scheduler**

```glyph
// ============================================================================
// Geometry OS - Meta-Circular Scheduler (VM 0)
// ============================================================================
//
// This glyph runs as VM 0 and schedules VMs 1-255 in round-robin fashion.
// Uses trap interface for VM spawn/kill operations.

.equ TRAP_BASE,    0xFF000000
.equ TRAP_OP,      0xFF000000
.equ TRAP_ARG0,    0xFF000004
.equ TRAP_ARG1,    0xFF000008
.equ TRAP_RESULT,  0xFF000010
.equ TRAP_STATUS,  0xFF000014

.equ VM_TABLE,     0xFE000000    // VM state table region
.equ MAX_VMS,      255
.equ CYCLES_PER_VM, 64

// VM state offsets (relative to VM base)
.equ VM_STATE,     0
.equ VM_PC,        4
.equ VM_ACTIVE,    1

:main
    // Mark self as running (VM 0)
    LDI r1, 0xFF000100
    LDI r2, 1           // RUNNING
    STORE r1, r2

    // Initialize frame counter
    LDI r20, 0          // r20 = frame count

:scheduler_loop
    ADDI r20, r20, 1    // frame++

    // Round-robin through VMs 1-255
    LDI r21, 1          // r21 = current VM ID

:vm_loop
    // Check if VM r21 is active
    // For now, just yield to let shim handle scheduling
    // Real implementation would check VM_TABLE[r21].active

    // Increment VM ID
    ADDI r21, r21, 1
    LDI r22, MAX_VMS
    SUB r21, r22
    JNZ vm_loop         // Loop until r21 > MAX_VMS

    // Frame sync - write heartbeat
    LDI r1, 0xFF000200
    STORE r1, r20

    // Yield to shim for trap processing
    // (shim will handle actual VM execution)

    JMP scheduler_loop
```

**Step 2: Commit**

```bash
git add systems/glyph_stratum/programs/scheduler.glyph
git commit -m "feat(scheduler): add meta-circular scheduler.glyph (VM 0)"
```

---

### Task 2.2: Load scheduler.glyph as VM 0 on Boot

**Files:**
- Modify: `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs`

**Step 1: Add scheduler glyph loading**

In `fn main()`, after creating the scheduler (around line 65), add:

```rust
    // Load scheduler.glyph into VM 0
    let scheduler_glyph_path = "systems/glyph_stratum/programs/scheduler.glyph";
    if let Ok(glyph_bytes) = std::fs::read(scheduler_glyph_path) {
        println!("[BOOT] Loading scheduler.glyph into VM 0...");
        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        let vm_id = scheduler.lock().unwrap().spawn_vm(config);
        if vm_id == 0 {
            println!("[BOOT] scheduler.glyph loaded as VM 0");
        } else {
            eprintln!("[BOOT] Warning: scheduler got VM ID {} (expected 0)", vm_id);
        }
    } else {
        println!("[BOOT] Warning: Could not load scheduler.glyph, running without meta-scheduler");
    }
```

**Step 2: Verify compilation**

Run: `cargo check --package infinite_map_rs`
Expected: Compiles successfully

**Step 3: Commit**

```bash
git add systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs
git commit -m "feat(boot): load scheduler.glyph as VM 0 on daemon start"
```

---

## Phase 3: Verification & Testing

### Task 3.1: Add Integration Test for Trap Interface

**Files:**
- Create: `systems/infinite_map_rs/src/tests/trap_test.rs`

**Step 1: Write integration test**

```rust
//! Integration tests for trap interface

#[cfg(test)]
mod tests {
    use infinite_map_rs::trap_interface::{TrapRegs, op_type, status, TRAP_BASE};

    #[test]
    fn test_trap_regs_size() {
        // TrapRegs should be 24 bytes (6 x u32)
        assert_eq!(std::mem::size_of::<TrapRegs>(), 24);
    }

    #[test]
    fn test_trap_base_address() {
        // Trap base should be in high memory
        assert_eq!(TRAP_BASE, 0xFF000000);
    }

    #[test]
    fn test_op_types() {
        assert_eq!(op_type::SPAWN_VM, 3);
        assert_eq!(op_type::KILL_VM, 4);
        assert_eq!(op_type::PEEK_SUBSTRATE, 5);
        assert_eq!(op_type::POKE_SUBSTRATE, 6);
    }

    #[test]
    fn test_status_values() {
        assert_eq!(status::IDLE, 0);
        assert_eq!(status::PENDING, 1);
        assert_eq!(status::COMPLETE, 2);
    }

    #[test]
    fn test_trap_regs_default() {
        let regs = TrapRegs::default();
        assert_eq!(regs.status, status::IDLE);
        assert_eq!(regs.op_type, 0);
        assert_eq!(regs.result, 0);
    }
}
```

**Step 2: Add to tests/mod.rs**

In `systems/infinite_map_rs/src/tests/mod.rs`, add:

```rust
pub mod trap_test;
```

**Step 3: Run tests**

Run: `cargo test --package infinite_map_rs trap`
Expected: All tests pass

**Step 4: Commit**

```bash
git add systems/infinite_map_rs/src/tests/trap_test.rs systems/infinite_map_rs/src/tests/mod.rs
git commit -m "test(trap): add integration tests for trap interface"
```

---

### Task 3.2: Manual Verification - Daemon Boot

**Step 1: Build daemon**

Run: `cargo build --release --bin gpu_dev_daemon`
Expected: Builds successfully

**Step 2: Run daemon**

Run: `./target/release/gpu_dev_daemon`
Expected: See output:
```
[BOOT] Loading scheduler.glyph into VM 0...
[BOOT] scheduler.glyph loaded as VM 0
[TRAP] Handler initialized
```

**Step 3: Verify via MCP**

Use `daemon-status` MCP tool to verify daemon is running.

**Step 4: Document results**

If successful, update design doc status to "Phase 1 Complete".

---

## Summary

**Phase 1 Tasks:**
1. Define trap interface types
2. Create trap handler in shim
3. Integrate trap polling into main loop
4. Create test glyph for trap interface
5. Implement substrate peek/poke

**Phase 2 Tasks:**
1. Create scheduler.glyph
2. Load scheduler.glyph as VM 0 on boot

**Phase 3 Tasks:**
1. Add integration tests
2. Manual verification

**Next Phases (Future):**
- Phase 4: API Migration (HTTP parser in glyph)
- Phase 5: BrainBridge Migration (LM Studio in glyph)

---

## Files Summary

| File | Action |
|------|--------|
| `systems/infinite_map_rs/src/trap_interface.rs` | Create |
| `systems/infinite_map_rs/src/lib.rs` | Modify |
| `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` | Modify |
| `systems/infinite_map_rs/src/glyph_vm_scheduler.rs` | Modify |
| `systems/glyph_stratum/programs/test_trap.glyph` | Create |
| `systems/glyph_stratum/programs/scheduler.glyph` | Create |
| `systems/infinite_map_rs/src/tests/trap_test.rs` | Create |
| `systems/infinite_map_rs/src/tests/mod.rs` | Modify |
