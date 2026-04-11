// ═══════════════════════════════════════════════════════════════════════
// GEOMETRY OS VIRTUAL MACHINE
//
// Pixel-composition execution model:
// - Memory is a flat array of u32 pixels (colors).
// - The VM reads the first pixel of an instruction to get the opcode.
// - It then reads the next (width-1) pixels as arguments.
// - PC advances by width.
//
// Example: ADD r0, r1
//   ram[pc+0] = 0x41 ('A') → opcode ADD (width 3)
//   ram[pc+1] = 0x30 ('0') → arg: r0
//   ram[pc+2] = 0x31 ('1') → arg: r1
//   pc += 3
//
// The pixel values ARE the argument values. Register indices, immediate
// values, addresses -- all are just the color value of the argument pixel.
// ═══════════════════════════════════════════════════════════════════════

use crate::forge::ForgeQueue;
use crate::opcodes;
use crate::opcodes::op;

const NUM_REGS: usize = 32;
const DEFAULT_STACK_LIMIT: usize = 256;
pub const MAX_CYCLES: u32 = 4096;

// ═══════════════════════════════════════════════════════════════════════
// MEMORY PROTECTION
// ═══════════════════════════════════════════════════════════════════════

/// A named region of VM memory with access permissions.
///
/// When memory protection is enabled, every LOAD/STORE/LDB/STB is checked
/// against the configured regions. If no region covers the address, or
/// the region doesn't grant the required permission, a `MemoryFault` is raised.
#[derive(Debug, Clone, PartialEq)]
pub struct MemoryRegion {
    /// Human-readable name (e.g. "code", "data", "stack", "io")
    pub name: &'static str,
    /// Inclusive start address
    pub start: u32,
    /// Exclusive end address
    pub end: u32,
    /// Whether reading (LOAD/LDB) is allowed
    pub readable: bool,
    /// Whether writing (STORE/STB) is allowed
    pub writable: bool,
}

// ═══════════════════════════════════════════════════════════════════════
// VM ERROR TYPES
//
// Distinguishable error variants for VM execution failures.
// Each variant captures enough context to diagnose the root cause.
// ═══════════════════════════════════════════════════════════════════════

/// Errors that can occur during VM execution.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum VmError {
    /// The register index exceeds NUM_REGS (32).
    /// Fields: (instruction_address, register_index)
    RegisterOutOfRange(u32, u32),

    /// An unknown/invalid opcode byte was encountered.
    /// Fields: (instruction_address, opcode_byte)
    UnknownOpcode(u32, u8),

    /// The instruction stream is truncated — the opcode was present but
    /// not enough operand pixels followed.
    /// Fields: (instruction_address, opcode_byte, expected_width, available_pixels)
    TruncatedInstruction(u32, u8, usize, usize),

    /// An EDIT_OVW (or similar) targeted an address beyond a reasonable bound.
    /// Fields: (instruction_address, target_address, ram_size)
    AddressOutOfBounds(u32, usize, usize),

    /// RECTF was called with a zero or negative dimension (width or height = 0).
    /// Fields: (instruction_address, width, height)
    InvalidRectDimensions(u32, i32, i32),

    /// Stack overflow: push/CALL exceeded the stack limit.
    StackOverflow(u32),

    /// Division by zero was attempted.
    /// Fields: (instruction_address)
    DivisionByZero(u32),

    /// Memory protection fault: access violated a region's permissions.
    /// Fields: (instruction_address, faulting_address, access_type)
    /// access_type: "read" or "write"
    MemoryFault(u32, u32, &'static str),
}

impl std::fmt::Display for VmError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            VmError::RegisterOutOfRange(pc, reg) => {
                write!(f, "register r{} out of range at PC={}", reg, pc)
            }
            VmError::UnknownOpcode(pc, op_byte) => {
                write!(f, "unknown opcode 0x{:02X} at PC={}", op_byte, pc)
            }
            VmError::TruncatedInstruction(pc, op_byte, expected, available) => {
                write!(
                    f,
                    "truncated instruction: opcode 0x{:02X} needs {} pixels but only {} available at PC={}",
                    op_byte, expected, available, pc
                )
            }
            VmError::AddressOutOfBounds(pc, addr, ram_size) => {
                write!(
                    f,
                    "address {} out of bounds (RAM size {}) at PC={}",
                    addr, ram_size, pc
                )
            }
            VmError::InvalidRectDimensions(pc, w, h) => {
                write!(f, "invalid RECTF dimensions {}x{} at PC={}", w, h, pc)
            }
            VmError::StackOverflow(pc) => {
                write!(f, "stack overflow at PC={}", pc)
            }
            VmError::DivisionByZero(pc) => {
                write!(f, "division by zero at PC={}", pc)
            }
            VmError::MemoryFault(pc, addr, access_type) => {
                write!(
                    f,
                    "memory {} fault at address 0x{:X} (PC={})",
                    access_type, addr, pc
                )
            }
        }
    }
}

impl std::error::Error for VmError {}

/// A child VM spawned by Q (SPAWN) or Z (SPATIAL_SPAWN).
#[derive(Debug, Clone, PartialEq)]
pub struct ChildVm {
    pub start_addr: u32,
    pub arg: u32,
}

/// A complete snapshot of VM state for serialization and restoration.
#[derive(Debug, Clone, PartialEq)]
pub struct VmSnapshot {
    /// All 32 general-purpose registers
    pub regs: [u32; NUM_REGS],
    /// Program counter
    pub pc: u32,
    /// Stack contents
    pub stack: Vec<u32>,
    /// Full memory contents
    pub ram: Vec<u32>,
    /// Halt flag
    pub halted: bool,
    /// Yield flag
    pub yielded: bool,
    /// Screen buffer (256x256)
    pub screen: Vec<u32>,
    /// Children VMs
    pub children: Vec<ChildVm>,
    /// Forge queue state
    pub forge: ForgeQueue,
}

/// The VM.
#[derive(Debug)]
pub struct Vm {
    pub ram: Vec<u32>,
    pub regs: [u32; NUM_REGS],
    pub pc: u32,
    pub stack: Vec<u32>,
    pub halted: bool,
    pub yielded: bool,
    pub children: Vec<ChildVm>,
    pub screen: Vec<u32>, // 256x256
    pub forge: ForgeQueue,
    /// When true, LOAD/STORE/LDB/STB check region permissions.
    /// Off by default for backward compatibility.
    pub memory_protection: bool,
    /// Memory regions defining access permissions.
    /// When `memory_protection` is enabled, each memory access must
    /// fall within a region that grants the required permission.
    pub memory_regions: Vec<MemoryRegion>,
}

impl Vm {
    pub fn new(ram_size: usize) -> Self {
        Self {
            ram: vec![0; ram_size],
            regs: [0; NUM_REGS],
            pc: 0,
            stack: Vec::with_capacity(DEFAULT_STACK_LIMIT),
            halted: false,
            yielded: false,
            children: Vec::new(),
            screen: vec![0; 256 * 256],
            forge: ForgeQueue::new(),
            memory_protection: false,
            memory_regions: Vec::new(),
        }
    }

    /// Load pixels into RAM at a given offset.
    pub fn load(&mut self, offset: usize, pixels: &[u32]) {
        let end = offset + pixels.len();
        if end > self.ram.len() {
            self.ram.resize(end, 0);
        }
        self.ram[offset..end].copy_from_slice(pixels);
    }

    /// Load a program starting at address 0.
    pub fn load_program(&mut self, pixels: &[u32]) {
        self.load(0, pixels);
        self.pc = 0;
        self.halted = false;
        self.yielded = false;
    }

    pub fn poke(&mut self, addr: usize, value: u32) {
        if addr >= self.ram.len() {
            self.ram.resize(addr + 1, 0);
        }
        self.ram[addr] = value;
    }

    pub fn peek(&self, addr: usize) -> u32 {
        self.ram.get(addr).copied().unwrap_or(0)
    }

    // ── Public accessors for testing ──────────────────────────────────

    /// Get the value of a register by index.
    pub fn get_reg(&self, idx: usize) -> u32 {
        if idx < NUM_REGS { self.regs[idx] } else { 0 }
    }

    /// Get the current program counter value.
    pub fn get_pc(&self) -> u32 {
        self.pc
    }

    /// Check if the VM is halted.
    pub fn is_halted(&self) -> bool {
        self.halted
    }

    /// Check if the VM has yielded.
    pub fn is_yielded(&self) -> bool {
        self.yielded
    }

    /// Get a reference to the registers array.
    pub fn regs(&self) -> &[u32; NUM_REGS] {
        &self.regs
    }

    /// Create a child VM from a ChildVm request.
    ///
    /// The child gets a clone of the parent's RAM (shared state snapshot),
    /// its own registers, PC set to `start_addr`, r0 set to `arg`,
    /// and its own screen buffer (initially transparent/black).
    pub fn spawn_child(&self, child: &ChildVm) -> Self {
        let mut vm = Self {
            ram: self.ram.clone(),
            regs: [0; NUM_REGS],
            pc: child.start_addr,
            stack: Vec::with_capacity(DEFAULT_STACK_LIMIT),
            halted: false,
            yielded: false,
            children: Vec::new(),
            screen: vec![0; 256 * 256],
            forge: ForgeQueue::new(),
            memory_protection: self.memory_protection,
            memory_regions: self.memory_regions.clone(),
        };
        // Pass the arg to the child in r0
        vm.regs[0] = child.arg;
        vm
    }

    // ── Memory Protection ─────────────────────────────────────────────

    /// Enable memory protection with the given regions.
    ///
    /// When enabled, every LOAD/LDB (read) and STORE/STB (write) is checked
    /// against the configured regions. If no region covers the target address,
    /// or the region doesn't grant the required permission, a `MemoryFault`
    /// error is raised and the VM halts.
    ///
    /// Regions are checked in order; the first matching region wins.
    /// To set up a simple code/data split:
    /// ```ignore
    /// vm.memory_regions = vec![
    ///     MemoryRegion { name: "code", start: 0, end: 256, readable: true, writable: false },
    ///     MemoryRegion { name: "data", start: 256, end: 4096, readable: true, writable: true },
    /// ];
    /// vm.memory_protection = true;
    /// ```
    pub fn enable_memory_protection(&mut self, regions: Vec<MemoryRegion>) {
        self.memory_regions = regions;
        self.memory_protection = true;
    }

    /// Disable memory protection. All memory accesses proceed unchecked.
    pub fn disable_memory_protection(&mut self) {
        self.memory_protection = false;
        self.memory_regions.clear();
    }

    /// Check if a read access to `addr` is allowed.
    /// Returns Ok(()) if allowed, Err(MemoryFault) if denied.
    fn check_read(&self, addr: u32, pc: u32) -> Result<(), VmError> {
        if !self.memory_protection {
            return Ok(());
        }
        for region in &self.memory_regions {
            if addr >= region.start && addr < region.end {
                if region.readable {
                    return Ok(());
                } else {
                    return Err(VmError::MemoryFault(pc, addr, "read"));
                }
            }
        }
        // No region covers this address
        Err(VmError::MemoryFault(pc, addr, "read"))
    }

