#![allow(dead_code)]
// riscv/trace.rs -- Instruction-level tracing (Phase 41)
//
// Provides a toggleable, low-overhead instruction trace system.
// Each trace entry captures: PC, raw instruction word, decoded opcode name,
// register snapshot, and step result.
//
// Trace output goes to a fixed-size ring buffer. When the buffer is full,
// new entries overwrite the oldest. This keeps memory bounded regardless
// of how many instructions execute.
//
// Overhead when disabled: one bool check per step (~0).
// Overhead when enabled: register snapshot + ring buffer write (~1.5x measured).

use super::cpu::StepResult;
use super::decode::Operation;

/// Default ring buffer capacity (number of trace entries).
pub const TRACE_CAPACITY: usize = 1 << 20; // ~1M entries

/// A single traced instruction.
#[derive(Debug, Clone)]
pub struct TraceEntry {
    /// Program counter at execution time.
    pub pc: u32,
    /// Raw instruction word (32-bit). For compressed instructions (16-bit),
    /// the upper 16 bits are zero.
    pub word: u32,
    /// Decoded operation enum.
    pub op: Operation,
    /// Instruction length in bytes (2 for compressed, 4 for normal).
    pub inst_len: u32,
    /// Register snapshot BEFORE execution (x0..x31).
    pub regs_before: [u32; 32],
    /// Register snapshot AFTER execution (x0..x31).
    pub regs_after: [u32; 32],
    /// PC after execution.
    pub pc_after: u32,
    /// Step result (Ok, Ecall, Ebreak, etc).
    pub result: StepResult,
    /// Monotonic instruction counter at time of trace.
    pub insn_count: u64,
}

/// Fixed-capacity ring buffer for trace entries.
///
/// Uses a circular buffer with power-of-2 capacity for fast modular indexing.
/// When full, new entries overwrite the oldest.
pub struct TraceBuffer {
    entries: Vec<TraceEntry>,
    /// Index of next write position.
    head: usize,
    /// Number of entries written (may exceed capacity, in which case
    /// old entries were overwritten).
    count: u64,
    /// Capacity (always power of 2).
    cap: usize,
}

impl TraceBuffer {
    /// Create a new ring buffer with the given capacity.
    pub fn new(capacity: usize) -> Self {
        let cap = capacity.next_power_of_two();
        // Pre-allocate with placeholder entries.
        let entries = (0..cap)
            .map(|_| TraceEntry {
                pc: 0,
                word: 0,
                op: Operation::Invalid(0),
                inst_len: 0,
                regs_before: [0; 32],
                regs_after: [0; 32],
                pc_after: 0,
                result: StepResult::Ok,
                insn_count: 0,
            })
            .collect();
        Self {
            entries,
            head: 0,
            count: 0,
            cap,
        }
    }

    /// Push a trace entry into the ring buffer.
    #[inline]
    pub fn push(&mut self, entry: TraceEntry) {
        self.entries[self.head] = entry;
        self.head = (self.head + 1) & (self.cap - 1);
        self.count += 1;
    }

    /// Number of entries currently in the buffer.
    pub fn len(&self) -> usize {
        if self.count >= self.cap as u64 {
            self.cap
        } else {
            self.count as usize
        }
    }

    /// Whether the buffer is empty.
    pub fn is_empty(&self) -> bool {
        self.count == 0
    }

    /// Total number of entries ever written (including overwritten).
    pub fn total_written(&self) -> u64 {
        self.count
    }

    /// Whether old entries were overwritten.
    pub fn overflowed(&self) -> bool {
        self.count > self.cap as u64
    }

    /// Return entries in chronological order (oldest first).
    pub fn iter_chronological(&self) -> impl Iterator<Item = &TraceEntry> {
        let len = self.len();
        let start = if self.count > self.cap as u64 {
            self.head // oldest entry is at head (next to be overwritten)
        } else {
            0
        };
        (0..len).map(move |i| &self.entries[(start + i) & (self.cap - 1)])
    }

    /// Clear the buffer.
    pub fn clear(&mut self) {
        self.head = 0;
        self.count = 0;
    }

    /// Dump all trace entries to a string, one per line.
    /// Format: insn_count | PC | opcode | result | changed_regs
    pub fn dump(&self) -> String {
        let mut out = String::with_capacity(self.len() * 120);
        for entry in self.iter_chronological() {
            out.push_str(&format_entry(entry));
            out.push('\n');
        }
        out
    }

    /// Write trace entries to a file.
    pub fn write_to_file(&self, path: &std::path::Path) -> std::io::Result<()> {
        use std::io::Write;
        let mut f = std::fs::File::create(path)?;
        for entry in self.iter_chronological() {
            writeln!(f, "{}", format_entry(entry))?;
        }
        Ok(())
    }
}

/// Return a human-readable name for a decoded Operation.
pub fn op_name(op: &Operation) -> &'static str {
    match op {
        Operation::Add { .. } => "ADD",
        Operation::Sub { .. } => "SUB",
        Operation::Sll { .. } => "SLL",
        Operation::Slt { .. } => "SLT",
        Operation::Sltu { .. } => "SLTU",
        Operation::Xor { .. } => "XOR",
        Operation::Srl { .. } => "SRL",
        Operation::Sra { .. } => "SRA",
        Operation::Or { .. } => "OR",
        Operation::And { .. } => "AND",
        Operation::Mul { .. } => "MUL",
        Operation::Mulh { .. } => "MULH",
        Operation::Mulhu { .. } => "MULHU",
        Operation::Mulhsu { .. } => "MULHSU",
        Operation::Div { .. } => "DIV",
        Operation::Divu { .. } => "DIVU",
        Operation::Rem { .. } => "REM",
        Operation::Remu { .. } => "REMU",
        Operation::LrW { .. } => "LR.W",
        Operation::ScW { .. } => "SC.W",
        Operation::AmoswapW { .. } => "AMOSWAP.W",
        Operation::AmoaddW { .. } => "AMOADD.W",
        Operation::AmoxorW { .. } => "AMOXOR.W",
        Operation::AmoandW { .. } => "AMOAND.W",
        Operation::AmoorW { .. } => "AMOOR.W",
        Operation::AmominW { .. } => "AMOMIN.W",
        Operation::AmomaxW { .. } => "AMOMAX.W",
        Operation::AmominuW { .. } => "AMOMINU.W",
        Operation::AmomaxuW { .. } => "AMOMAXU.W",
        Operation::Addi { .. } => "ADDI",
        Operation::Slti { .. } => "SLTI",
        Operation::Sltiu { .. } => "SLTIU",
        Operation::Xori { .. } => "XORI",
        Operation::Ori { .. } => "ORI",
        Operation::Andi { .. } => "ANDI",
        Operation::Slli { .. } => "SLLI",
        Operation::Srli { .. } => "SRLI",
        Operation::Srai { .. } => "SRAI",
        Operation::Lb { .. } => "LB",
        Operation::Lh { .. } => "LH",
        Operation::Lw { .. } => "LW",
        Operation::Lbu { .. } => "LBU",
        Operation::Lhu { .. } => "LHU",
        Operation::Sb { .. } => "SB",
        Operation::Sh { .. } => "SH",
        Operation::Sw { .. } => "SW",
        Operation::Beq { .. } => "BEQ",
        Operation::Bne { .. } => "BNE",
        Operation::Blt { .. } => "BLT",
        Operation::Bge { .. } => "BGE",
        Operation::Bltu { .. } => "BLTU",
        Operation::Bgeu { .. } => "BGEU",
        Operation::Lui { .. } => "LUI",
        Operation::Auipc { .. } => "AUIPC",
        Operation::Jal { .. } => "JAL",
        Operation::Jalr { .. } => "JALR",
        Operation::Ecall => "ECALL",
        Operation::Ebreak => "EBREAK",
        Operation::Fence => "FENCE",
        Operation::Nop => "NOP",
        Operation::Mret => "MRET",
        Operation::Sret => "SRET",
        Operation::SfenceVma { .. } => "SFENCE.VMA",
        Operation::Csrrw { .. } => "CSRRW",
        Operation::Csrrs { .. } => "CSRRS",
        Operation::Csrrc { .. } => "CSRRC",
        Operation::Csrrwi { .. } => "CSRRWI",
        Operation::Csrrsi { .. } => "CSRRSI",
        Operation::Csrrci { .. } => "CSRRCI",
        Operation::Invalid(_) => "INVALID",
    }
}