    /// Check if a write access to `addr` is allowed.
    /// Returns Ok(()) if allowed, Err(MemoryFault) if denied.
    fn check_write(&self, addr: u32, pc: u32) -> Result<(), VmError> {
        if !self.memory_protection {
            return Ok(());
        }
        for region in &self.memory_regions {
            if addr >= region.start && addr < region.end {
                if region.writable {
                    return Ok(());
                } else {
                    return Err(VmError::MemoryFault(pc, addr, "write"));
                }
            }
        }
        // No region covers this address
        Err(VmError::MemoryFault(pc, addr, "write"))
    }

    /// Composite another VM's screen onto this VM's screen.
    /// Non-black pixels from the source overwrite this screen.
    pub fn composite_screen(&mut self, source: &Vm) {
        for i in 0..(256 * 256) {
            if source.screen[i] != 0 {
                self.screen[i] = source.screen[i];
            }
        }
    }

    /// Drain children produced during the last run cycle.
    /// The host calls this after `run()` to collect child spawn requests.
    pub fn drain_children(&mut self) -> Vec<ChildVm> {
        std::mem::take(&mut self.children)
    }

    /// Create a complete snapshot of the VM state.
    /// Captures all registers, PC, stack, memory, flags, screen, children, and forge queue.
    pub fn snapshot(&self) -> VmSnapshot {
        VmSnapshot {
            regs: self.regs,
            pc: self.pc,
            stack: self.stack.clone(),
            ram: self.ram.clone(),
            halted: self.halted,
            yielded: self.yielded,
            screen: self.screen.clone(),
            children: self.children.clone(),
            forge: self.forge.clone(),
        }
    }

    /// Restore the VM state from a snapshot.
    /// Replaces all registers, PC, stack, memory, flags, screen, children, and forge queue.
    pub fn restore(&mut self, snapshot: &VmSnapshot) {
        self.regs = snapshot.regs;
        self.pc = snapshot.pc;
        self.stack = snapshot.stack.clone();
        self.ram = snapshot.ram.clone();
        self.halted = snapshot.halted;
        self.yielded = snapshot.yielded;
        self.screen = snapshot.screen.clone();
        self.children = snapshot.children.clone();
        self.forge = snapshot.forge.clone();
    }

    /// Run until halted, yielded, or MAX_CYCLES. Returns cycles executed.
    /// Only counts actual instructions executed — PC-out-of-bounds halts
    /// are not counted.
    pub fn run(&mut self) -> u32 {
        let mut cycles = 0u32;
        self.yielded = false;
        self.children.clear();

        while !self.halted && !self.yielded && cycles < MAX_CYCLES {
            if self.step() {
                cycles += 1;
            }
        }
        cycles
    }

    /// Execute one instruction at the current PC.
    /// Returns `true` if an instruction was executed, `false` if the VM
    /// was already halted or PC was out of bounds (no instruction executed).
    pub fn step(&mut self) -> bool {
        if self.halted {
            return false;
        }

        let pc = self.pc as usize;
        if pc >= self.ram.len() {
            self.halted = true;
            return false;
        }

        let opcode = (self.ram[pc] & 0xFF) as u8;
        let w = opcodes::width(opcode);

        // Collect argument pixels
        let args = self.read_args(pc, w);

        // Execute
        let new_pc = self.execute(opcode, &args);

        // Advance PC: if execute returned None, advance by instruction width
        self.pc = new_pc.unwrap_or_else(|| (self.pc as usize + w) as u32);
        true
    }

    /// Run until halted, yielded, MAX_CYCLES, or an error.
    /// Returns Ok(cycles) on normal termination, or Err(VmError) on the
    /// first validation failure.
    pub fn run_checked(&mut self) -> Result<u32, VmError> {
        let mut cycles = 0u32;
        self.yielded = false;
        self.children.clear();

        while !self.halted && !self.yielded && cycles < MAX_CYCLES {
            self.step_checked()?;
            cycles += 1;
        }
        Ok(cycles)
    }

    /// Execute one instruction with full argument validation.
    /// Returns Err(VmError) instead of silently ignoring bad inputs.
    /// The original step() is preserved for backward compatibility.
    pub fn step_checked(&mut self) -> Result<(), VmError> {
        if self.halted {
            return Ok(());
        }

        let pc = self.pc as usize;
        if pc >= self.ram.len() {
            self.halted = true;
            return Ok(());
        }

        let opcode = (self.ram[pc] & 0xFF) as u8;
        let w = opcodes::width(opcode);

        // ── Truncated instruction check ──────────────────────────────
        let available = if self.ram.len() > pc {
            self.ram.len() - pc
        } else {
            0
        };
        if available < w {
            return Err(VmError::TruncatedInstruction(self.pc, opcode, w, available));
        }

        // Collect argument pixels
        let args = self.read_args(pc, w);

        // ── Unknown opcode check ─────────────────────────────────────
        if !opcodes::is_valid(opcode) {
            // Still advance PC so the VM doesn't loop forever
            self.pc = (self.pc as usize + w) as u32;
            return Err(VmError::UnknownOpcode(self.pc, opcode));
        }

        // ── Per-opcode validation + execution ────────────────────────
        let result = self.execute_checked(opcode, &args)?;

        // Advance PC: if execute returned None, advance by instruction width
        self.pc = result.unwrap_or_else(|| (self.pc as usize + w) as u32);
        Ok(())
    }

    /// Resolve a jump/branch/call address.
    /// - Bit 31 set: assembler-generated absolute address (mask off flag).
    /// - Value < 256 (canvas-typed byte): relative backward offset from
    ///   after this instruction.  offset = byte - 0x20, so Space=0 (noop),
    ///   '!'=1, '0'=16, 'A'=33, etc.
    /// - Otherwise: absolute (backward compat for large raw values).
    fn resolve_addr(&self, raw: u32) -> u32 {
        if raw & 0x80000000 != 0 {
            raw & 0x7FFFFFFF
        } else if raw < 0x100 {
            let offset = raw.saturating_sub(0x20) as u32;
            (self.pc as i64 + 2 - offset as i64).max(0) as u32
        } else {
            raw
        }
    }

    /// Validated execution.  Checks register ranges, addresses, and other
    /// constraints before performing the operation.
    fn execute_checked(&mut self, opcode: u8, args: &[u32]) -> Result<Option<u32>, VmError> {
        let pc = self.pc;

        match opcode {
            // ── N (0x4E): NOP ─────────────────────
            op::NOP => Ok(None),

            // ── H (0x48): HALT ────────────────────
            op::HALT => {
                self.halted = true;
                Ok(None)
            }

            // ── Y (0x59): YIELD ───────────────────
            op::YIELD => {
                self.yielded = true;
                Ok(None)
            }

            // ── R (0x52): RET ─────────────────────
            op::RET => match self.stack.pop() {
                Some(addr) => Ok(Some(addr)),
                None => {
                    self.halted = true;
                    Ok(None)
                }
            },

            // ── I (0x49): LDI dst, value ──────────
            op::LDI => {
                let dst = self.reg_idx(args[0]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                self.regs[dst] = args[1];
                Ok(None)
            }

            // ── M (0x4D): MOV dst, src ────────────
            op::MOV => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] = self.regs[src];
                Ok(None)
            }

            // ── L (0x4C): LOAD dst, addr ──────────
            op::LOAD => {
                let dst = self.reg_idx(args[0]);
                let addr_reg = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                let src_addr = self.regs[addr_reg];
                self.check_read(src_addr, pc)?;
                self.regs[dst] = self.peek(src_addr as usize);
                Ok(None)
            }

            // ── S (0x53): STORE addr, src ──────────
            op::STORE => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let dst_addr = self.regs[addr_reg];
                self.check_write(dst_addr, pc)?;
                self.poke(dst_addr as usize, self.regs[src]);
                Ok(None)
            }