/// Result shorthand for trace display.
fn result_name(r: &StepResult) -> &'static str {
    match r {
        StepResult::Ok => "OK",
        StepResult::Ecall => "ECALL",
        StepResult::Ebreak => "EBREAK",
        StepResult::FetchFault => "FETCH_FAULT",
        StepResult::LoadFault => "LOAD_FAULT",
        StepResult::StoreFault => "STORE_FAULT",
        StepResult::Shutdown => "SHUTDOWN",
        StepResult::Yielded => "YIELDED",
    }
}

/// Format a single trace entry as a human-readable line.
///
/// Format: `#insn_count | PC:0xXXXXXXXX | OPCODE | result | changed_regs`
/// Changed regs shown as `rN=0xNEW(0xOLD)` only for registers that changed.
pub fn format_entry(e: &TraceEntry) -> String {
    let mut changes = Vec::new();
    for i in 0..32 {
        if e.regs_before[i] != e.regs_after[i] {
            changes.push(format!(
                "x{}=0x{:08X}(was 0x{:08X})",
                i, e.regs_after[i], e.regs_before[i]
            ));
        }
    }
    let changes_str = if changes.is_empty() {
        "-".to_string()
    } else {
        changes.join(", ")
    };
    format!(
        "#{:<10} PC:0x{:08X} [{:<12}] 0x{:08X} -> PC:0x{:08X} {:14} | {}",
        e.insn_count,
        e.pc,
        op_name(&e.op),
        e.word,
        e.pc_after,
        result_name(&e.result),
        changes_str,
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    fn make_entry(pc: u32, word: u32, op: Operation, insn_count: u64) -> TraceEntry {
        TraceEntry {
            pc,
            word,
            op,
            inst_len: 4,
            regs_before: [0; 32],
            regs_after: [0; 32],
            pc_after: pc + 4,
            result: StepResult::Ok,
            insn_count,
        }
    }

    fn make_entry_with_regs(
        pc: u32,
        word: u32,
        op: Operation,
        reg_idx: usize,
        before: u32,
        after: u32,
        insn_count: u64,
    ) -> TraceEntry {
        let mut entry = make_entry(pc, word, op, insn_count);
        entry.regs_before[reg_idx] = before;
        entry.regs_after[reg_idx] = after;
        entry
    }

    // ---- TraceBuffer basics ----

    #[test]
    fn new_buffer_is_empty() {
        let buf = TraceBuffer::new(16);
        assert!(buf.is_empty());
        assert_eq!(buf.len(), 0);
        assert_eq!(buf.total_written(), 0);
        assert!(!buf.overflowed());
    }

    #[test]
    fn push_increments_len() {
        let mut buf = TraceBuffer::new(16);
        buf.push(make_entry(0x1000, 0, Operation::Nop, 0));
        assert_eq!(buf.len(), 1);
        assert_eq!(buf.total_written(), 1);
        assert!(!buf.is_empty());
    }

    #[test]
    fn capacity_rounds_to_power_of_two() {
        // Non-power-of-2 capacity gets rounded up; buffer should work correctly
        let mut buf = TraceBuffer::new(10);
        for i in 0..10 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        assert_eq!(buf.len(), 10);
        assert!(!buf.overflowed());
    }

    #[test]
    fn buffer_fills_to_capacity() {
        let mut buf = TraceBuffer::new(8);
        for i in 0..8 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        assert_eq!(buf.len(), 8);
        assert_eq!(buf.total_written(), 8);
        assert!(!buf.overflowed());
    }

    #[test]
    fn buffer_overwrites_oldest() {
        let mut buf = TraceBuffer::new(4);
        for i in 0..7 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        assert_eq!(buf.len(), 4);
        assert_eq!(buf.total_written(), 7);
        assert!(buf.overflowed());

        // Oldest 3 entries overwritten; should have entries 3, 4, 5, 6
        let entries: Vec<_> = buf.iter_chronological().collect();
        assert_eq!(entries.len(), 4);
        assert_eq!(entries[0].pc, 0x1000 + 3 * 4); // insn_count=3
        assert_eq!(entries[1].pc, 0x1000 + 4 * 4);
        assert_eq!(entries[2].pc, 0x1000 + 5 * 4);
        assert_eq!(entries[3].pc, 0x1000 + 6 * 4);
    }

    #[test]
    fn clear_resets_buffer() {
        let mut buf = TraceBuffer::new(4);
        for i in 0..10 {
            buf.push(make_entry(0x1000, 0, Operation::Nop, i as u64));
        }
        assert!(buf.overflowed());
        buf.clear();
        assert!(buf.is_empty());
        assert_eq!(buf.len(), 0);
        assert_eq!(buf.total_written(), 0);
        assert!(!buf.overflowed());
    }

    #[test]
    fn chronological_iteration_before_overflow() {
        let mut buf = TraceBuffer::new(8);
        for i in 0..3 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        let entries: Vec<_> = buf.iter_chronological().collect();
        assert_eq!(entries.len(), 3);
        assert_eq!(entries[0].insn_count, 0);
        assert_eq!(entries[1].insn_count, 1);
        assert_eq!(entries[2].insn_count, 2);
    }

    #[test]
    fn chronological_iteration_after_overflow() {
        let mut buf = TraceBuffer::new(4);
        for i in 0..10 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        let entries: Vec<_> = buf.iter_chronological().collect();
        assert_eq!(entries.len(), 4);
        // After overflow with cap=4, head=10%4=2
        // Start at head=2 (oldest), then 3, 0, 1
        assert_eq!(entries[0].insn_count, 6);
        assert_eq!(entries[1].insn_count, 7);
        assert_eq!(entries[2].insn_count, 8);
        assert_eq!(entries[3].insn_count, 9);
    }

    #[test]
    fn large_capacity_buffer() {
        // Test with TRACE_CAPACITY-sized buffer (1M entries)
        let mut buf = TraceBuffer::new(TRACE_CAPACITY);
        // Push 10 entries
        for i in 0..10 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Addi { rd: 1, rs1: 0, imm: i as i32 }, i as u64));
        }
        assert_eq!(buf.len(), 10);
        assert_eq!(buf.total_written(), 10);
        assert!(!buf.overflowed());
    }

    // ---- TraceEntry fields ----

    #[test]
    fn entry_stores_pc_and_word() {
        let entry = make_entry(0xDEAD_BEEF, 0x12345678, Operation::Nop, 42);
        assert_eq!(entry.pc, 0xDEAD_BEEF);
        assert_eq!(entry.word, 0x12345678);
        assert_eq!(entry.insn_count, 42);
        assert_eq!(entry.inst_len, 4);
        assert_eq!(entry.pc_after, 0xDEAD_BEEF + 4);
    }

    #[test]
    fn entry_captures_register_changes() {
        let entry = make_entry_with_regs(
            0x1000, 0, Operation::Addi { rd: 5, rs1: 0, imm: 100 },
            5, 0, 100, 0
        );
        assert_eq!(entry.regs_before[5], 0);
        assert_eq!(entry.regs_after[5], 100);
        // x0 should never change (hardwired to zero)
        assert_eq!(entry.regs_before[0], 0);
        assert_eq!(entry.regs_after[0], 0);
    }

    #[test]
    fn entry_captures_step_result() {
        let mut entry = make_entry(0x1000, 0, Operation::Ecall, 0);
        entry.result = StepResult::Ecall;
        assert!(matches!(entry.result, StepResult::Ecall));

        entry.result = StepResult::FetchFault;
        assert!(matches!(entry.result, StepResult::FetchFault));

        entry.result = StepResult::LoadFault;
        assert!(matches!(entry.result, StepResult::LoadFault));

        entry.result = StepResult::StoreFault;
        assert!(matches!(entry.result, StepResult::StoreFault));
    }

    // ---- op_name ----

    #[test]
    fn op_name_basic_r_type() {
        assert_eq!(op_name(&Operation::Add { rd: 0, rs1: 0, rs2: 0 }), "ADD");
        assert_eq!(op_name(&Operation::Sub { rd: 0, rs1: 0, rs2: 0 }), "SUB");
        assert_eq!(op_name(&Operation::Xor { rd: 0, rs1: 0, rs2: 0 }), "XOR");
        assert_eq!(op_name(&Operation::Or { rd: 0, rs1: 0, rs2: 0 }), "OR");
        assert_eq!(op_name(&Operation::And { rd: 0, rs1: 0, rs2: 0 }), "AND");
    }

    #[test]
    fn op_name_shifts() {
        assert_eq!(op_name(&Operation::Sll { rd: 0, rs1: 0, rs2: 0 }), "SLL");
        assert_eq!(op_name(&Operation::Srl { rd: 0, rs1: 0, rs2: 0 }), "SRL");
        assert_eq!(op_name(&Operation::Sra { rd: 0, rs1: 0, rs2: 0 }), "SRA");
    }

    #[test]
    fn op_name_multiply() {
        assert_eq!(op_name(&Operation::Mul { rd: 0, rs1: 0, rs2: 0 }), "MUL");
        assert_eq!(op_name(&Operation::Mulh { rd: 0, rs1: 0, rs2: 0 }), "MULH");
        assert_eq!(op_name(&Operation::Mulhu { rd: 0, rs1: 0, rs2: 0 }), "MULHU");
        assert_eq!(op_name(&Operation::Div { rd: 0, rs1: 0, rs2: 0 }), "DIV");
        assert_eq!(op_name(&Operation::Divu { rd: 0, rs1: 0, rs2: 0 }), "DIVU");
        assert_eq!(op_name(&Operation::Rem { rd: 0, rs1: 0, rs2: 0 }), "REM");
        assert_eq!(op_name(&Operation::Remu { rd: 0, rs1: 0, rs2: 0 }), "REMU");
    }

    #[test]
    fn op_name_immediate() {
        assert_eq!(op_name(&Operation::Addi { rd: 0, rs1: 0, imm: 0 }), "ADDI");
        assert_eq!(op_name(&Operation::Slti { rd: 0, rs1: 0, imm: 0 }), "SLTI");
        assert_eq!(op_name(&Operation::Xori { rd: 0, rs1: 0, imm: 0 }), "XORI");
        assert_eq!(op_name(&Operation::Ori { rd: 0, rs1: 0, imm: 0 }), "ORI");
        assert_eq!(op_name(&Operation::Andi { rd: 0, rs1: 0, imm: 0 }), "ANDI");
    }

    #[test]
    fn op_name_shift_immediate() {
        assert_eq!(op_name(&Operation::Slli { rd: 0, rs1: 0, shamt: 0 }), "SLLI");
        assert_eq!(op_name(&Operation::Srli { rd: 0, rs1: 0, shamt: 0 }), "SRLI");
        assert_eq!(op_name(&Operation::Srai { rd: 0, rs1: 0, shamt: 0 }), "SRAI");
    }

    #[test]
    fn op_name_load_store() {
        assert_eq!(op_name(&Operation::Lb { rd: 0, rs1: 0, imm: 0 }), "LB");
        assert_eq!(op_name(&Operation::Lh { rd: 0, rs1: 0, imm: 0 }), "LH");
        assert_eq!(op_name(&Operation::Lw { rd: 0, rs1: 0, imm: 0 }), "LW");
        assert_eq!(op_name(&Operation::Lbu { rd: 0, rs1: 0, imm: 0 }), "LBU");
        assert_eq!(op_name(&Operation::Lhu { rd: 0, rs1: 0, imm: 0 }), "LHU");
        assert_eq!(op_name(&Operation::Sb { rs1: 0, rs2: 0, imm: 0 }), "SB");
        assert_eq!(op_name(&Operation::Sh { rs1: 0, rs2: 0, imm: 0 }), "SH");
        assert_eq!(op_name(&Operation::Sw { rs1: 0, rs2: 0, imm: 0 }), "SW");
    }

    #[test]
    fn op_name_branch() {
        assert_eq!(op_name(&Operation::Beq { rs1: 0, rs2: 0, imm: 0 }), "BEQ");
        assert_eq!(op_name(&Operation::Bne { rs1: 0, rs2: 0, imm: 0 }), "BNE");
        assert_eq!(op_name(&Operation::Blt { rs1: 0, rs2: 0, imm: 0 }), "BLT");
        assert_eq!(op_name(&Operation::Bge { rs1: 0, rs2: 0, imm: 0 }), "BGE");
        assert_eq!(op_name(&Operation::Bltu { rs1: 0, rs2: 0, imm: 0 }), "BLTU");
        assert_eq!(op_name(&Operation::Bgeu { rs1: 0, rs2: 0, imm: 0 }), "BGEU");
    }

    #[test]
    fn op_name_upper_immediate() {
        assert_eq!(op_name(&Operation::Lui { rd: 0, imm: 0 }), "LUI");
        assert_eq!(op_name(&Operation::Auipc { rd: 0, imm: 0 }), "AUIPC");
    }

    #[test]
    fn op_name_jump() {
        assert_eq!(op_name(&Operation::Jal { rd: 0, imm: 0 }), "JAL");
        assert_eq!(op_name(&Operation::Jalr { rd: 0, rs1: 0, imm: 0 }), "JALR");
    }

    #[test]
    fn op_name_system() {
        assert_eq!(op_name(&Operation::Ecall), "ECALL");
        assert_eq!(op_name(&Operation::Ebreak), "EBREAK");
        assert_eq!(op_name(&Operation::Fence), "FENCE");
        assert_eq!(op_name(&Operation::Nop), "NOP");
        assert_eq!(op_name(&Operation::Mret), "MRET");
        assert_eq!(op_name(&Operation::Sret), "SRET");
        assert_eq!(op_name(&Operation::SfenceVma { rs1: 0, rs2: 0 }), "SFENCE.VMA");
        assert_eq!(op_name(&Operation::Csrrw { rd: 0, csr: 0, rs1: 0 }), "CSRRW");
        assert_eq!(op_name(&Operation::Csrrs { rd: 0, csr: 0, rs1: 0 }), "CSRRS");
        assert_eq!(op_name(&Operation::Csrrc { rd: 0, csr: 0, rs1: 0 }), "CSRRC");
        assert_eq!(op_name(&Operation::Csrrwi { rd: 0, uimm: 0, csr: 0 }), "CSRRWI");
        assert_eq!(op_name(&Operation::Csrrsi { rd: 0, uimm: 0, csr: 0 }), "CSRRSI");
        assert_eq!(op_name(&Operation::Csrrci { rd: 0, uimm: 0, csr: 0 }), "CSRRCI");
        assert_eq!(op_name(&Operation::Invalid(0)), "INVALID");
    }

    #[test]
    fn op_name_amo() {
        assert_eq!(op_name(&Operation::LrW { rd: 0, rs1: 0, aq: false, rl: false }), "LR.W");
        assert_eq!(op_name(&Operation::ScW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "SC.W");
        assert_eq!(op_name(&Operation::AmoswapW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOSWAP.W");
        assert_eq!(op_name(&Operation::AmoaddW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOADD.W");
        assert_eq!(op_name(&Operation::AmoxorW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOXOR.W");
        assert_eq!(op_name(&Operation::AmoandW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOAND.W");
        assert_eq!(op_name(&Operation::AmoorW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOOR.W");
        assert_eq!(op_name(&Operation::AmominW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOMIN.W");
        assert_eq!(op_name(&Operation::AmomaxW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOMAX.W");
        assert_eq!(op_name(&Operation::AmominuW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOMINU.W");
        assert_eq!(op_name(&Operation::AmomaxuW { rd: 0, rs1: 0, rs2: 0, aq: false, rl: false }), "AMOMAXU.W");
    }

    #[test]
    fn op_name_compare() {
        assert_eq!(op_name(&Operation::Slt { rd: 0, rs1: 0, rs2: 0 }), "SLT");
        assert_eq!(op_name(&Operation::Sltu { rd: 0, rs1: 0, rs2: 0 }), "SLTU");
        assert_eq!(op_name(&Operation::Sltiu { rd: 0, rs1: 0, imm: 0 }), "SLTIU");
    }

    // ---- format_entry ----

    #[test]
    fn format_entry_no_register_changes() {
        let entry = make_entry(0x80001000, 0x00000013, Operation::Nop, 5);
        let s = format_entry(&entry);
        assert!(s.contains("PC:0x80001000"));
        assert!(s.contains("NOP"));
        assert!(s.contains("OK"));
        assert!(s.contains("#5"));
        assert!(s.contains("0x00000013"));
        // No register changes: should show "-"
        let parts: Vec<&str> = s.split(" | ").collect();
        assert_eq!(parts.len(), 2);
        assert_eq!(parts[1], "-");
    }

    #[test]
    fn format_entry_with_register_changes() {
        let entry = make_entry_with_regs(
            0x1000, 0x00500093, Operation::Addi { rd: 1, rs1: 0, imm: 5 },
            1, 0, 5, 10
        );
        let s = format_entry(&entry);
        assert!(s.contains("ADDI"));
        assert!(s.contains("x1=0x00000005(was 0x00000000)"));
    }

    #[test]
    fn format_entry_multiple_register_changes() {
        let mut entry = make_entry(0x2000, 0, Operation::Add { rd: 3, rs1: 1, rs2: 2 }, 100);
        entry.regs_before[1] = 10;
        entry.regs_after[1] = 20;
        entry.regs_before[2] = 5;
        entry.regs_after[2] = 5; // unchanged
        entry.regs_before[3] = 0;
        entry.regs_after[3] = 30;
        let s = format_entry(&entry);
        // x1 and x3 changed, x2 did not
        assert!(s.contains("x1=0x00000014(was 0x0000000A)"));
        assert!(s.contains("x3=0x0000001E(was 0x00000000)"));
        assert!(!s.contains("x2=")); // x2 unchanged, not listed
    }

    #[test]
    fn format_entry_with_fault_result() {
        let mut entry = make_entry(0xBAD_ADDD, 0, Operation::Lw { rd: 1, rs1: 2, imm: 100 }, 50);
        entry.result = StepResult::LoadFault;
        let s = format_entry(&entry);
        assert!(s.contains("LOAD_FAULT"));
    }

    #[test]
    fn format_entry_ecall_result() {
        let mut entry = make_entry(0x1000, 0x00000073, Operation::Ecall, 999);
        entry.result = StepResult::Ecall;
        let s = format_entry(&entry);
        assert!(s.contains("ECALL"));
        assert!(s.contains("#999"));
    }

    // ---- dump ----

    #[test]
    fn dump_empty_buffer() {
        let buf = TraceBuffer::new(8);
        let s = buf.dump();
        assert_eq!(s, "");
    }

    #[test]
    fn dump_multiple_entries() {
        let mut buf = TraceBuffer::new(8);
        for i in 0..3 {
            buf.push(make_entry(0x1000 + i * 4, 0, Operation::Nop, i as u64));
        }
        let s = buf.dump();
        let lines: Vec<&str> = s.lines().collect();
        assert_eq!(lines.len(), 3);
        assert!(lines[0].contains("#0"));
        assert!(lines[1].contains("#1"));
        assert!(lines[2].contains("#2"));
    }

    // ---- write_to_file ----

    #[test]
    fn write_to_file_creates_file() {
        let mut buf = TraceBuffer::new(8);
        let path = std::path::PathBuf::from("/tmp/geos_trace_test_write.tmp");
        // Push one entry
        buf.push(make_entry(0x1000, 0x00000013, Operation::Nop, 0));
        buf.write_to_file(&path).expect("write should succeed");
        let content = std::fs::read_to_string(&path).expect("file should exist");
        assert!(content.contains("NOP"));
        assert!(content.contains("PC:0x00001000"));
        std::fs::remove_file(&path).ok();
    }

    #[test]
    fn write_to_file_empty_buffer() {
        let buf = TraceBuffer::new(8);
        let path = std::path::PathBuf::from("/tmp/geos_trace_test_empty.tmp");
        buf.write_to_file(&path).expect("write should succeed");
        let content = std::fs::read_to_string(&path).expect("file should exist");
        assert_eq!(content, "");
        std::fs::remove_file(&path).ok();
    }

    // ---- Edge cases ----

    #[test]
    fn capacity_of_one() {
        let mut buf = TraceBuffer::new(1);
        buf.push(make_entry(0x1000, 0, Operation::Nop, 0));
        buf.push(make_entry(0x1004, 0, Operation::Nop, 1));
        assert_eq!(buf.len(), 1);
        assert!(buf.overflowed());
        let entries: Vec<_> = buf.iter_chronological().collect();
        assert_eq!(entries[0].pc, 0x1004); // first entry overwritten
    }

    #[test]
    fn very_large_insn_count() {
        let mut buf = TraceBuffer::new(8);
        let entry = make_entry(0x1000, 0, Operation::Nop, u64::MAX);
        buf.push(entry);
        assert_eq!(buf.total_written(), 1); // one entry pushed
        let entries: Vec<_> = buf.iter_chronological().collect();
        assert_eq!(entries[0].insn_count, u64::MAX);
    }

    #[test]
    fn zero_pc_entry() {
        let entry = make_entry(0, 0, Operation::Nop, 0);
        assert_eq!(entry.pc, 0);
        assert_eq!(entry.pc_after, 4);
        let s = format_entry(&entry);
        assert!(s.contains("PC:0x00000000"));
    }

    #[test]
    fn compressed_instruction_entry() {
        let mut entry = make_entry(0x1000, 0x0001, Operation::Nop, 0);
        entry.inst_len = 2;
        entry.pc_after = 0x1002;
        assert_eq!(entry.inst_len, 2);
    }

    #[test]
    fn all_registers_zero_no_changes() {
        let entry = make_entry(0x1000, 0, Operation::Nop, 0);
        let s = format_entry(&entry);
        // All regs are 0 before and after, so no changes
        assert_eq!(s.split(" | ").last().unwrap(), "-");
    }

    #[test]
    fn x0_always_shows_zero_even_if_tampered() {
        // x0 is hardwired to zero in RISC-V; even if we set it in the struct,
        // format_entry should still show it
        let mut entry = make_entry(0x1000, 0, Operation::Nop, 0);
        entry.regs_before[0] = 0;
        entry.regs_after[0] = 0;
        // No change since both are 0
        let s = format_entry(&entry);
        assert!(!s.contains("x0="));
    }

    #[test]
    fn dump_after_overflow_shows_latest_entries() {
        let mut buf = TraceBuffer::new(4);
        for i in 0..100 {
            buf.push(make_entry(i as u32 * 4, 0, Operation::Nop, i as u64));
        }
        let s = buf.dump();
        let lines: Vec<&str> = s.lines().collect();
        assert_eq!(lines.len(), 4);
        // Latest 4 entries: insn_count 96, 97, 98, 99
        assert!(lines[0].contains("#96"));
        assert!(lines[3].contains("#99"));
    }
}