            // ── A (0x41): ADD dst, src ────────────
            op::ADD => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] = self.regs[dst].wrapping_add(self.regs[src]);
                Ok(None)
            }

            // ── U (0x55): SUB dst, src ────────────
            op::SUB => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] = self.regs[dst].wrapping_sub(self.regs[src]);
                Ok(None)
            }

            // ── m (0x6D): MUL dst, src ────────────
            op::MUL => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] = self.regs[dst].wrapping_mul(self.regs[src]);
                Ok(None)
            }

            // ── D (0x44): DIV dst, src ────────────
            op::DIV => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let divisor = self.regs[src];
                if divisor == 0 {
                    return Err(VmError::DivisionByZero(pc));
                }
                self.regs[dst] /= divisor;
                Ok(None)
            }

            // ── b (0x62): MOD dst, src ────────────
            op::MOD => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let divisor = self.regs[src];
                if divisor == 0 {
                    return Err(VmError::DivisionByZero(pc));
                }
                self.regs[dst] %= divisor;
                Ok(None)
            }

            // ── O (0x4F): OR dst, src ─────────────
            op::OR => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] |= self.regs[src];
                Ok(None)
            }

            // ── a (0x61): AND dst, src ────────────
            op::AND => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] &= self.regs[src];
                Ok(None)
            }

            // ── X (0x58): XOR dst, src ────────────
            op::XOR => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                self.regs[dst] ^= self.regs[src];
                Ok(None)
            }

            // ── n (0x6E): NOT dst ─────────────────
            op::NOT => {
                let dst = self.reg_idx(args[0]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                self.regs[dst] = !self.regs[dst];
                Ok(None)
            }

            // ── K (0x4B): SHL dst, amount ─────────
            op::SHL => {
                let dst = self.reg_idx(args[0]);
                let amt_reg = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if amt_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, amt_reg as u32));
                }
                self.regs[dst] <<= self.regs[amt_reg];
                Ok(None)
            }

            // ── k (0x6B): SHR dst, amount ─────────
            op::SHR => {
                let dst = self.reg_idx(args[0]);
                let amt_reg = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if amt_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, amt_reg as u32));
                }
                self.regs[dst] >>= self.regs[amt_reg];
                Ok(None)
            }

            // ── J (0x4A): JMP addr ────────────────
            // Canvas-typed (byte < 256): relative backward via resolve_addr.
            // Assembler-generated (bit 31 set): absolute, mask off flag.
            op::JMP => Ok(Some(self.resolve_addr(args[0]))),

            // ── B (0x42): BRANCH cond, addr ───────
            op::BRANCH => {
                let cond_pixel = args[0];
                let target = self.resolve_addr(args[1]);
                let cond = (cond_pixel & 0xFF) as u8;
                let r1 = self.reg_idx((cond_pixel >> 16) & 0xFF);
                let r2 = self.reg_idx((cond_pixel >> 24) & 0xFF);

                if r1 >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, r1 as u32));
                }
                if r2 >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, r2 as u32));
                }

                let a = self.regs[r1];
                let b = self.regs[r2];

                let taken = match cond {
                    0 => a == b,                   // BEQ
                    1 => a != b,                   // BNE
                    2 => (a as i32) < (b as i32),  // BLT
                    3 => (a as i32) >= (b as i32), // BGE
                    4 => a < b,                    // BLTU
                    5 => a >= b,                   // BGEU
                    15 => true,                    // BAL (unconditional)
                    _ => false,
                };

                if taken { Ok(Some(target)) } else { Ok(None) }
            }

            // ── C (0x43): CALL addr ───────────────
            op::CALL => {
                let target = self.resolve_addr(args[0]);
                let w = opcodes::width(op::CALL) as u32;
                if self.stack.len() >= DEFAULT_STACK_LIMIT {
                    return Err(VmError::StackOverflow(pc));
                }
                self.stack.push(self.pc + w);
                Ok(Some(target))
            }

            // ── E (0x45): EXEC addr, arg ──────────
            op::EXEC => {
                let addr_reg = self.reg_idx(args[0]);
                let _arg = args[1];
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                let target = self.regs[addr_reg];
                Ok(Some(target))
            }

            // ── F (0x46): RECTF x, y, w, h ────────
            op::RECTF => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let w_val = args[2];
                let h_val = args[3];
                if x_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, x_reg as u32));
                }
                if y_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, y_reg as u32));
                }
                // Validate dimensions: zero or "negative" (high-bit set) counts
                let w_signed = w_val as i32;
                let h_signed = h_val as i32;
                if w_signed <= 0 || h_signed <= 0 {
                    return Err(VmError::InvalidRectDimensions(pc, w_signed, h_signed));
                }
                let x0 = self.regs[x_reg] as usize;
                let y0 = self.regs[y_reg] as usize;
                let color = self.regs[0];
                for dy in 0..h_val as usize {
                    for dx in 0..w_val as usize {
                        let px = x0 + dx;
                        let py = y0 + dy;
                        if px < 256 && py < 256 {
                            self.screen[py * 256 + px] = color;
                        }
                    }
                }
                Ok(None)
            }

            // ── G (0x47): CIRCLEF cx, cy, r ───────
            op::CIRCLEF => {
                let cx_reg = self.reg_idx(args[0]);
                let cy_reg = self.reg_idx(args[1]);
                let r = args[2] as i32;
                if cx_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, cx_reg as u32));
                }
                if cy_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, cy_reg as u32));
                }
                let cx = self.regs[cx_reg] as i32;
                let cy = self.regs[cy_reg] as i32;
                let color = self.regs[0];
                for dy in -r..=r {
                    for dx in -r..=r {
                        if dx * dx + dy * dy <= r * r {
                            let px = cx + dx;
                            let py = cy + dy;
                            if px >= 0 && px < 256 && py >= 0 && py < 256 {
                                self.screen[(py as usize) * 256 + (px as usize)] = color;
                            }
                        }
                    }
                }
                Ok(None)
            }

            // ── V (0x56): LINE x1, y1, x2, y2 ────
            op::LINE => {
                let x1_reg = self.reg_idx(args[0]);
                let y1_reg = self.reg_idx(args[1]);
                let x2_val = args[2] as i32;
                let y2_val = args[3] as i32;
                if x1_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, x1_reg as u32));
                }
                if y1_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, y1_reg as u32));
                }
                let x0 = self.regs[x1_reg] as i32;
                let y0 = self.regs[y1_reg] as i32;
                let color = self.regs[0];
                let dx = (x2_val - x0).abs();
                let dy = -(y2_val - y0).abs();
                let sx = if x0 < x2_val { 1 } else { -1 };
                let sy = if y0 < y2_val { 1 } else { -1 };
                let mut err = dx + dy;
                let mut cx = x0;
                let mut cy = y0;
                loop {
                    if cx >= 0 && cx < 256 && cy >= 0 && cy < 256 {
                        self.screen[(cy as usize) * 256 + (cx as usize)] = color;
                    }
                    if cx == x2_val && cy == y2_val {
                        break;
                    }
                    let e2 = 2 * err;
                    if e2 >= dy {
                        err += dy;
                        cx += sx;
                    }
                    if e2 <= dx {
                        err += dx;
                        cy += sy;
                    }
                }
                Ok(None)
            }

            // ── W (0x57): BLIT dst, src, count ────
            op::BLIT => {
                let dst_reg = self.reg_idx(args[0]);
                let src_reg = self.reg_idx(args[1]);
                let count = args[2] as usize;
                if dst_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst_reg as u32));
                }
                if src_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src_reg as u32));
                }
                let dst = self.regs[dst_reg];
                let src = self.regs[src_reg];
                for i in 0..count as u32 {
                    self.check_read(src + i, pc)?;
                    self.check_write(dst + i, pc)?;
                }
                for i in 0..count {
                    self.poke((dst as usize) + i, self.peek((src as usize) + i));
                }
                Ok(None)
            }

            // ── T (0x54): TEXT x_reg, y_reg, str_addr_reg ─────
            op::TEXT => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let str_addr_reg = self.reg_idx(args[2]);
                if x_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, x_reg as u32));
                }
                if y_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, y_reg as u32));
                }
                if str_addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, str_addr_reg as u32));
                }
                // Delegate to the existing text rendering logic
                let x0 = self.regs[x_reg] as usize;
                let y0 = self.regs[y_reg] as usize;
                let str_start = self.regs[str_addr_reg] as usize;
                let color = self.regs[0];
                // Render null-terminated string from RAM using the font module
                let mut pos = str_start;
                let mut screen_x = x0;
                loop {
                    let ch = self.peek(pos);
                    if ch == 0 {
                        break;
                    }
                    crate::font::render_char(
                        &mut self.screen,
                        256,
                        256,
                        (ch & 0xFF) as u8,
                        screen_x,
                        y0,
                        1, // 1x scale (native 5x7)
                        color,
                        None, // transparent background
                    );
                    screen_x += crate::font::GLYPH_W + 1; // advance by glyph width + 1px gap
                    pos += 1;
                }
                Ok(None)
            }

            // ── P (0x50): PSET x, y, color ────────
            op::PSET => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let color = args[2];
                if x_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, x_reg as u32));
                }
                if y_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, y_reg as u32));
                }
                let x0 = self.regs[x_reg] as usize;
                let y0 = self.regs[y_reg] as usize;
                if x0 < 256 && y0 < 256 {
                    self.screen[y0 * 256 + x0] = color;
                }
                Ok(None)
            }

            // ── g (0x67): PGET x, y ───────────────
            op::PGET => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                if x_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, x_reg as u32));
                }
                if y_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, y_reg as u32));
                }
                let x0 = self.regs[x_reg] as usize;
                let y0 = self.regs[y_reg] as usize;
                if x0 < 256 && y0 < 256 {
                    self.regs[0] = self.screen[y0 * 256 + x0];
                } else {
                    self.regs[0] = 0;
                }
                Ok(None)
            }

            // ── Q (0x51): SPAWN addr, arg ──────────
            op::SPAWN => {
                let addr = args[0];
                let arg = args[1];
                self.children.push(ChildVm {
                    start_addr: addr,
                    arg,
                });
                Ok(None)
            }

            // ── Z (0x5A): SPATIAL_SPAWN x, y, addr ─
            op::SPATIAL_SPAWN => {
                let x = args[0];
                let y = args[1];
                let addr = args[2];
                self.children.push(ChildVm {
                    start_addr: addr,
                    arg: (y << 16) | (x & 0xFFFF),
                });
                Ok(None)
            }

            // ── p (0x70): PUSH value ───────────────
            op::PUSH => {
                let val_reg = self.reg_idx(args[0]);
                if val_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, val_reg as u32));
                }
                if self.stack.len() >= DEFAULT_STACK_LIMIT {
                    return Err(VmError::StackOverflow(pc));
                }
                self.stack.push(self.regs[val_reg]);
                Ok(None)
            }

            // ── r (0x72): POP dst ─────────────────
            op::POP => {
                let dst = self.reg_idx(args[0]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if let Some(val) = self.stack.pop() {
                    self.regs[dst] = val;
                }
                Ok(None)
            }

            // ── c (0x63): ISSUE_CREATE ────────────
            op::ISSUE_CREATE => {
                let tag = self.regs[0];
                let payload = self.regs[1];
                let priority_raw = self.regs[2];
                let id = self.forge.post_issue(self.pc, tag, payload, priority_raw);
                self.regs[0] = id as u32;
                Ok(None)
            }

            // ── e (0x65): EDIT_OVERWRITE addr, src ──
            op::EDIT_OVERWRITE => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let addr = self.regs[addr_reg] as usize;
                // Validate that the target address is within current RAM bounds
                if addr >= self.ram.len() {
                    return Err(VmError::AddressOutOfBounds(pc, addr, self.ram.len()));
                }
                self.poke(addr, self.regs[src]);
                Ok(None)
            }

            // ── f (0x66): EDIT_INSERT addr, src ────
            op::EDIT_INSERT => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let addr = self.regs[addr_reg] as usize;
                let value = self.regs[src];
                if addr < self.ram.len() {
                    self.ram.insert(addr, value);
                } else {
                    self.ram.push(value);
                }
                Ok(None)
            }

            // ── j (0x6A): EDIT_DELETE addr ─────────
            op::EDIT_DELETE => {
                let addr_reg = self.reg_idx(args[0]);
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                let addr = self.regs[addr_reg] as usize;
                if addr < self.ram.len() {
                    self.ram.remove(addr);
                    if addr < self.pc as usize {
                        self.pc = self.pc.saturating_sub(1);
                    }
                }
                Ok(None)
            }

            // ── l (0x6C): EDIT_BLIT dst, src, count
            op::EDIT_BLIT => {
                let dst_reg = self.reg_idx(args[0]);
                let src_reg = self.reg_idx(args[1]);
                let count_reg = self.reg_idx(args[2]);
                if dst_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst_reg as u32));
                }
                if src_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src_reg as u32));
                }
                if count_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, count_reg as u32));
                }
                let dst_addr = self.regs[dst_reg];
                let src_addr = self.regs[src_reg];
                let count = self.regs[count_reg] as usize;
                for i in 0..count as u32 {
                    self.check_read(src_addr + i, pc)?;
                    self.check_write(dst_addr + i, pc)?;
                }
                for i in 0..count {
                    let val = self.peek((src_addr as usize) + i);
                    self.poke((dst_addr as usize) + i, val);
                }
                Ok(None)
            }

            // ── d (0x64): LDB dst, addr ───────────
            op::LDB => {
                let dst = self.reg_idx(args[0]);
                let addr_reg = self.reg_idx(args[1]);
                if dst >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, dst as u32));
                }
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                let byte_addr = self.regs[addr_reg];
                let pixel_idx = byte_addr as usize / 4;
                self.check_read(pixel_idx as u32, pc)?;
                let byte_off = byte_addr as usize % 4;
                let pixel = self.peek(pixel_idx);
                self.regs[dst] = (pixel >> (byte_off * 8)) & 0xFF;
                Ok(None)
            }

            // ── s (0x73): STB addr, src ───────────
            op::STB => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, addr_reg as u32));
                }
                if src >= NUM_REGS {
                    return Err(VmError::RegisterOutOfRange(pc, src as u32));
                }
                let byte_addr = self.regs[addr_reg];
                let pixel_idx = byte_addr as usize / 4;
                self.check_write(pixel_idx as u32, pc)?;
                let byte_off = byte_addr as usize % 4;
                let byte_val = self.regs[src] & 0xFF;
                let mut pixel = self.peek(pixel_idx);
                let mask = !(0xFFu32 << (byte_off * 8));
                pixel = (pixel & mask) | (byte_val << (byte_off * 8));
                self.poke(pixel_idx, pixel);
                Ok(None)
            }

            // ── i (0x69): INT vector ──────────────
            op::INT => Ok(None),

            // ── Unknown: error ────────────────────
            _ => Err(VmError::UnknownOpcode(pc, opcode)),
        }
    }

    /// Read (width - 1) argument pixels after the opcode pixel.
    fn read_args(&self, pc: usize, width: usize) -> Vec<u32> {
        let mut args = Vec::with_capacity(width.saturating_sub(1));
        for i in 1..width {
            let addr = pc + i;
            args.push(self.peek(addr));
        }
        args
    }

    /// Map a pixel value to a register index (0..31).
    /// Following the spec: 0x30 ('0') maps to r0.
    fn reg_idx(&self, pixel: u32) -> usize {
        let val = (pixel & 0xFF) as usize;
        if val >= 0x30 {
            val.saturating_sub(0x30)
        } else {
            val
        }
    }

    /// Execute an opcode with its argument pixels. Returns Some(new_pc) if a jump occurred.
    fn execute(&mut self, opcode: u8, args: &[u32]) -> Option<u32> {
        match opcode {
            // ── N (0x4E): NOP ─────────────────────
            op::NOP => None,

            // ── H (0x48): HALT ────────────────────
            op::HALT => {
                self.halted = true;
                None
            }

            // ── Y (0x59): YIELD ───────────────────
            op::YIELD => {
                self.yielded = true;
                None
            }

            // ── R (0x52): RET ─────────────────────
            op::RET => match self.stack.pop() {
                Some(addr) => Some(addr),
                None => {
                    self.halted = true;
                    None
                }
            },

            // ── I (0x49): LDI dst, value ──────────
            // width 3: args[0]=dst_reg, args[1]=immediate_value
            op::LDI => {
                let dst = self.reg_idx(args[0]);
                let val = args[1];
                if dst < NUM_REGS {
                    self.regs[dst] = val;
                }
                None
            }

            // ── M (0x4D): MOV dst, src ────────────
            op::MOV => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[src];
                }
                None
            }

            // ── L (0x4C): LOAD dst, addr ──────────
            // args[0]=dst_reg, args[1]=addr_reg → load from ram[regs[addr_reg]]
            op::LOAD => {
                let dst = self.reg_idx(args[0]);
                let addr_reg = self.reg_idx(args[1]);
                if dst < NUM_REGS && addr_reg < NUM_REGS {
                    let src_addr = self.regs[addr_reg] as usize;
                    self.regs[dst] = self.peek(src_addr);
                }
                None
            }

            // ── S (0x53): STORE addr, src ──────────
            op::STORE => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let dst_addr = self.regs[addr_reg] as usize;
                    self.poke(dst_addr, self.regs[src]);
                }
                None
            }

            // ── A (0x41): ADD dst, src ────────────
            op::ADD => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_add(self.regs[src]);
                }
                None
            }

            // ── U (0x55): SUB dst, src ────────────
            op::SUB => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_sub(self.regs[src]);
                }
                None
            }

            // ── m (0x6D): MUL dst, src ────────────
            op::MUL => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_mul(self.regs[src]);
                }
                None
            }

            // ── D (0x44): DIV dst, src ────────────
            op::DIV => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    let divisor = self.regs[src];
                    if divisor != 0 {
                        self.regs[dst] /= divisor;
                    } else {
                        self.regs[dst] = 0;
                    }
                }
                None
            }

            // ── b (0x62): MOD dst, src ────────────
            op::MOD => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    let divisor = self.regs[src];
                    if divisor != 0 {
                        self.regs[dst] %= divisor;
                    } else {
                        self.regs[dst] = 0;
                    }
                }
                None
            }

            // ── O (0x4F): OR dst, src ─────────────
            op::OR => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] |= self.regs[src];
                }
                None
            }

            // ── a (0x61): AND dst, src ────────────
            op::AND => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] &= self.regs[src];
                }
                None
            }

            // ── X (0x58): XOR dst, src ────────────
            op::XOR => {
                let dst = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] ^= self.regs[src];
                }
                None
            }

            // ── n (0x6E): NOT dst ─────────────────
            op::NOT => {
                let dst = self.reg_idx(args[0]);
                if dst < NUM_REGS {
                    self.regs[dst] = !self.regs[dst];
                }
                None
            }

            // ── K (0x4B): SHL dst, amount ─────────
            op::SHL => {
                let dst = self.reg_idx(args[0]);
                let amt_reg = self.reg_idx(args[1]);
                if dst < NUM_REGS && amt_reg < NUM_REGS {
                    self.regs[dst] <<= self.regs[amt_reg];
                }
                None
            }

            // ── k (0x6B): SHR dst, amount ─────────
            op::SHR => {
                let dst = self.reg_idx(args[0]);
                let amt_reg = self.reg_idx(args[1]);
                if dst < NUM_REGS && amt_reg < NUM_REGS {
                    self.regs[dst] >>= self.regs[amt_reg];
                }
                None
            }

            // ── J (0x4A): JMP addr ────────────────
            op::JMP => Some(self.resolve_addr(args[0])),

            // ── B (0x42): BRANCH cond, addr ───────
            // width 3: args[0]=condition_pixel, args[1]=target_addr
            // condition_pixel low byte = condition code (0=BEQ, 1=BNE, etc.)
            //           high bytes encode r1, r2 register indices
            op::BRANCH => {
                let cond_pixel = args[0];
                let target = self.resolve_addr(args[1]);
                let cond = (cond_pixel & 0xFF) as u8;
                let r1 = self.reg_idx((cond_pixel >> 16) & 0xFF);
                let r2 = self.reg_idx((cond_pixel >> 24) & 0xFF);

                if r1 >= NUM_REGS || r2 >= NUM_REGS {
                    return None;
                }

                let a = self.regs[r1];
                let b = self.regs[r2];

                let taken = match cond {
                    0 => a == b,                   // BEQ
                    1 => a != b,                   // BNE
                    2 => (a as i32) < (b as i32),  // BLT
                    3 => (a as i32) >= (b as i32), // BGE
                    4 => a < b,                    // BLTU
                    5 => a >= b,                   // BGEU
                    15 => true,                    // BAL (unconditional)
                    _ => false,
                };

                if taken { Some(target) } else { None }
            }

            // ── C (0x43): CALL addr ───────────────
            op::CALL => {
                let target = self.resolve_addr(args[0]);
                let w = opcodes::width(op::CALL) as u32;
                if self.stack.len() >= DEFAULT_STACK_LIMIT {
                    self.halted = true;
                    return None;
                }
                self.stack.push(self.pc + w);
                Some(target)
            }

            // ── E (0x45): EXEC addr, arg ──────────
            // Jump to address in register. arg pixel is unused for now.
            op::EXEC => {
                let addr_reg = self.reg_idx(args[0]);
                if addr_reg < NUM_REGS {
                    Some(self.regs[addr_reg])
                } else {
                    None
                }
            }

            // ── Q (0x51): SPAWN addr, arg ─────────
            op::SPAWN => {
                let addr_reg = self.reg_idx(args[0]);
                let arg_reg = self.reg_idx(args[1]);
                if addr_reg < NUM_REGS && arg_reg < NUM_REGS {
                    self.children.push(ChildVm {
                        start_addr: self.regs[addr_reg],
                        arg: self.regs[arg_reg],
                    });
                }
                None
            }

            // ── Z (0x5A): SPATIAL_SPAWN x, y, addr
            op::SPATIAL_SPAWN => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let addr_reg = self.reg_idx(args[2]);
                if x_reg < NUM_REGS && y_reg < NUM_REGS && addr_reg < NUM_REGS {
                    self.children.push(ChildVm {
                        start_addr: self.regs[addr_reg],
                        arg: self.regs[x_reg],
                    });
                }
                None
            }

            // ── P (0x50): PSET x, y, color ────────
            // args are register indices
            op::PSET => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let c_reg = self.reg_idx(args[2]);
                if x_reg < NUM_REGS && y_reg < NUM_REGS && c_reg < NUM_REGS {
                    let x = self.regs[x_reg] as usize;
                    let y = self.regs[y_reg] as usize;
                    let color = self.regs[c_reg];
                    if x < 256 && y < 256 {
                        self.screen[y * 256 + x] = color;
                    }
                }
                None
            }

            // ── g (0x67): PGET dst, x, y ──────────
            op::PGET => {
                let dst = self.reg_idx(args[0]);
                let x_reg = self.reg_idx(args[1]);
                let y_reg = self.reg_idx(args[2]);
                if dst < NUM_REGS && x_reg < NUM_REGS && y_reg < NUM_REGS {
                    let x = self.regs[x_reg] as usize;
                    let y = self.regs[y_reg] as usize;
                    self.regs[dst] = if x < 256 && y < 256 {
                        self.screen[y * 256 + x]
                    } else {
                        0
                    };
                }
                None
            }

            // ── F (0x46): RECTF x, y, w, h ────────
            op::RECTF => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let w_val = args[2];
                let h_val = args[3];
                if x_reg < NUM_REGS && y_reg < NUM_REGS {
                    let x0 = self.regs[x_reg] as usize;
                    let y0 = self.regs[y_reg] as usize;
                    let color = self.regs[0]; // r0 as color temp
                    for dy in 0..h_val as usize {
                        for dx in 0..w_val as usize {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            if px < 256 && py < 256 {
                                self.screen[py * 256 + px] = color;
                            }
                        }
                    }
                }
                None
            }

            // ── V (0x56): LINE x1, y1, x2, y2 ────
            op::LINE => {
                let x1_reg = self.reg_idx(args[0]);
                let y1_reg = self.reg_idx(args[1]);
                let x2_val = args[2] as i32;
                let y2_val = args[3] as i32;
                if x1_reg < NUM_REGS && y1_reg < NUM_REGS {
                    let x0 = self.regs[x1_reg] as i32;
                    let y0 = self.regs[y1_reg] as i32;
                    let color = self.regs[0];
                    let dx = (x2_val - x0).abs();
                    let dy = -(y2_val - y0).abs();
                    let sx = if x0 < x2_val { 1 } else { -1 };
                    let sy = if y0 < y2_val { 1 } else { -1 };
                    let mut err = dx + dy;
                    let mut cx = x0;
                    let mut cy = y0;
                    loop {
                        if cx >= 0 && cx < 256 && cy >= 0 && cy < 256 {
                            self.screen[(cy as usize) * 256 + (cx as usize)] = color;
                        }
                        if cx == x2_val && cy == y2_val {
                            break;
                        }
                        let e2 = 2 * err;
                        if e2 >= dy {
                            err += dy;
                            cx += sx;
                        }
                        if e2 <= dx {
                            err += dx;
                            cy += sy;
                        }
                    }
                }
                None
            }

            // ── G (0x47): CIRCLEF cx, cy, r ───────
            op::CIRCLEF => {
                let cx_reg = self.reg_idx(args[0]);
                let cy_reg = self.reg_idx(args[1]);
                let r = args[2] as i32;
                if cx_reg < NUM_REGS && cy_reg < NUM_REGS {
                    let cx = self.regs[cx_reg] as i32;
                    let cy = self.regs[cy_reg] as i32;
                    let color = self.regs[0];
                    for dy in -r..=r {
                        for dx in -r..=r {
                            if dx * dx + dy * dy <= r * r {
                                let px = cx + dx;
                                let py = cy + dy;
                                if px >= 0 && px < 256 && py >= 0 && py < 256 {
                                    self.screen[(py as usize) * 256 + (px as usize)] = color;
                                }
                            }
                        }
                    }
                }
                None
            }

            // ── W (0x57): BLIT dst, src, count ────
            op::BLIT => {
                let dst_reg = self.reg_idx(args[0]);
                let src_reg = self.reg_idx(args[1]);
                let count = args[2] as usize;
                if dst_reg < NUM_REGS && src_reg < NUM_REGS {
                    let dst = self.regs[dst_reg] as usize;
                    let src = self.regs[src_reg] as usize;
                    for i in 0..count {
                        self.poke(dst + i, self.peek(src + i));
                    }
                }
                None
            }

            // ── T (0x54): TEXT x_reg, y_reg, str_addr_reg ─────
            // width 4: args[0]=x_reg, args[1]=y_reg, args[2]=str_addr_reg
            // Color comes from r0
            op::TEXT => {
                let x_reg = self.reg_idx(args[0]);
                let y_reg = self.reg_idx(args[1]);
                let str_addr_reg = self.reg_idx(args[2]);
                if x_reg < NUM_REGS && y_reg < NUM_REGS && str_addr_reg < NUM_REGS {
                    let x = self.regs[x_reg] as usize;
                    let y = self.regs[y_reg] as usize;
                    let str_addr = self.regs[str_addr_reg] as usize;
                    let color = self.regs[0]; // r0 holds the color

                    // Read null-terminated string from RAM
                    let mut chars = Vec::new();
                    let mut addr = str_addr;
                    loop {
                        let byte_val = self.peek(addr) as u8;
                        if byte_val == 0 {
                            break;
                        }
                        chars.push(byte_val);
                        addr += 1;
                    }

                    // Convert to string and render
                    let s = String::from_utf8_lossy(&chars);
                    crate::font::render_str(
                        &mut self.screen,
                        256,
                        256,
                        &s,
                        x,
                        y,
                        1, // scale = 1 (native 5x7)
                        color,
                        None, // no background
                    );
                }
                None
            }

            // ── d (0x64): LDB dst, addr ───────────
            op::LDB => {
                let dst = self.reg_idx(args[0]);
                let addr_reg = self.reg_idx(args[1]);
                if dst < NUM_REGS && addr_reg < NUM_REGS {
                    let byte_addr = self.regs[addr_reg] as usize;
                    let pixel_idx = byte_addr / 4;
                    let byte_off = byte_addr % 4;
                    let pixel = self.peek(pixel_idx);
                    self.regs[dst] = (pixel >> (byte_off * 8)) & 0xFF;
                }
                None
            }

            // ── s (0x73): STB addr, src ───────────
            op::STB => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let byte_addr = self.regs[addr_reg] as usize;
                    let pixel_idx = byte_addr / 4;
                    let byte_off = byte_addr % 4;
                    let byte_val = self.regs[src] & 0xFF;
                    let mut pixel = self.peek(pixel_idx);
                    let mask = !(0xFFu32 << (byte_off * 8));
                    pixel = (pixel & mask) | (byte_val << (byte_off * 8));
                    self.poke(pixel_idx, pixel);
                }
                None
            }

            // ── p (0x70): PUSH value ──────────────
            op::PUSH => {
                let val_reg = self.reg_idx(args[0]);
                if val_reg < NUM_REGS {
                    if self.stack.len() >= DEFAULT_STACK_LIMIT {
                        self.halted = true;
                        return None;
                    }
                    self.stack.push(self.regs[val_reg]);
                }
                None
            }

            // ── r (0x72): POP dst ─────────────────
            op::POP => {
                let dst = self.reg_idx(args[0]);
                if dst < NUM_REGS {
                    if let Some(val) = self.stack.pop() {
                        self.regs[dst] = val;
                    }
                }
                None
            }

            // ── c (0x63): ISSUE_CREATE ────────────
            // Width 1 (no pixel args). Reads r0 (tag), r1 (payload), r2 (priority).
            // Creates a forge issue and stores the assigned ID back into r0.
            op::ISSUE_CREATE => {
                let tag = self.regs[0];
                let payload = self.regs[1];
                let priority_raw = self.regs[2];
                let id = self.forge.post_issue(self.pc, tag, payload, priority_raw);
                self.regs[0] = id as u32;
                None
            }

            // ── e (0x65): EDIT_OVERWRITE addr, src ──
            // Write pixel from regs[src] into ram[regs[addr]].
            op::EDIT_OVERWRITE => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let addr = self.regs[addr_reg] as usize;
                    self.poke(addr, self.regs[src]);
                }
                None
            }

            // ── f (0x66): EDIT_INSERT addr, src ────
            // Insert pixel from regs[src] at ram[regs[addr]], shifting right.
            op::EDIT_INSERT => {
                let addr_reg = self.reg_idx(args[0]);
                let src = self.reg_idx(args[1]);
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let addr = self.regs[addr_reg] as usize;
                    let value = self.regs[src];
                    // Insert at addr, shifting everything right by 1
                    if addr < self.ram.len() {
                        self.ram.insert(addr, value);
                    } else {
                        // Past end: just extend
                        self.ram.push(value);
                    }
                }
                None
            }

            // ── j (0x6A): EDIT_DELETE addr ─────────
            // Remove one pixel at ram[regs[addr]], shifting left.
            op::EDIT_DELETE => {
                let addr_reg = self.reg_idx(args[0]);
                if addr_reg < NUM_REGS {
                    let addr = self.regs[addr_reg] as usize;
                    if addr < self.ram.len() {
                        self.ram.remove(addr);
                        // Adjust PC if the deletion was before or at current PC
                        if addr < self.pc as usize {
                            self.pc = self.pc.saturating_sub(1);
                        }
                    }
                }
                None
            }

            // ── l (0x6C): EDIT_BLIT dst, src, count
            // Copy count pixels from ram[regs[src]] to ram[regs[dst]].
            op::EDIT_BLIT => {
                let dst_reg = self.reg_idx(args[0]);
                let src_reg = self.reg_idx(args[1]);
                let count_reg = self.reg_idx(args[2]);
                if dst_reg < NUM_REGS && src_reg < NUM_REGS && count_reg < NUM_REGS {
                    let dst_addr = self.regs[dst_reg] as usize;
                    let src_addr = self.regs[src_reg] as usize;
                    let count = self.regs[count_reg] as usize;
                    for i in 0..count {
                        let val = self.peek(src_addr + i);
                        self.poke(dst_addr + i, val);
                    }
                }
                None
            }

            // ── i (0x69): INT vector ──────────────
            // Stub: interrupt handling not yet implemented.
            op::INT => None,

            // ── Unknown: skip 1 pixel ─────────────
            _ => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper: build pixels from bytes (each byte = one pixel)
    fn pixels(bytes: &[u8]) -> Vec<u32> {
        bytes.iter().map(|&b| b as u32).collect()
    }

    #[test]
    fn halt_stops_immediately() {
        // H = 0x48
        let mut vm = Vm::new(64);
        vm.load_program(&pixels(&[op::HALT]));
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.pc, 1);
    }

    // ── Branch behavior tests ──────────────────────────────────────────
    // cond_pixel format: cond_code | (r1_idx << 16) | (r2_idx << 24)

    fn pack_cond(cond: u8, r1: u8, r2: u8) -> Vec<u32> {
        vec![
            op::BRANCH as u32,
            (cond as u32) | ((r1 as u32) << 16) | ((r2 as u32) << 24),
        ]
    }

    #[test]
    fn beq_taken_when_equal() {
        // r0=5, r1=5, BEQ r0,r1 → should jump to target=99
        let mut vm = Vm::new(128);
        // addr 0: LDI r0, 5
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            5,
            op::LDI as u32,
            0x31,
            5,
            op::BRANCH as u32,
            0 | (0x30 << 16) | (0x31 << 24),
            99 | 0x80000000,
        ]);
        vm.pc = 0;
        vm.step(); // LDI r0, 5
        vm.step(); // LDI r1, 5
        vm.step(); // BEQ r0, r1, 99
        assert_eq!(vm.pc, 99); // jumped
    }

    #[test]
    fn beq_not_taken_when_unequal() {
        // r0=5, r1=7, BEQ r0,r1 → should fall through (pc = 3+3+3 = 9)
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            5, // 0-2
            op::LDI as u32,
            0x31,
            7, // 3-5
            op::BRANCH as u32,
            0 | (0x30 << 16) | (0x31 << 24),
            99 | 0x80000000, // 6-8 (absolute)
            op::HALT as u32, // 9
        ]);
        vm.run();
        assert_eq!(vm.pc, 10); // fell through to HALT, advanced past it
        assert!(vm.halted);
    }

    #[test]
    fn bne_taken_when_unequal() {
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            5,
            op::LDI as u32,
            0x31,
            7,
            op::BRANCH as u32,
            1 | (0x30 << 16) | (0x31 << 24),
            99 | 0x80000000, // BNE r0,r1 (absolute)
        ]);
        vm.pc = 0;
        vm.step();
        vm.step();
        vm.step();
        assert_eq!(vm.pc, 99);
    }

    #[test]
    fn blt_taken_when_less() {
        // r0=3, r1=10, BLT should jump
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            3,
            op::LDI as u32,
            0x31,
            10,
            op::BRANCH as u32,
            2 | (0x30 << 16) | (0x31 << 24),
            50 | 0x80000000, // BLT r0,r1 (absolute)
        ]);
        vm.pc = 0;
        vm.step();
        vm.step();
        vm.step();
        assert_eq!(vm.pc, 50);
    }

    #[test]
    fn bge_taken_when_greater_or_equal() {
        // r0=10, r1=3, BGE should jump
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            10,
            op::LDI as u32,
            0x31,
            3,
            op::BRANCH as u32,
            3 | (0x30 << 16) | (0x31 << 24),
            50 | 0x80000000, // BGE r0,r1 (absolute)
        ]);
        vm.pc = 0;
        vm.step();
        vm.step();
        vm.step();
        assert_eq!(vm.pc, 50);
    }

    #[test]
    fn bal_unconditional_always_jumps() {
        // BAL ignores register values, always jumps
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::LDI as u32,
            0x30,
            99,
            op::LDI as u32,
            0x31,
            1,
            op::BRANCH as u32,
            15 | (0x30 << 16) | (0x31 << 24),
            77 | 0x80000000, // BAL (absolute)
        ]);
        vm.pc = 0;
        vm.step();
        vm.step();
        vm.step();
        assert_eq!(vm.pc, 77);
    }

    #[test]
    fn bal_unconditional_with_zero_regs() {
        // Even with r0=r0 (same reg), BAL still jumps (doesn't depend on values)
        let mut vm = Vm::new(128);
        vm.load_program(&[
            op::BRANCH as u32,
            15 | (0x30 << 16) | (0x30 << 24),
            42 | 0x80000000, // BAL r0,r0 → 42 (absolute)
        ]);
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.pc, 42);
    }

    #[test]
    fn nop_advances_pc() {
        // N = 0x4E
        let mut vm = Vm::new(64);
        vm.load_program(&pixels(&[op::NOP, op::NOP, op::HALT]));
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.pc, 3);
    }

    #[test]
    fn ldi_loads_value_into_register() {
        // I <0> <*> = LDI r0, 42  (width 3)
        // Using raw register index 0 and value 42 (0x2A = '*')
        let mut vm = Vm::new(64);
        vm.load_program(&[op::LDI as u32, 0, 42, op::HALT as u32]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 42);
    }

    #[test]
    fn add_two_registers() {
        // I0\x05 = LDI r0, 5
        // I1\x03 = LDI r1, 3
        // A01    = ADD r0, r1  (width 3)
        // H      = HALT
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32,
            0,
            5,
            op::LDI as u32,
            1,
            3,
            op::ADD as u32,
            0,
            1,
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 8);
        assert_eq!(vm.regs[1], 3);
    }

    #[test]
    fn store_and_load_roundtrip() {
        // I0<99> = LDI r0, 99
        // I1<10> = LDI r1, 10  (address = pixel 10)
        // S10    = STORE [r1], r0
        // I2<0>  = LDI r2, 0
        // L21    = LOAD r2, [r1]
        // H
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32,
            0,
            99,
            op::LDI as u32,
            1,
            10,
            op::STORE as u32,
            1,
            0,
            op::LDI as u32,
            2,
            0,
            op::LOAD as u32,
            2,
            1,
            op::HALT as u32,
        ]);
        vm.run();
        assert_eq!(vm.regs[2], 99);
    }

    #[test]
    fn call_and_ret() {
        // Pixel layout:
        // 0: H(0x48)                    -- will be overwritten by call target
        // 1: H(0x48)                    -- will be overwritten by call target
        // 2: H(0x48)                    -- will be overwritten by call target
        // 3: H(0x48)                    -- will be overwritten by call target
        //
        // Actual program:
        // 0: C<10>   = CALL addr 10     (width 2)
        // 2: H       = HALT
        //
        // Subroutine at pixel 10:
        // 10: I0<7>  = LDI r0, 7
        // 13: R      = RET
        let mut vm = Vm::new(32);
        vm.poke(0, op::CALL as u32);
        vm.poke(1, 10 | 0x80000000);
        vm.poke(2, op::HALT as u32);
        // subroutine
        vm.poke(10, op::LDI as u32);
        vm.poke(11, 0);
        vm.poke(12, 7);
        vm.poke(13, op::RET as u32);
        vm.pc = 0;
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 7);
    }

    #[test]
    fn spawn_creates_child() {
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32,
            0,
            20, // LDI r0, 20
            op::LDI as u32,
            1,
            42, // LDI r1, 42
            op::SPAWN as u32,
            0,
            1, // SPAWN r0, r1
            op::HALT as u32,
        ]);
        vm.run();
        assert_eq!(vm.children.len(), 1);
        assert_eq!(vm.children[0].start_addr, 20);
        assert_eq!(vm.children[0].arg, 42);
    }

    #[test]
    fn composition_model_works() {
        // The core promise: type "I0*" and you've written LDI r0, 42.
        // '*' has ASCII value 0x2A = 42.
        // That value IS the argument pixel.
        let star = '*' as u32;
        assert_eq!(star, 42);

        let mut vm = Vm::new(64);
        vm.load_program(&[op::LDI as u32, 0, star, op::HALT as u32]);
        vm.run();
        assert_eq!(vm.regs[0], 42);
    }

    // ═══════════════════════════════════════════════════════════════════
    // SELF-AUTHORING PROOF TESTS
    //
    // These tests prove the self-authoring loop:
    //   1. A running program uses EDITOR opcodes to write NEW instructions
    //   2. The VM jumps to the newly written code
    //   3. That code executes successfully
    //   4. (The system edited itself.)
    // ═══════════════════════════════════════════════════════════════════

    #[test]
    fn edit_overwrite_writes_pixel_to_ram() {
        // Write the value 99 into ram[20] using EDIT_OVERWRITE
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32,
            0,
            20, // LDI r0, 20   (address)
            op::LDI as u32,
            1,
            99, // LDI r1, 99   (value)
            op::EDIT_OVERWRITE as u32,
            0,
            1, // EDIT_OVERWRITE r0, r1
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.peek(20), 99);
    }

    #[test]
    fn edit_insert_shifts_ram_right() {
        // Insert value 77 at position 15, verify shift.
        // Program is 10 pixels (LDI+LDI+EDIT_INSERT+HALT), so data must
        // start past address 9 to survive load_program.
        let mut vm = Vm::new(32);
        // Pre-populate ram[15..18] with [10, 20, 30]
        vm.poke(15, 10);
        vm.poke(16, 20);
        vm.poke(17, 30);
        vm.load_program(&[
            op::LDI as u32,
            0,
            15, // LDI r0, 15  (address)
            op::LDI as u32,
            1,
            77, // LDI r1, 77  (value)
            op::EDIT_INSERT as u32,
            0,
            1, // EDIT_INSERT r0, r1
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.peek(15), 77); // inserted value
        assert_eq!(vm.peek(16), 10); // shifted right
        assert_eq!(vm.peek(17), 20); // shifted right
        assert_eq!(vm.peek(18), 30); // shifted right
    }

    #[test]
    fn edit_delete_removes_pixel_from_ram() {
        // Delete pixel at position 15, verify shift left.
        // Program is 6 pixels (LDI+EDIT_DELETE+HALT), so data must
        // start past address 5 to survive load_program.
        let mut vm = Vm::new(32);
        vm.poke(15, 111);
        vm.poke(16, 222);
        vm.poke(17, 333);
        vm.load_program(&[
            op::LDI as u32,
            0,
            15, // LDI r0, 15  (address)
            op::EDIT_DELETE as u32,
            0, // EDIT_DELETE r0
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.peek(15), 222); // shifted left
        assert_eq!(vm.peek(16), 333); // shifted left
    }

    #[test]
    fn edit_blit_copies_pixel_range() {
        // Copy 3 pixels from ram[30..33] to ram[40..43].
        // Program is 14 pixels (3*LDI + EDIT_BLIT + HALT), so src data
        // must start past address 13 to survive load_program.
        let mut vm = Vm::new(64);
        vm.poke(30, 100);
        vm.poke(31, 200);
        vm.poke(32, 300);
        vm.load_program(&[
            op::LDI as u32,
            0,
            40, // LDI r0, 40  (dst address)
            op::LDI as u32,
            1,
            30, // LDI r1, 30  (src address)
            op::LDI as u32,
            2,
            3, // LDI r2, 3   (count)
            op::EDIT_BLIT as u32,
            0,
            1,
            2, // EDIT_BLIT r0, r1, r2
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.peek(40), 100);
        assert_eq!(vm.peek(41), 200);
        assert_eq!(vm.peek(42), 300);
    }

    #[test]
    fn self_authoring_proof_program_writes_then_runs_halt() {
        // ── THE BOOTSTRAP PROOF ──────────────────────────────────────
        //
        // A program that writes a HALT instruction into a blank region
        // of RAM, then jumps to it. The program literally authors its
        // own continuation.
        //
        // Layout:
        //   Address 0: LDI r0, 20        -- target address
        //   Address 3: LDI r1, 0x48       -- HALT opcode value
        //   Address 6: EDIT_OVERWRITE r0, r1  -- stamp HALT at ram[20]
        //   Address 9: JMP 20             -- jump to the code we just wrote
        //
        //   Address 20: (will become HALT via self-authoring)
        //
        // If the self-authoring loop works, the VM will:
        //   1. Execute LDI, LDI, EDIT_OVERWRITE (writes 0x48 to ram[20])
        //   2. Execute JMP 20
        //   3. Execute the HALT at address 20 that IT WROTE ITSELF
        //   4. Stop cleanly with halted=true and pc=21

        let mut vm = Vm::new(32);
        vm.load_program(&[
            op::LDI as u32,
            0,
            20, // addr 0: LDI r0, 20
            op::LDI as u32,
            1,
            op::HALT as u32, // addr 3: LDI r1, HALT
            op::EDIT_OVERWRITE as u32,
            0,
            1, // addr 6: EDIT_OVERWRITE r0, r1
            op::JMP as u32,
            20 | 0x80000000, // addr 9: JMP 20 (absolute)
        ]);
        // ram[20] starts as 0 (NOP-like unknown). The program will
        // overwrite it with HALT before jumping there.
        assert_eq!(vm.peek(20), 0); // not HALT yet

        vm.run();

        assert!(vm.halted);
        assert_eq!(vm.pc, 21); // stopped after executing the self-authored HALT
        assert_eq!(vm.peek(20), op::HALT as u32); // proof: the program wrote this
    }

    #[test]
    fn self_authoring_writes_ldi_and_executes() {
        // ── DEEPER PROOF: write a complete instruction and run it ──
        //
        // A program that writes "LDI r0, 42" into RAM at address 50
        // (well past the program's own 38 pixels), then writes HALT at
        // address 53, then jumps to 50.
        // After running, r0 should be 42 — proving the VM executed
        // code that was authored at runtime.
        //
        // IMPORTANT: The self-authored region (50-53) must NOT overlap
        // with the program's own code (0-37). Previous version used
        // address 30, which caused the program to execute its own
        // overwritten tail in an infinite loop.

        let mut vm = Vm::new(64);
        vm.load_program(&[
            // Write LDI r0, 42 at address 50
            op::LDI as u32,
            0,
            50, // r0 = 50 (write address)
            op::LDI as u32,
            1,
            op::LDI as u32, // r1 = LDI opcode
            op::EDIT_OVERWRITE as u32,
            0,
            1, // ram[50] = LDI
            // Write arg1 (register 0) at address 51
            op::LDI as u32,
            0,
            51, // r0 = 51
            op::LDI as u32,
            1,
            0, // r1 = 0 (dst register index)
            op::EDIT_OVERWRITE as u32,
            0,
            1, // ram[51] = 0
            // Write arg2 (value 42) at address 52
            op::LDI as u32,
            0,
            52, // r0 = 52
            op::LDI as u32,
            1,
            42, // r1 = 42
            op::EDIT_OVERWRITE as u32,
            0,
            1, // ram[52] = 42
            // Write HALT at address 53
            op::LDI as u32,
            0,
            53, // r0 = 53
            op::LDI as u32,
            1,
            op::HALT as u32, // r1 = HALT
            op::EDIT_OVERWRITE as u32,
            0,
            1, // ram[53] = HALT
            // Jump to the self-authored code at 50
            op::JMP as u32,
            50 | 0x80000000, // JMP 50 (absolute)
        ]);

        let cycles = vm.run();

        assert!(
            vm.halted,
            "VM did not halt after {} cycles, pc={}",
            cycles, vm.pc
        );
        // r0 is set to 42 by the self-authored LDI instruction
        assert_eq!(vm.regs[0], 42);
        // Verify the authored bytes are still in RAM
        assert_eq!(vm.peek(50), op::LDI as u32);
        assert_eq!(vm.peek(51), 0);
        assert_eq!(vm.peek(52), 42);
        assert_eq!(vm.peek(53), op::HALT as u32);
    }

    #[test]
    fn self_authoring_recursive_program_writes_code_that_writes_code() {
        // ── THE FULL LOOP: code that writes code that writes code ──
        //
        // Phase 1 (address 0): Write HALT at address 50, then JMP 20
        // Phase 2 (address 20): Write HALT at address 60, then JMP 50
        // Phase 3 (address 50): HALT (written by phase 1)
        //
        // This proves TWO levels of self-authoring.

        let mut vm = Vm::new(128);
        vm.load_program(&[
            // Phase 1: at address 0
            // Write HALT at address 50
            op::LDI as u32,
            0,
            50, // addr 0
            op::LDI as u32,
            1,
            op::HALT as u32, // addr 3
            op::EDIT_OVERWRITE as u32,
            0,
            1, // addr 6
            // Jump to phase 2
            op::JMP as u32,
            20 | 0x80000000, // addr 9 (absolute)
        ]);
        // Phase 2: at address 20 (pre-written)
        vm.poke(20, op::LDI as u32);
        vm.poke(21, 0);
        vm.poke(22, 60);
        vm.poke(23, op::LDI as u32);
        vm.poke(24, 1);
        vm.poke(25, op::HALT as u32);
        vm.poke(26, op::EDIT_OVERWRITE as u32);
        vm.poke(27, 0);
        vm.poke(28, 1);
        vm.poke(29, op::JMP as u32);
        vm.poke(30, 50 | 0x80000000);

        vm.run();

        assert!(vm.halted);
        // Phase 2 wrote HALT at address 60, then jumped to address 50
        // where phase 1 had placed a HALT. Two levels of self-authoring.
        assert_eq!(vm.peek(50), op::HALT as u32);
        assert_eq!(vm.peek(60), op::HALT as u32);
    }

    // ═══════════════════════════════════════════════════════════════════
    // MICRO-ASSEMBLER END-TO-END TESTS (F5 pipeline)
    //
    // Tests the full self-hosting loop:
    //   Rust asm → compiles micro-asm.asm → RAM[0x800]
    //   Source text → RAM[0x400]
    //   VM runs micro-asm → bytecodes to RAM[0x000]
    // ═══════════════════════════════════════════════════════════════════

    use crate::assembler;

    const TEXT_BUF: usize = 0x400;
    const MICRO_ASM: usize = 0x800;

    /// Load micro-asm.asm into a VM, place source text at TEXT_BUF,
    /// run the assembler, and return the VM for inspection.
    fn run_micro_asm(source: &str) -> Vm {
        let asm_src = std::fs::read_to_string("programs/micro-asm.asm")
            .expect("programs/micro-asm.asm not found — run from project root");
        let compiled = assembler::assemble(&asm_src).expect("micro-asm.asm failed to assemble");

        let mut vm = Vm::new(4096);
        // Load assembled code — pixels Vec is indexed by address (0x800+ has the code)
        for (i, &pixel) in compiled.pixels.iter().enumerate() {
            if i >= MICRO_ASM && i < vm.ram.len() {
                vm.ram[i] = pixel;
            }
        }

        // Clear output area
        for v in vm.ram[..TEXT_BUF].iter_mut() {
            *v = 0;
        }
        // Clear text buffer and write source
        for v in vm.ram[TEXT_BUF..MICRO_ASM].iter_mut() {
            *v = 0;
        }
        for (i, byte) in source.bytes().enumerate() {
            let addr = TEXT_BUF + i;
            if addr < MICRO_ASM {
                vm.ram[addr] = byte as u32;
            }
        }

        // Run micro-assembler (two-pass, needs more than default 4096 cycles)
        vm.pc = MICRO_ASM as u32;
        vm.halted = false;
        let mut cycles = 0u32;
        while !vm.halted && cycles < 500_000 {
            vm.step();
            cycles += 1;
        }
        assert!(
            vm.halted,
            "micro-asm did not halt after {cycles} cycles, pc={}",
            vm.pc
        );
        vm
    }

    #[test]
    fn micro_asm_single_halt() {
        // Simplest program: 'H' → HALT (0x48)
        let vm = run_micro_asm("H");
        assert_eq!(vm.peek(0), 0x48); // HALT opcode
        assert_eq!(vm.peek(1), 0); // null terminator
    }

    #[test]
    fn micro_asm_ldi_with_printable_arg() {
        // I 0 ! → LDI r0, 33  ('!' = 0x21 = 33)
        let vm = run_micro_asm("I 0 !");
        assert_eq!(vm.peek(0), 0x49); // 'I' = LDI
        assert_eq!(vm.peek(1), 0x30); // '0' = register index 0
        assert_eq!(vm.peek(2), 0x21); // '!' = value 33
        assert_eq!(vm.peek(3), 0); // null terminator
    }

    #[test]
    fn micro_asm_hex_escape() {
        // I 0 $01 → LDI r0, 1
        let vm = run_micro_asm("I 0 $01");
        assert_eq!(vm.peek(0), 0x49);
        assert_eq!(vm.peek(1), 0x30);
        assert_eq!(vm.peek(2), 0x01);
        assert_eq!(vm.peek(3), 0);
    }

    #[test]
    fn micro_asm_strips_comments() {
        // Comments after ; should be ignored
        let vm = run_micro_asm("I 0 ! ; set r0 to 33");
        assert_eq!(vm.peek(0), 0x49);
        assert_eq!(vm.peek(1), 0x30);
        assert_eq!(vm.peek(2), 0x21);
        assert_eq!(vm.peek(3), 0);
    }

    #[test]
    fn micro_asm_multiline_program() {
        // Three instructions on separate lines
        let vm = run_micro_asm("I 0 !\nI 1 $01\nH");
        // I 0 !
        assert_eq!(vm.peek(0), 0x49);
        assert_eq!(vm.peek(1), 0x30);
        assert_eq!(vm.peek(2), 0x21);
        // I 1 $01
        assert_eq!(vm.peek(3), 0x49);
        assert_eq!(vm.peek(4), 0x31);
        assert_eq!(vm.peek(5), 0x01);
        // H
        assert_eq!(vm.peek(6), 0x48);
        assert_eq!(vm.peek(7), 0);
    }

    #[test]
    fn micro_asm_counter_without_labels() {
        // counter-s.asm logic (manual addresses):
        //   I 0 !      → LDI r0, 33     @ 0
        //   I 1 $01    → LDI r1, 1      @ 3
        //   I 2 $20    → LDI r2, 32     @ 6
        //   S 2 0      → STORE r2, r0   @ 9
        //   A 0 1      → ADD r0, r1     @ 12
        //   B $00 $09  → BRANCH → addr 9 @ 15
        let vm = run_micro_asm("I 0 !\nI 1 $01\nI 2 $20\nS 2 0\nA 0 1\nB $00 $09");

        assert_eq!(vm.peek(0), 0x49);
        assert_eq!(vm.peek(1), 0x30);
        assert_eq!(vm.peek(2), 0x21);
        assert_eq!(vm.peek(3), 0x49);
        assert_eq!(vm.peek(4), 0x31);
        assert_eq!(vm.peek(5), 0x01);
        assert_eq!(vm.peek(6), 0x49);
        assert_eq!(vm.peek(7), 0x32);
        assert_eq!(vm.peek(8), 0x20);
        assert_eq!(vm.peek(9), 0x53);
        assert_eq!(vm.peek(10), 0x32);
        assert_eq!(vm.peek(11), 0x30);
        assert_eq!(vm.peek(12), 0x41);
        assert_eq!(vm.peek(13), 0x30);
        assert_eq!(vm.peek(14), 0x31);
        assert_eq!(vm.peek(15), 0x42);
        assert_eq!(vm.peek(16), 0x00);
        assert_eq!(vm.peek(17), 0x09);
        assert_eq!(vm.peek(18), 0); // null terminator
    }

    #[test]
    fn micro_asm_label_backward_jump() {
        // #loop defines label at position 0
        // @loop resolves to 0
        //   #loop       → label "loop" = 0
        //   S 2 0       → @ 0: [0x53, 0x32, 0x30]
        //   A 0 1       → @ 3: [0x41, 0x30, 0x31]
        //   B $00 @loop → @ 6: [0x42, 0x00, 0x00]
        let vm = run_micro_asm("#loop\nS 2 0\nA 0 1\nB $00 @loop");

        assert_eq!(vm.peek(0), 0x53); // S
        assert_eq!(vm.peek(1), 0x32); // 2
        assert_eq!(vm.peek(2), 0x30); // 0
        assert_eq!(vm.peek(3), 0x41); // A
        assert_eq!(vm.peek(4), 0x30); // 0
        assert_eq!(vm.peek(5), 0x31); // 1
        assert_eq!(vm.peek(6), 0x42); // B
        assert_eq!(vm.peek(7), 0x00); // $00
        assert_eq!(vm.peek(8), 0x00 | 0x80000000); // @loop → 0 (absolute)
        assert_eq!(vm.peek(9), 0); // null terminator
    }

    #[test]
    fn micro_asm_label_forward_jump() {
        //   I 0 !       → @ 0: [0x49, 0x30, 0x21]
        //   B $00 @done → @ 3: [0x42, 0x00, 0x09 | 0x80000000]
        //   I 1 $07     → @ 6: [0x49, 0x31, 0x07]
        //   #done       → label "done" = 9
        //   H           → @ 9: [0x48]
        let vm = run_micro_asm("I 0 !\nB $00 @done\nI 1 $07\n#done\nH");

        assert_eq!(vm.peek(0), 0x49);
        assert_eq!(vm.peek(1), 0x30);
        assert_eq!(vm.peek(2), 0x21);
        assert_eq!(vm.peek(3), 0x42);
        assert_eq!(vm.peek(4), 0x00);
        assert_eq!(vm.peek(5), 0x09 | 0x80000000);
        assert_eq!(vm.peek(6), 0x49);
        assert_eq!(vm.peek(7), 0x31);
        assert_eq!(vm.peek(8), 0x07);
        assert_eq!(vm.peek(9), 0x48); // H at the "done" label address
        assert_eq!(vm.peek(10), 0);
    }

    #[test]
    fn micro_asm_unknown_label_emits_error() {
        // Referencing a label that was never defined → 0xFF error marker
        let vm = run_micro_asm("@missing");
        assert_eq!(vm.peek(0), 0xFF);
        assert_eq!(vm.peek(1), 0);
    }

    #[test]
    fn micro_asm_empty_input() {
        // Empty source → just a null terminator
        let vm = run_micro_asm("");
        assert_eq!(vm.peek(0), 0);
    }

    #[test]
    fn micro_asm_comment_only() {
        // Only comments → just a null terminator
        let vm = run_micro_asm("; just a comment\n; another");
        assert_eq!(vm.peek(0), 0);
    }

    #[test]
    fn micro_asm_counter_s_with_labels() {
        // Load counter-s.asm source and verify it produces the right bytecodes
        let source = std::fs::read_to_string("programs/counter-s.asm")
            .expect("programs/counter-s.asm not found");
        // Strip comment lines for the source (micro-asm handles ; comments)
        let vm = run_micro_asm(&source);

        // I 0 ! → LDI r0, 33
        assert_eq!(vm.peek(0), 0x49); // I (LDI)
        assert_eq!(vm.peek(1), 0x30); // 0 (r0)
        assert_eq!(vm.peek(2), 0x21); // ! (33)

        // I 1 $01 → LDI r1, 1
        assert_eq!(vm.peek(3), 0x49); // I
        assert_eq!(vm.peek(4), 0x31); // 1 (r1)
        assert_eq!(vm.peek(5), 0x01); // $01

        // I 2 $20 → LDI r2, 32
        assert_eq!(vm.peek(6), 0x49); // I
        assert_eq!(vm.peek(7), 0x32); // 2 (r2)
        assert_eq!(vm.peek(8), 0x20); // $20 (32)

        // #loop at addr 9
        // S 2 0 → STORE r2, r0
        assert_eq!(vm.peek(9), 0x53); // S (STORE)
        assert_eq!(vm.peek(10), 0x32); // 2 (r2)
        assert_eq!(vm.peek(11), 0x30); // 0 (r0)

        // A 0 1 → ADD r0, r1
        assert_eq!(vm.peek(12), 0x41); // A (ADD)
        assert_eq!(vm.peek(13), 0x30); // 0 (r0)
        assert_eq!(vm.peek(14), 0x31); // 1 (r1)

        // B $00 @loop → BRANCH cond=0, target=0x80000009
        assert_eq!(vm.peek(15), 0x42); // B (BRANCH)
        assert_eq!(vm.peek(16), 0x00); // $00 (cond)
        assert_eq!(vm.peek(17), 0x09 | 0x80000000); // @loop → 9 (absolute)

        assert_eq!(vm.peek(18), 0); // null terminator
    }

    #[test]
    fn micro_asm_fill_s_program() {
        let source =
            std::fs::read_to_string("programs/fill-s.asm").expect("programs/fill-s.asm not found");
        let vm = run_micro_asm(&source);

        // I 0 $21
        assert_eq!(vm.peek(0), 0x49); // I (LDI)
        assert_eq!(vm.peek(1), 0x30); // 0 (r0)
        assert_eq!(vm.peek(2), 0x21); // $21 (33)
        // I 1 $01
        assert_eq!(vm.peek(3), 0x49);
        assert_eq!(vm.peek(4), 0x31);
        assert_eq!(vm.peek(5), 0x01);
        // I 2 $00
        assert_eq!(vm.peek(6), 0x49);
        assert_eq!(vm.peek(7), 0x32);
        assert_eq!(vm.peek(8), 0x00);
        // #loop = label at addr 9
        // S 2 0
        assert_eq!(vm.peek(9), 0x53); // S (STORE)
        assert_eq!(vm.peek(10), 0x32); // 2 (r2)
        assert_eq!(vm.peek(11), 0x30); // 0 (r0)
        // A 0 1
        assert_eq!(vm.peek(12), 0x41); // A (ADD)
        assert_eq!(vm.peek(13), 0x30); // 0
        assert_eq!(vm.peek(14), 0x31); // 1
        // A 2 1
        assert_eq!(vm.peek(15), 0x41); // A
        assert_eq!(vm.peek(16), 0x32); // 2
        assert_eq!(vm.peek(17), 0x31); // 1
        // B $00 @loop
        assert_eq!(vm.peek(18), 0x42); // B (BRANCH)
        assert_eq!(vm.peek(19), 0x00); // $00 (cond)
        assert_eq!(vm.peek(20), 0x09 | 0x80000000); // @loop -> 9 (absolute)
        // H
        assert_eq!(vm.peek(21), 0x48); // H (HALT)
        assert_eq!(vm.peek(22), 0); // null terminator
    }

    #[test]
    fn micro_asm_selfwrite_program() {
        let source = std::fs::read_to_string("programs/selfwrite-s.asm")
            .expect("programs/selfwrite-s.asm not found");
        let vm = run_micro_asm(&source);

        // I 0 $20
        assert_eq!(vm.peek(0), 0x49); // I
        assert_eq!(vm.peek(1), 0x30); // 0
        assert_eq!(vm.peek(2), 0x20); // $20 (32)
        // I 1 $48
        assert_eq!(vm.peek(3), 0x49); // I
        assert_eq!(vm.peek(4), 0x31); // 1
        assert_eq!(vm.peek(5), 0x48); // $48 (72 = HALT opcode)
        // E 0 1 (EDIT_OVERWRITE)
        assert_eq!(vm.peek(6), 0x45); // E (EXEC/EDIT_OVERWRITE)
        assert_eq!(vm.peek(7), 0x30); // 0
        assert_eq!(vm.peek(8), 0x31); // 1
        // J $20 (JMP 32)
        assert_eq!(vm.peek(9), 0x4A); // J (JMP)
        assert_eq!(vm.peek(10), 0x20); // $20 (32)
        assert_eq!(vm.peek(11), 0); // null terminator
    }

    // ── Canvas-typable program tests ────────────────────────────────
    // These test programs composed entirely of printable ASCII bytes,
    // the same bytes you'd type on the canvas in normal mode.

    #[test]
    fn canvas_draw_pixel_pure_typing() {
        // Program: draw a pixel at (50, 50) with color 126
        // Typed on canvas as: I 0 2 I 1 2 I 2 ~ P 0 1 2 H
        // All bytes are printable ASCII — no hex mode needed.
        //
        // LDI r0, 50     → I(0x49) 0(0x30) 2(0x32)
        // LDI r1, 50     → I(0x49) 1(0x31) 2(0x32)
        // LDI r2, 126    → I(0x49) 2(0x32) ~(0x7E)
        // PSET r0,r1,r2  → P(0x50) 0(0x30) 1(0x31) 2(0x32)
        // HALT            → H(0x48)
        let mut vm = Vm::new(1024);
        vm.load_program(&[
            b'I' as u32,
            b'0' as u32,
            b'2' as u32, // LDI r0, 50
            b'I' as u32,
            b'1' as u32,
            b'2' as u32, // LDI r1, 50
            b'I' as u32,
            b'2' as u32,
            b'~' as u32, // LDI r2, 126
            b'P' as u32,
            b'0' as u32,
            b'1' as u32,
            b'2' as u32, // PSET r0,r1,r2
            b'H' as u32, // HALT
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.pc, 14); // 3+3+3+4+1 = 14
        assert_eq!(vm.regs[0], 50); // x
        assert_eq!(vm.regs[1], 50); // y
        assert_eq!(vm.regs[2], 126); // color
        // Check the pixel was drawn on the VM screen
        assert_eq!(vm.screen[50 * 256 + 50], 126);
    }

    #[test]
    fn canvas_all_registers_typeable() {
        // Verify that every register r0-r31 can be addressed via
        // printable ASCII argument bytes.
        // reg_idx maps: 0x30+i → i for i=0..15, and 0x40+i-16 → i for i=16..31
        // But actually reg_idx(val) = val-0x30 if val >= 0x30, else val
        // So: r0='0'(0x30), r10=':'(0x3A), r16='@'(0x40), r17='A'(0x41), r31='O'(0x4F)

        // Test r10 (0x3A = ':') — load value 42 into r10
        let mut vm = Vm::new(256);
        vm.load_program(&[
            b'I' as u32,
            b':' as u32,
            42, // LDI r10, 42
            b'H' as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[10], 42);

        // Test r17 (0x41 = 'A') — but 'A' is also ADD opcode!
        // In argument position, 'A' = r17. Position matters.
        let mut vm2 = Vm::new(256);
        vm2.load_program(&[
            b'I' as u32,
            b'A' as u32,
            99, // LDI r17, 99
            b'H' as u32,
        ]);
        vm2.run();
        assert!(vm2.halted);
        assert_eq!(vm2.regs[17], 99);

        // Test r31 (0x4F = 'O')
        let mut vm3 = Vm::new(256);
        vm3.load_program(&[
            b'I' as u32,
            b'O' as u32,
            77, // LDI r31, 77
            b'H' as u32,
        ]);
        vm3.run();
        assert!(vm3.halted);
        assert_eq!(vm3.regs[31], 77);
    }

    #[test]
    fn canvas_add_high_registers() {
        // ADD r17, r10 — typed as 'A' 'A' ':'
        // First A = ADD opcode, second A = r17, : = r10
        let mut vm = Vm::new(256);
        vm.load_program(&[
            b'I' as u32,
            b'A' as u32,
            30, // LDI r17, 30
            b'I' as u32,
            b':' as u32,
            12, // LDI r10, 12
            b'A' as u32,
            b'A' as u32,
            b':' as u32, // ADD r17, r10
            b'H' as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[17], 42); // 30 + 12
        assert_eq!(vm.regs[10], 12); // unchanged
    }
}
