//! RISC-V to GeoASM Transpiler - v7.1 Runtime Pointers
//!
//! Transpiles RV32I instructions to native spatial code (the CA dialect
//! executed by spatial_compute_v7.wgsl).
//!
//! Cell layout contract (must match geoasm_assembler.py and the v7 shader):
//! - Every instruction's opcode cell sits in the code row, at
//!   (code_base_x + pc_offset, code_base_y). The token walks this row.
//! - The opcode cell packs (opcode, rel_x, rel_y) where rel_* point from the
//!   opcode cell to the TARGET register cell.
//! - RI ops are 2 cells: opcode cell + companion NOP cell whose data_buffer
//!   holds the immediate.
//! - RR ops (and COPY/MUL/DIV) are 2 cells: opcode cell + companion cell whose
//!   opcode_or_type packs the SOURCE register offsets (relative to the opcode
//!   cell).
//! - LOAD_IND is 2 cells: opcode cell (rel -> rd) + companion packing the
//!   address-register offsets.
//! - STORE_IND is 3 cells: opcode cell (rel 0,0) + addr-reg offsets +
//!   src-reg offsets.
//! - JZ/JMP are 3 cells: opcode cell (JZ: rel -> condition register) +
//!   absolute target x + absolute target y (raw, in opcode_or_type).
//!
//! Memory model (v7.1): LW/SW emit a 10-op runtime pointer chain (see
//! docs/riscv_runtime_pointers_spec.md) that computes a packed (y << 16) | x
//! grid pointer from rs1 + offset entirely at runtime, then dereferences it
//! with LOAD_IND/STORE_IND. Requires a power-of-2 memory-region width so the
//! address -> coordinate mapping is division-free (AND/SHR).
//!
//! Control flow (v7.2): transpile_program lays out One-PC-per-Row —
//! instruction i occupies row code_base_y + i (stitch JMPs bridge rows), so
//! runtime PC -> coordinate mapping is pure math. Registers hold REAL RISC-V
//! PCs: JAL/JALR store pc+4 links, and JALR converts PC -> packed row pointer
//! at runtime and fires JMP_IND (token-grant delivery). Requires
//! with_base_pc.
//!
//! ISA coverage is complete as of v7.4 (shifts v7.3, sub-word memory and
//! AUIPC v7.4). Remaining caveats:
//! - Misaligned halfword accesses (straddling a word) are not supported
//!   (xv6 never emits them).
//! - Unknown CSRs read as 0 and drop writes.

use crate::geoasm_materializer::{
    CellState, TYPE_ADD_RI, TYPE_ADD_RR, TYPE_AND_RI, TYPE_AND_RR, TYPE_COPY, TYPE_DIV, TYPE_HALT,
    TYPE_JMP, TYPE_JMP_IND, TYPE_JZ, TYPE_LDI, TYPE_LOAD_IND, TYPE_MUL, TYPE_NOP, TYPE_OR_RI,
    TYPE_OR_RR, TYPE_SRA_RI, TYPE_SRA_RR, TYPE_SHL_RI, TYPE_SHL_RR, TYPE_SHR_RI, TYPE_SHR_RR,
    TYPE_SLTU_RI, TYPE_SLTU_RR, TYPE_SLT_RI, TYPE_SLT_RR, TYPE_STORE_IND, TYPE_SUB_RI, TYPE_SUB_RR,
    TYPE_XOR_RI, TYPE_XOR_RR,
};

/// Scratch register indices (beyond x0-x31)
const T_ADDR: usize = 32;
const T_Y: usize = 33;
const T_CSR: usize = 36;  // CSR operation scratch (for read-modify-write chains)
const T_BYTE: usize = 37; // Sub-word memory scratch (for byte/halfword operations)

/// CSR (Control and Status Register) indices (beyond scratch)
const CSR_MEPC: usize = 34;  // Machine exception program counter
const CSR_MTVEC: usize = 35; // Machine trap vector base
const CSR_MSTATUS: usize = 38; // Machine status register (future: privilege/mie)

// S-mode CSRs
const CSR_SSTATUS: usize = 39;
const CSR_STVEC: usize = 40;
const CSR_SEPC: usize = 41;
const CSR_SCAUSE: usize = 42;
const CSR_SATP: usize = 43;
const CSR_SIE: usize = 44;
const CSR_SSCRATCH: usize = 45;
const KALLOC_BUMP: usize = 46; // GEOS memory bump pointer

/// Spatial register bank layout
///
/// Registers x0-x31 + CSRs mapped to 2D grid coordinates.
/// Layout: 4 rows of 8 registers each + CSR row (compact 4x8 + CSR).
///
/// Row 0: x0-x7   (x=base_x..base_x+7, y=base_y)
/// Row 1: x8-x15  (x=base_x..base_x+7, y=base_y+1)
/// Row 2: x16-x23 (x=base_x..base_x+7, y=base_y+2)
/// Row 3: x24-x31 (x=base_x..base_x+7, y=base_y+3)
/// Row 4: t_addr  (x=base_x+0, y=base_y+4) - Scratch 1
/// Row 5: t_y     (x=base_x+0, y=base_y+5) - Scratch 2
/// Row 6: t_csr   (x=base_x+0, y=base_y+6) - Scratch 3 (CSR operations)
/// Row 7: t_byte  (x=base_x+0, y=base_y+8) - Sub-word memory scratch
/// Row 7: mepc    (x=base_x+0, y=base_y+7) - Machine EPC CSR
/// Row 7: mtvec   (x=base_x+1, y=base_y+7) - Machine trap vector CSR
/// Row 7: mstatus (x=base_x+2, y=base_y+7) - Machine status CSR (future)
pub struct SpatialRegisterBank {
    base_x: usize,
    base_y: usize,
}

impl SpatialRegisterBank {
    pub fn new(base_x: usize, base_y: usize) -> Self {
        Self { base_x, base_y }
    }

    /// Convert register number to grid coordinates
    pub fn register_to_coord(&self, reg: usize) -> (usize, usize) {
        if reg <= 31 {
            let row = reg / 8;
            let col = reg % 8;
            (self.base_x + col, self.base_y + row)
        } else if reg == T_ADDR {
            (self.base_x, self.base_y + 4)
        } else if reg == T_Y {
            (self.base_x, self.base_y + 5)
        } else if reg == T_CSR {
            (self.base_x, self.base_y + 6)
        } else if reg == CSR_MEPC {
            (self.base_x, self.base_y + 7)
        } else if reg == CSR_MTVEC {
            (self.base_x + 1, self.base_y + 7)
        } else if reg == T_BYTE {
            // Row +6 next to T_CSR — row +8 collided with the code region
            (self.base_x + 1, self.base_y + 6)
        } else if reg == CSR_MSTATUS {
            (self.base_x + 2, self.base_y + 7)
        } else if reg == CSR_SSTATUS {
            (self.base_x + 3, self.base_y + 7)
        } else if reg == CSR_STVEC {
            (self.base_x + 4, self.base_y + 7)
        } else if reg == CSR_SEPC {
            (self.base_x + 5, self.base_y + 7)
        } else if reg == CSR_SCAUSE {
            (self.base_x + 6, self.base_y + 7)
        } else if reg == CSR_SATP {
            (self.base_x + 7, self.base_y + 7)
        } else if reg == CSR_SIE {
            (self.base_x + 2, self.base_y + 6)
        } else if reg == CSR_SSCRATCH {
            (self.base_x + 3, self.base_y + 6)
        } else if reg == KALLOC_BUMP {
            (self.base_x + 4, self.base_y + 6)
        } else {
            panic!("Invalid register number: {}", reg);
        }
    }

    /// Calculate relative offset from src to dst register, packed as
    /// rel_x in lower 12 bits, rel_y in bits 12-23 (both 12-bit two's complement).
    pub fn offset_between(&self, dst: usize, src: usize) -> i32 {
        let (dst_x, dst_y) = self.register_to_coord(dst);
        let (src_x, src_y) = self.register_to_coord(src);
        let rel_x = (dst_x as i32 - src_x as i32) & 0xFFF;
        let rel_y = (dst_y as i32 - src_y as i32) & 0xFFF;
        rel_x | (rel_y << 12)
    }

    /// Calculate relative offset from (src_x, src_y) to (dst_x, dst_y)
    pub fn offset_between_coords(
        &self,
        src_x: usize,
        src_y: usize,
        dst_x: usize,
        dst_y: usize,
    ) -> i32 {
        let rel_x = (dst_x as i32 - src_x as i32) & 0xFFF;
        let rel_y = (dst_y as i32 - src_y as i32) & 0xFFF;
        rel_x | (rel_y << 12)
    }
}

/// Transpiled GeoASM cell at absolute grid position
#[derive(Debug, Clone)]
pub struct TranspiledCell {
    pub x: usize,
    pub y: usize,
    pub cell: CellState,
}

/// RISC-V to GeoASM transpiler
pub struct RiscvTranspiler {
    reg_bank: SpatialRegisterBank,
    code_base_x: usize,
    original_code_base_x: usize, // Original base, never modified
    code_base_y: usize,
    mem_base_x: usize,
    mem_base_y: usize,
    /// Memory region width in cells (must be power of 2)
    grid_width: usize,
    /// log2(grid_width)
    grid_shift: usize,
    /// Next free cell in the code row
    pc_offset: usize,
    /// RISC-V base PC (for JALR PC-to-coordinate mapping)
    base_pc: Option<u32>,
    /// Virtual address of the memory region's first word. Subtracted in the
    /// runtime pointer chain so ELFs linked at high vaddrs (xv6: 0x80000000)
    /// map into the physical memory rows. Must be 4-aligned.
    mem_base_vaddr: u32,
    /// Current code row Y coordinate (for One-PC-per-Row mapping)
    current_code_y: usize,
    /// Bank width in cells (must be power of 2, e.g., 128)
    bank_width: usize,
    /// log2(bank_width)
    bank_shift: usize,
    /// Total rows per bank (e.g., 4096)
    bank_height: usize,
    /// log2(bank_height)
    bank_height_shift: usize,
    /// Whether multi-bank layout is enabled
    banking_enabled: bool,
}

impl RiscvTranspiler {
    pub fn new(
        code_base_x: usize,
        code_base_y: usize,
        reg_base_x: usize,
        reg_base_y: usize,
    ) -> Self {
        Self {
            reg_bank: SpatialRegisterBank::new(reg_base_x, reg_base_y),
            code_base_x,
            original_code_base_x: code_base_x,
            code_base_y,
            mem_base_x: 0,
            mem_base_y: 32,
            grid_width: 128,
            grid_shift: 7,
            pc_offset: 0,
            base_pc: None,
            mem_base_vaddr: 0,
            current_code_y: code_base_y,
            bank_width: 128,
            bank_shift: 7,
            bank_height: 4096,
            bank_height_shift: 12,
            banking_enabled: false,
        }
    }

    /// Set the RISC-V base PC (for JALR PC-to-coordinate mapping)
    pub fn with_base_pc(mut self, base_pc: u32) -> Self {
        self.base_pc = Some(base_pc);
        self
    }

    /// Set the virtual address that maps to the memory region's first word
    /// (e.g. 0x80000000 for xv6). LW/SW pointer chains subtract it at
    /// runtime before the address -> coordinate mapping.
    pub fn with_memory_vaddr(mut self, vaddr: u32) -> Self {
        assert_eq!(vaddr & 3, 0, "memory base vaddr must be 4-aligned");
        self.mem_base_vaddr = vaddr;
        self
    }

    /// Configure memory region for LOAD_IND/STORE_IND operations
    pub fn with_memory_region(mut self, base_x: usize, base_y: usize, grid_width: usize) -> Self {
        assert!(
            grid_width.is_power_of_two(),
            "Grid width must be power of 2"
        );
        self.mem_base_x = base_x;
        self.mem_base_y = base_y;
        self.grid_width = grid_width;
        self.grid_shift = grid_width.trailing_zeros() as usize;
        self
    }

    /// Configure Multi-Column Row-Bank Scheme for code layout.
    /// Tiles the 1D PC space across a 2D grid using bitwise math.
    ///
    /// # Arguments
    /// * `bank_width` - Width of each bank in cells (must be power of 2, e.g., 128)
    /// * `bank_height` - Height of each bank in rows (must be power of 2, e.g., 4096)
    ///
    /// # Runtime Math (for JALR)
    /// Let instruction index I = (PC - base_pc) >> 2
    /// Because bank_height is power-of-2 (H = bank_height):
    ///   row = I & (H - 1)
    ///   bank = I >> log2(H)
    ///   x = bank << log2(bank_width)
    ///   y = code_base_y + row
    ///
    /// This eliminates DIV ops entirely — only AND/SHR needed.
    ///
    /// # Instruction Capacity
    /// If bank_width = 128 and bank_height = 4096:
    ///   Instructions per bank = 4096
    ///   With 32 banks on a 4096x4096 grid: 131,072 instructions total
    pub fn with_row_banking(mut self, bank_width: usize, bank_height: usize) -> Self {
        assert!(
            bank_width.is_power_of_two(),
            "Bank width must be power of 2"
        );
        assert!(
            bank_height.is_power_of_two(),
            "Bank height must be power of 2"
        );
        self.bank_width = bank_width;
        self.bank_shift = bank_width.trailing_zeros() as usize;
        self.bank_height = bank_height;
        self.bank_height_shift = bank_height.trailing_zeros() as usize;
        self.banking_enabled = true;
        self
    }

    // ---------------------------------------------------------------
    // Code-row emission helpers. Each helper appends the opcode cell at
    // (code_base_x + pc_offset, code_base_y) plus its companion cells,
    // and advances pc_offset by the instruction width.
    // ---------------------------------------------------------------

    fn code_pos(&self) -> (usize, usize) {
        (self.code_base_x + self.pc_offset, self.current_code_y)
    }

    /// rel offsets from the current opcode cell to a register cell.
    ///
    /// Cell offsets are 12-bit two's complement (±2047). This is the REAL
    /// capacity bound on code layout: every code cell must sit within ±2047
    /// cells (both axes) of the register bank, regardless of how many banks
    /// the grid could geometrically hold.
    fn rel_to_reg(&self, reg: usize) -> (i32, i32) {
        let (cx, cy) = self.code_pos();
        let (rx, ry) = self.reg_bank.register_to_coord(reg);
        let (rel_x, rel_y) = (rx as i32 - cx as i32, ry as i32 - cy as i32);
        assert!(
            (-2048..=2047).contains(&rel_x) && (-2048..=2047).contains(&rel_y),
            "register {} at ({},{}) unreachable from code cell ({},{}): \
             offset ({},{}) exceeds 12-bit range",
            reg, rx, ry, cx, cy, rel_x, rel_y
        );
        (rel_x, rel_y)
    }

    /// rel offsets from the current opcode cell to an arbitrary coordinate
    fn rel_to_coord(&self, x: usize, y: usize) -> (i32, i32) {
        let (cx, cy) = self.code_pos();
        (x as i32 - cx as i32, y as i32 - cy as i32)
    }

    fn push_cell(&mut self, out: &mut Vec<TranspiledCell>, cell: CellState) {
        let (x, y) = self.code_pos();
        out.push(TranspiledCell { x, y, cell });
        self.pc_offset += 1;
    }

    /// Companion cell holding an immediate in data_buffer (NOP opcode)
    fn push_imm_cell(&mut self, out: &mut Vec<TranspiledCell>, imm: u32) {
        let (x, y) = self.code_pos();
        out.push(TranspiledCell {
            x,
            y,
            cell: CellState {
                opcode_or_type: TYPE_NOP,
                is_active: 0,
                data_buffer: imm,
                executing: 0,
            },
        });
        self.pc_offset += 1;
    }

    /// Companion cell packing source-register offsets (relative to the
    /// opcode cell, which is at the current pc_offset - 1)
    fn push_src_offset_cell(&mut self, out: &mut Vec<TranspiledCell>, reg: usize) {
        let (cx, cy) = self.code_pos();
        // Offsets are relative to the opcode cell, one to our left
        let (rx, ry) = self.reg_bank.register_to_coord(reg);
        let rel_x = rx as i32 - (cx as i32 - 1);
        let rel_y = ry as i32 - cy as i32;
        out.push(TranspiledCell {
            x: cx,
            y: cy,
            cell: CellState::new(TYPE_NOP, rel_x, rel_y),
        });
        self.pc_offset += 1;
    }

    /// Companion cell holding a raw absolute coordinate (JZ/JMP targets)
    fn push_raw_cell(&mut self, out: &mut Vec<TranspiledCell>, raw: u32) {
        let (x, y) = self.code_pos();
        out.push(TranspiledCell {
            x,
            y,
            cell: CellState {
                opcode_or_type: raw,
                is_active: 0,
                data_buffer: 0,
                executing: 0,
            },
        });
        self.pc_offset += 1;
    }

    /// RI-style op (LDI/ADD_RI/SUB_RI/AND_RI/.../SLTU_RI): 2 cells
    fn push_ri(&mut self, out: &mut Vec<TranspiledCell>, op: u32, target: usize, imm: u32) {
        let (rel_x, rel_y) = self.rel_to_reg(target);
        self.push_cell(out, CellState::new(op, rel_x, rel_y));
        self.push_imm_cell(out, imm);
    }

    /// RR-style op (ADD_RR/COPY/MUL/.../SLTU_RR): 2 cells
    fn push_rr(&mut self, out: &mut Vec<TranspiledCell>, op: u32, target: usize, src: usize) {
        let (rel_x, rel_y) = self.rel_to_reg(target);
        self.push_cell(out, CellState::new(op, rel_x, rel_y));
        self.push_src_offset_cell(out, src);
    }

    /// LOAD_IND rd, addr_reg: 2 cells
    fn push_load_ind(&mut self, out: &mut Vec<TranspiledCell>, rd: usize, addr_reg: usize) {
        let (rel_x, rel_y) = self.rel_to_reg(rd);
        self.push_cell(out, CellState::new(TYPE_LOAD_IND, rel_x, rel_y));
        self.push_src_offset_cell(out, addr_reg);
    }

    /// STORE_IND addr_reg, src_reg: 3 cells
    fn push_store_ind(&mut self, out: &mut Vec<TranspiledCell>, addr_reg: usize, src_reg: usize) {
        self.push_cell(out, CellState::new(TYPE_STORE_IND, 0, 0));
        self.push_src_offset_cell(out, addr_reg);
        // Third cell: src offsets relative to the opcode cell (two to our left)
        let (cx, cy) = self.code_pos();
        let (rx, ry) = self.reg_bank.register_to_coord(src_reg);
        let rel_x = rx as i32 - (cx as i32 - 2);
        let rel_y = ry as i32 - cy as i32;
        out.push(TranspiledCell {
            x: cx,
            y: cy,
            cell: CellState::new(TYPE_NOP, rel_x, rel_y),
        });
        self.pc_offset += 1;
    }

    /// JZ cond_reg, (tx, ty): 3 cells (absolute target coords)
    fn push_jz(&mut self, out: &mut Vec<TranspiledCell>, cond_reg: usize, tx: usize, ty: usize) {
        let (rel_x, rel_y) = self.rel_to_reg(cond_reg);
        self.push_cell(out, CellState::new(TYPE_JZ, rel_x, rel_y));
        self.push_raw_cell(out, tx as u32);
        self.push_raw_cell(out, ty as u32);
    }

    /// JMP (tx, ty): 3 cells (absolute target coords)
    fn push_jmp(&mut self, out: &mut Vec<TranspiledCell>, tx: usize, ty: usize) {
        self.push_cell(out, CellState::new(TYPE_JMP, 0, 0));
        self.push_raw_cell(out, tx as u32);
        self.push_raw_cell(out, ty as u32);
    }

    fn push_halt(&mut self, out: &mut Vec<TranspiledCell>) {
        self.push_cell(out, CellState::new(TYPE_HALT, 0, 0));
    }

    /// Copy src into target unless they are the same register.
    /// Reading x0 is fine (its cell is never written and stays 0).
    fn push_copy_if_needed(&mut self, out: &mut Vec<TranspiledCell>, target: usize, src: usize) {
        if target != src {
            self.push_rr(out, TYPE_COPY, target, src);
        }
    }

    // ---------------------------------------------------------------
    // The v7.1 runtime pointer chain (docs/riscv_runtime_pointers_spec.md)
    //
    // Leaves the packed grid pointer (grid_y << 16) | grid_x in t_addr,
    // computed entirely at runtime from rs1 + offset:
    //   t_addr = rs1 + offset      (byte address)
    //   t_addr >>= 2               (word index WI)
    //   t_y = t_addr >> grid_shift (region-relative row)
    //   t_y += mem_base_y
    //   t_addr &= grid_width - 1   (region-relative column)
    //   t_addr += mem_base_x
    //   t_y <<= 16
    //   t_addr |= t_y
    // ---------------------------------------------------------------
    fn push_pointer_chain(&mut self, out: &mut Vec<TranspiledCell>, rs1: usize, offset: i32) {
        self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
        self.push_ri(out, TYPE_ADD_RI, T_ADDR, offset as u32); // wrapping add handles negatives
        // Rebase virtual address to region-relative (SUB 0 when unset; always
        // emitted so instruction widths stay config-independent)
        self.push_ri(out, TYPE_SUB_RI, T_ADDR, self.mem_base_vaddr);
        self.push_ri(out, TYPE_SHR_RI, T_ADDR, 2);
        self.push_rr(out, TYPE_COPY, T_Y, T_ADDR);
        self.push_ri(out, TYPE_SHR_RI, T_Y, self.grid_shift as u32);
        self.push_ri(out, TYPE_ADD_RI, T_Y, self.mem_base_y as u32);
        self.push_ri(out, TYPE_AND_RI, T_ADDR, (self.grid_width - 1) as u32);
        self.push_ri(out, TYPE_ADD_RI, T_ADDR, self.mem_base_x as u32);
        self.push_ri(out, TYPE_SHL_RI, T_Y, 16);
        self.push_rr(out, TYPE_OR_RR, T_ADDR, T_Y);
    }

    /// Emit the runtime PC -> packed-coordinate chain (shared by JALR,
    /// ECALL, and MRET). Expects T_ADDR to hold the target PC; leaves the
    /// packed (y << 16) | x grid pointer in T_ADDR. Clobbers T_Y.
    ///
    /// With banking disabled the default bank parameters (height 4096,
    /// shift 12, bank_shift 7) degenerate to the single-column mapping:
    /// bank = 0, x = original_code_base_x, y = code_base_y + index.
    fn push_pc_to_coord_chain(&mut self, out: &mut Vec<TranspiledCell>, base_pc: u32) {
        // I = (pc - base_pc) >> 2
        self.push_ri(out, TYPE_SUB_RI, T_ADDR, base_pc);
        self.push_ri(out, TYPE_SHR_RI, T_ADDR, 2);
        // row = I & (bank_height - 1); y = code_base_y + row
        self.push_rr(out, TYPE_COPY, T_Y, T_ADDR);
        self.push_ri(out, TYPE_AND_RI, T_Y, (self.bank_height - 1) as u32);
        self.push_ri(out, TYPE_ADD_RI, T_Y, self.code_base_y as u32);
        // bank = I >> bank_height_shift; x = original_code_base_x + (bank << bank_shift)
        self.push_ri(out, TYPE_SHR_RI, T_ADDR, self.bank_height_shift as u32);
        self.push_ri(out, TYPE_SHL_RI, T_ADDR, self.bank_shift as u32);
        self.push_ri(out, TYPE_ADD_RI, T_ADDR, self.original_code_base_x as u32);
        // packed = (y << 16) | x
        self.push_ri(out, TYPE_SHL_RI, T_Y, 16);
        self.push_rr(out, TYPE_OR_RR, T_ADDR, T_Y);
    }

    /// Emit JMP_IND through T_ADDR (opcode cell packs rel -> t_addr, plus a
    /// filler cell; the token always leaves via the grant).
    fn push_jmp_ind_via_t_addr(&mut self, out: &mut Vec<TranspiledCell>) {
        let (dx, dy) = self.rel_to_reg(T_ADDR);
        self.push_cell(out, CellState::new(TYPE_JMP_IND, dx, dy));
        self.push_cell(out, CellState::data(0));
    }

    // ---------------------------------------------------------------
    // Sub-word memory helpers (v7.4)
    // ---------------------------------------------------------------

    /// Sub-word load (LB/LBU/LH/LHU). The byte-lane shift must be captured
    /// BEFORE the pointer chain: the chain's SHR 2 destroys the low address
    /// bits, and after it T_ADDR holds a packed coordinate, not an address.
    /// Alignment: halfword accesses must be 2-byte aligned (no word-straddle).
    fn push_subword_load(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rd: usize,
        rs1: usize,
        imm: i32,
        halfword: bool,
        signed: bool,
    ) {
        if rd == 0 {
            return; // side-effect free, fully elided
        }
        let offset_mask: u32 = if halfword { 2 } else { 3 };
        // T_BYTE = ((rs1 + imm) & offset_mask) * 8  — the lane shift
        self.push_rr(out, TYPE_COPY, T_BYTE, rs1);
        self.push_ri(out, TYPE_ADD_RI, T_BYTE, imm as u32);
        self.push_ri(out, TYPE_AND_RI, T_BYTE, offset_mask);
        self.push_ri(out, TYPE_SHL_RI, T_BYTE, 3);
        // Packed pointer in T_ADDR (clobbers T_ADDR + T_Y only)
        self.push_pointer_chain(out, rs1, imm);
        self.push_load_ind(out, rd, T_ADDR);
        self.push_rr(out, TYPE_SHR_RR, rd, T_BYTE);
        if signed {
            // Sign-extension trick: push the lane to the top, arithmetic
            // shift pulls the sign bit down
            let k = if halfword { 16 } else { 24 };
            self.push_ri(out, TYPE_SHL_RI, rd, k);
            self.push_ri(out, TYPE_SRA_RI, rd, k);
        } else {
            let m: u32 = if halfword { 0xFFFF } else { 0xFF };
            self.push_ri(out, TYPE_AND_RI, rd, m);
        }
    }

    /// Sub-word store (SB/SH): read-modify-write chain (~49 cells for SB;
    /// requires bank width >= 52 with the stitch). Scratch usage:
    /// T_BYTE = lane shift, T_ADDR = packed pointer, T_Y = mask/lane temp
    /// (free after the pointer chain), T_CSR = old word (borrowed — CSR
    /// scratch is never live across instructions).
    fn push_subword_store(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rs1: usize,
        rs2: usize,
        imm: i32,
        halfword: bool,
    ) {
        let offset_mask: u32 = if halfword { 2 } else { 3 };
        let value_mask: u32 = if halfword { 0xFFFF } else { 0xFF };
        // T_BYTE = ((rs1 + imm) & offset_mask) * 8
        self.push_rr(out, TYPE_COPY, T_BYTE, rs1);
        self.push_ri(out, TYPE_ADD_RI, T_BYTE, imm as u32);
        self.push_ri(out, TYPE_AND_RI, T_BYTE, offset_mask);
        self.push_ri(out, TYPE_SHL_RI, T_BYTE, 3);
        // Packed pointer in T_ADDR
        self.push_pointer_chain(out, rs1, imm);
        // Old word into T_CSR
        self.push_load_ind(out, T_CSR, T_ADDR);
        // Clear the target lane: T_CSR &= !(value_mask << shift)
        self.push_ri(out, TYPE_LDI, T_Y, value_mask);
        self.push_rr(out, TYPE_SHL_RR, T_Y, T_BYTE);
        self.push_ri(out, TYPE_XOR_RI, T_Y, 0xFFFF_FFFF);
        self.push_rr(out, TYPE_AND_RR, T_CSR, T_Y);
        // Merge the new lane: T_CSR |= (rs2 & value_mask) << shift
        self.push_rr(out, TYPE_COPY, T_Y, rs2);
        self.push_ri(out, TYPE_AND_RI, T_Y, value_mask);
        self.push_rr(out, TYPE_SHL_RR, T_Y, T_BYTE);
        self.push_rr(out, TYPE_OR_RR, T_CSR, T_Y);
        // Write back
        self.push_store_ind(out, T_ADDR, T_CSR);
    }

    // ---------------------------------------------------------------
    // CSR helpers
    // ---------------------------------------------------------------

    /// Map a RISC-V CSR number (instruction bits 31:20) to its register-bank
    /// slot. Unknown CSRs return None: the decoder drops the write and reads
    /// as zero (documented placeholder until more CSRs get bank cells).
    fn csr_to_reg(csr_num: u32) -> Option<usize> {
        match csr_num {
            0x300 => Some(CSR_MSTATUS), // mstatus
            0x305 => Some(CSR_MTVEC),   // mtvec
            0x341 => Some(CSR_MEPC),    // mepc
            // S-mode CSRs
            0x100 => Some(CSR_SSTATUS), // sstatus
            0x104 => Some(CSR_SIE),     // sie
            0x105 => Some(CSR_STVEC),   // stvec
            0x140 => Some(CSR_SSCRATCH),// sscratch
            0x141 => Some(CSR_SEPC),    // sepc
            0x142 => Some(CSR_SCAUSE),  // scause
            0x180 => Some(CSR_SATP),    // satp
            _ => None,
        }
    }

    /// Emit CSRRW rd, csr, rs1 chain:
    ///   COPY T_CSR, rs1      (buffer source)
    ///   COPY rd, csr         (read old value)
    ///   COPY csr, T_CSR      (write new value)
    ///
    /// If rd == 0 or rs1 == 0, the chain is shortened accordingly.
    /// Returns true if the chain executed (at least one cell emitted).
    fn push_csr_read_write(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rd: usize,
        csr: usize,
        rs1: usize,
    ) {
        // Always buffer a nonzero source BEFORE the read: when rd == rs1
        // (the swap case) the read clobbers rs1, and skipping the buffer
        // writes the old CSR value straight back.
        if rs1 != 0 {
            self.push_rr(out, TYPE_COPY, T_CSR, rs1);
        }
        if rd != 0 {
            self.push_rr(out, TYPE_COPY, rd, csr);
        }
        // CSRRW ALWAYS writes the CSR — rs1 == x0 writes zero (x0's cell)
        if rs1 != 0 {
            self.push_rr(out, TYPE_COPY, csr, T_CSR);
        } else {
            self.push_rr(out, TYPE_COPY, csr, 0);
        }
    }

    /// CSRRWI rd, csr, zimm: read old value (if rd != 0), then write the
    /// 5-bit immediate as a constant via LDI. Always writes.
    fn push_csr_read_write_imm(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rd: usize,
        csr: usize,
        zimm: u32,
    ) {
        if rd != 0 {
            self.push_rr(out, TYPE_COPY, rd, csr);
        }
        self.push_ri(out, TYPE_LDI, csr, zimm);
    }

    /// Emit CSRRS rd, csr, rs1 chain:
    ///   COPY T_CSR, rs1
    ///   COPY rd, csr
    ///   OR_RR csr, T_CSR     (target CSR directly)
    ///
    /// Immediate variant uses OR_RI instead of OR_RR.
    fn push_csr_read_set(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rd: usize,
        csr: usize,
        rs1: usize,
        imm: Option<u32>,
    ) {
        if let Some(zimm) = imm {
            // CSRRSI immediate variant
            if rd != 0 {
                self.push_rr(out, TYPE_COPY, rd, csr);
            }
            if zimm != 0 {
                self.push_ri(out, TYPE_OR_RI, csr, zimm);
            }
        } else {
            // Register variant
            if rs1 != 0 {
                self.push_rr(out, TYPE_COPY, T_CSR, rs1);
            }
            if rd != 0 {
                self.push_rr(out, TYPE_COPY, rd, csr);
            }
            if rs1 != 0 {
                self.push_rr(out, TYPE_OR_RR, csr, T_CSR);
            }
        }
    }

    /// Emit CSRRC rd, csr, rs1 chain:
    ///   COPY T_CSR, rs1
    ///   XOR_RI T_CSR, 0xFFFFFFFF  (invert mask)
    ///   COPY rd, csr
    ///   AND_RR csr, T_CSR    (target CSR directly)
    ///
    /// Immediate variant uses AND_RI with inverted immediate.
    fn push_csr_read_clear(
        &mut self,
        out: &mut Vec<TranspiledCell>,
        rd: usize,
        csr: usize,
        rs1: usize,
        imm: Option<u32>,
    ) {
        if let Some(zimm) = imm {
            // CSRRCI immediate variant
            if rd != 0 {
                self.push_rr(out, TYPE_COPY, rd, csr);
            }
            if zimm != 0 {
                // Bitwise NOT of the mask (the draft's two's-complement
                // negation cleared nothing: -1 as a mask is all-ones)
                self.push_ri(out, TYPE_AND_RI, csr, !zimm);
            }
        } else {
            // Register variant
            if rs1 != 0 {
                self.push_rr(out, TYPE_COPY, T_CSR, rs1);
                self.push_ri(out, TYPE_XOR_RI, T_CSR, 0xFFFFFFFF);
            }
            if rd != 0 {
                self.push_rr(out, TYPE_COPY, rd, csr);
            }
            if rs1 != 0 {
                self.push_rr(out, TYPE_AND_RR, csr, T_CSR);
            }
        }
    }

    // ---------------------------------------------------------------
    // Instruction transpilation
    // ---------------------------------------------------------------

    /// Transpile one instruction. `branch_target` resolves a branch/jump byte
    /// offset (relative to this instruction) to the absolute grid coordinate
    /// of the target instruction's first cell; when it returns None the
    /// branch is emitted as a fall-through no-op. `link_pc` is the real
    /// RISC-V PC of the next instruction (for JAL/JALR link values).
    /// `current_pc` is the real RISC-V PC of this instruction (for AUIPC).
    ///
    /// Returns true if the instruction ends with an unconditional control
    /// transfer (no fall-through), so callers know whether to emit a stitch
    /// jump to the next instruction row.
    fn transpile_instruction(
        &mut self,
        inst: u32,
        out: &mut Vec<TranspiledCell>,
        link_pc: Option<u32>,
        current_pc: Option<u32>,
        branch_target: &dyn Fn(i32) -> Option<(usize, usize)>,
    ) -> bool {
        let opcode = inst & 0x7F;
        let rd = ((inst >> 7) & 0x1F) as usize;
        let rs1 = ((inst >> 15) & 0x1F) as usize;
        let rs2 = ((inst >> 20) & 0x1F) as usize;
        let funct3 = (inst >> 12) & 0x7;
        let funct7 = (inst >> 25) & 0x7F;

        // Sign-extended immediates
        let imm_i = (inst as i32) >> 20;
        let imm_s = (((inst as i32) >> 25) << 5) | (((inst >> 7) & 0x1F) as i32);
        let imm_b = {
            let v = (((inst >> 8) & 0xF) << 1)
                | (((inst >> 25) & 0x3F) << 5)
                | (((inst >> 7) & 0x1) << 11)
                | (((inst >> 31) & 0x1) << 12);
            ((v as i32) << 19) >> 19
        };
        let imm_u = (inst & 0xFFFF_F000) as i32; // already shifted
        let imm_j = {
            let v = (((inst >> 21) & 0x3FF) << 1)
                | (((inst >> 20) & 0x1) << 11)
                | (((inst >> 12) & 0xFF) << 12)
                | (((inst >> 31) & 0x1) << 20);
            ((v as i32) << 11) >> 11
        };

        match opcode {
            // LUI: rd = imm << 12
            0b0110111 => {
                if rd != 0 {
                    self.push_ri(out, TYPE_LDI, rd, imm_u as u32);
                }
            }

            // AUIPC: rd = pc + imm[31:12] << 12
            // Because the transpiler knows the RISC-V PC of every instruction,
            // this is trivial: just compute the value at transpile time.
            0b0010111 => {
                if let Some(pc) = current_pc {
                    if rd != 0 {
                        let imm_shifted = (inst & 0xFFFFF000);  // imm[31:12] << 12
                        let val = pc.wrapping_add(imm_shifted);
                        self.push_ri(out, TYPE_LDI, rd, val);
                    }
                } else {
                    // No base_pc: cannot emit AUIPC, halt loudly
                    self.push_halt(out);
                    return true;
                }
            }

            // JAL: JMP to target; link = real PC of the next instruction.
            // Convention (v7.2): registers hold REAL RISC-V PCs — JALR maps
            // PC -> row at runtime, so links must be genuine PC values.
            0b1101111 => {
                if rd != 0 {
                    self.push_ri(out, TYPE_LDI, rd, link_pc.unwrap_or(0));
                }
                let (cx, cy) = self.code_pos();
                let (tx, ty) = branch_target(imm_j)
                    .or_else(|| branch_target(4))
                    .unwrap_or((cx + 3, cy));
                self.push_jmp(out, tx, ty);
                return true;
            }

            // JALR: indirect jump with link (v7.2 — JMP_IND).
            // Multi-Column Row-Bank Scheme: PC -> coordinate is bitwise math:
            //   I = (PC - base_pc) >> 2
            //   row = I & (bank_height - 1)
            //   bank = I >> bank_height_shift
            //   x = bank << bank_shift
            //   y = code_base_y + row
            //   packed = (y << 16) | x
            // Registers hold real PCs (JAL/JALR links, ELF function pointers
            // all work uniformly). Requires with_base_pc; without it there is
            // no PC -> row mapping, so emit HALT (loud failure).
            0b1100111 => {
                let base_pc = match self.base_pc {
                    Some(b) => b,
                    None => {
                        self.push_halt(out);
                        return true;
                    }
                };

                if rd != 0 {
                    // Link: real PC of the next instruction
                    self.push_ri(out, TYPE_LDI, rd, link_pc.unwrap_or(0));
                }

                // t_addr = (rs1 + imm) & ~1  (target PC)
                self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                self.push_ri(out, TYPE_ADD_RI, T_ADDR, imm_i as u32);
                self.push_ri(out, TYPE_AND_RI, T_ADDR, 0xFFFF_FFFE);

                // Convert PC to packed grid pointer and jump (shared chain)
                self.push_pc_to_coord_chain(out, base_pc);
                self.push_jmp_ind_via_t_addr(out);
                return true;
            }

            // BRANCH
            0b1100011 => {
                // Compute widths first so the JZ/JMP fall-through targets are
                // exact regardless of resolver behavior.
                match funct3 {
                    // BEQ: taken when rs1 == rs2
                    0b000 => {
                        let cond = if rs2 == 0 {
                            rs1
                        } else if rs1 == 0 {
                            rs2
                        } else {
                            self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                            self.push_rr(out, TYPE_XOR_RR, T_ADDR, rs2);
                            T_ADDR
                        };
                        let (cx, cy) = self.code_pos();
                        let (tx, ty) = branch_target(imm_b).unwrap_or((cx + 3, cy));
                        self.push_jz(out, cond, tx, ty);
                    }
                    // BNE: taken when rs1 != rs2 -> JZ over a JMP
                    0b001 => {
                        let cond = if rs2 == 0 {
                            rs1
                        } else if rs1 == 0 {
                            rs2
                        } else {
                            self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                            self.push_rr(out, TYPE_XOR_RR, T_ADDR, rs2);
                            T_ADDR
                        };
                        // [JZ cond -> skip][JMP target][skip: ...]
                        let (cx, cy) = self.code_pos();
                        let skip = (cx + 6, cy);
                        let (tx, ty) = branch_target(imm_b).unwrap_or(skip);
                        self.push_jz(out, cond, skip.0, skip.1);
                        self.push_jmp(out, tx, ty);
                    }
                    // BLT: t = (rs1 < rs2) signed; taken when t == 1
                    0b100 | 0b110 => {
                        let slt_op = if funct3 == 0b100 {
                            TYPE_SLT_RR
                        } else {
                            TYPE_SLTU_RR
                        };
                        self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                        self.push_rr(out, slt_op, T_ADDR, rs2);
                        // taken when t != 0 -> JZ over a JMP
                        let (cx, cy) = self.code_pos();
                        let skip = (cx + 6, cy);
                        let (tx, ty) = branch_target(imm_b).unwrap_or(skip);
                        self.push_jz(out, T_ADDR, skip.0, skip.1);
                        self.push_jmp(out, tx, ty);
                    }
                    // BGE: taken when !(rs1 < rs2) -> JZ on the SLT result
                    0b101 | 0b111 => {
                        let slt_op = if funct3 == 0b101 {
                            TYPE_SLT_RR
                        } else {
                            TYPE_SLTU_RR
                        };
                        self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                        self.push_rr(out, slt_op, T_ADDR, rs2);
                        let (cx, cy) = self.code_pos();
                        let (tx, ty) = branch_target(imm_b).unwrap_or((cx + 3, cy));
                        self.push_jz(out, T_ADDR, tx, ty);
                    }
                    _ => {},
                }
            }

            // LOAD
            0b0000011 => match funct3 {
                // LW: runtime pointer chain + LOAD_IND
                0b010 => {
                    if rd != 0 {
                        self.push_pointer_chain(out, rs1, imm_i);
                        self.push_load_ind(out, rd, T_ADDR);
                    }
                }
                // Sub-word loads (v7.4): lane shift captured BEFORE the
                // pointer chain (which destroys the low address bits)
                0b000 => self.push_subword_load(out, rd, rs1, imm_i, false, true), // LB
                0b001 => self.push_subword_load(out, rd, rs1, imm_i, true, true),  // LH
                0b100 => self.push_subword_load(out, rd, rs1, imm_i, false, false), // LBU
                0b101 => self.push_subword_load(out, rd, rs1, imm_i, true, false), // LHU
                _ => {}  // Reserved/invalid funct3 codes
            },

            // STORE
            0b0100011 => match funct3 {
                // SW: runtime pointer chain + STORE_IND
                0b010 => {
                    self.push_pointer_chain(out, rs1, imm_s);
                    self.push_store_ind(out, T_ADDR, rs2);
                }
                // Sub-word stores (v7.4): read-modify-write chains
                0b000 => self.push_subword_store(out, rs1, rs2, imm_s, false), // SB
                0b001 => self.push_subword_store(out, rs1, rs2, imm_s, true),  // SH
                _ => {}  // Invalid funct3 codes
            },

            // OP-IMM
            0b0010011 => {
                if rd == 0 {
                    return false; // writes to x0 are discarded
                }
                let shamt = ((inst >> 20) & 0x1F) as u32;
                match funct3 {
                    // ADDI
                    0b000 => {
                        if rs1 == 0 {
                            // li rd, imm
                            self.push_ri(out, TYPE_LDI, rd, imm_i as u32);
                        } else {
                            self.push_copy_if_needed(out, rd, rs1);
                            self.push_ri(out, TYPE_ADD_RI, rd, imm_i as u32);
                        }
                    }
                    // SLTI / SLTIU
                    0b010 | 0b011 => {
                        let op = if funct3 == 0b010 {
                            TYPE_SLT_RI
                        } else {
                            TYPE_SLTU_RI
                        };
                        self.push_copy_if_needed(out, rd, rs1);
                        self.push_ri(out, op, rd, imm_i as u32);
                    }
                    // XORI
                    0b100 => {
                        self.push_copy_if_needed(out, rd, rs1);
                        self.push_ri(out, TYPE_XOR_RI, rd, imm_i as u32);
                    }
                    // ORI
                    0b110 => {
                        self.push_copy_if_needed(out, rd, rs1);
                        self.push_ri(out, TYPE_OR_RI, rd, imm_i as u32);
                    }
                    // ANDI
                    0b111 => {
                        self.push_copy_if_needed(out, rd, rs1);
                        self.push_ri(out, TYPE_AND_RI, rd, imm_i as u32);
                    }
                    // SLLI
                    0b001 => {
                        self.push_copy_if_needed(out, rd, rs1);
                        self.push_ri(out, TYPE_SHL_RI, rd, shamt);
                    }
                    // SRLI / SRAI
                    0b101 => {
                        self.push_copy_if_needed(out, rd, rs1);
                        let op = if funct7 == 0b0100000 {
                            TYPE_SRA_RI  // Arithmetic right shift
                        } else {
                            TYPE_SHR_RI  // Logical right shift
                        };
                        self.push_ri(out, op, rd, shamt);
                    }
                    _ => {},
                }
            }

            // OP
            0b0110011 => {
                if rd == 0 {
                    return false;
                }
                let rr_op = match (funct7, funct3) {
                    (0b0000000, 0b000) => Some(TYPE_ADD_RR),
                    (0b0100000, 0b000) => Some(TYPE_SUB_RR),
                    (0b0000000, 0b111) => Some(TYPE_AND_RR),
                    (0b0000000, 0b110) => Some(TYPE_OR_RR),
                    (0b0000000, 0b100) => Some(TYPE_XOR_RR),
                    (0b0000000, 0b010) => Some(TYPE_SLT_RR),
                    (0b0000000, 0b011) => Some(TYPE_SLTU_RR),
                    // Shifts by register amount (v7.3 - sub-word memory)
                    (0b0000000, 0b001) => Some(TYPE_SHL_RR),   // SLL
                    (0b0000000, 0b101) => Some(TYPE_SHR_RR),   // SRL
                    (0b0100000, 0b101) => Some(TYPE_SRA_RR),   // SRA
                    // M extension
                    (0b0000001, 0b000) => Some(TYPE_MUL),
                    (0b0000001, 0b100) => Some(TYPE_DIV),
                    (0b0000001, 0b101) => Some(TYPE_DIV), // DIVU
                    _ => None,
                };

                // Handle REMU specially since it's a 3-op chain
                if funct7 == 0b0000001 && funct3 == 0b111 {
                    // a - (a/b)*b
                    if rd == rs1 || rd == rs2 {
                        self.push_rr(out, TYPE_COPY, T_CSR, rs1);
                        self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                        self.push_rr(out, TYPE_DIV, T_ADDR, rs2);
                        self.push_rr(out, TYPE_MUL, T_ADDR, rs2);
                        self.push_rr(out, TYPE_COPY, rd, T_CSR);
                        self.push_rr(out, TYPE_SUB_RR, rd, T_ADDR);
                    } else {
                        self.push_rr(out, TYPE_COPY, T_ADDR, rs1);
                        self.push_rr(out, TYPE_DIV, T_ADDR, rs2);
                        self.push_rr(out, TYPE_MUL, T_ADDR, rs2);
                        self.push_rr(out, TYPE_COPY, rd, rs1);
                        self.push_rr(out, TYPE_SUB_RR, rd, T_ADDR);
                    }
                    return false;
                }

                if let Some(op) = rr_op {
                    let commutative = matches!(
                        op,
                        TYPE_ADD_RR | TYPE_AND_RR | TYPE_OR_RR | TYPE_XOR_RR | TYPE_MUL
                    );
                    if rd == rs1 {
                        self.push_rr(out, op, rd, rs2);
                    } else if rd == rs2 && commutative {
                        self.push_rr(out, op, rd, rs1);
                    } else if rd == rs2 {
                        // Non-commutative with rd == rs2: save rs2 first
                        self.push_rr(out, TYPE_COPY, T_ADDR, rs2);
                        self.push_rr(out, TYPE_COPY, rd, rs1);
                        self.push_rr(out, op, rd, T_ADDR);
                    } else {
                        self.push_rr(out, TYPE_COPY, rd, rs1);
                        self.push_rr(out, op, rd, rs2);
                    }
                }
            }

            // FENCE: nothing to order in the CA model
            0b0001111 => {},

            // ATOMICS (AMOSWAP.W)
            0b0101111 => {
                // AMOSWAP.W: funct5=00001. Atomicity is free on single-token substrate.
                // Swap rs2 into memory at (rs1), old value to rd.
                if funct7 >> 2 == 0b00001 {
                    // pointer chain once, LOAD_IND rd, STORE_IND rs2
                    self.push_pointer_chain(out, rs1, 0);
                    // Use T_CSR to hold old value in case rd == rs2
                    self.push_load_ind(out, T_CSR, T_ADDR);
                    self.push_store_ind(out, T_ADDR, rs2);
                    if rd != 0 {
                        self.push_rr(out, TYPE_COPY, rd, T_CSR);
                    }
                }
            }

            // SYSTEM: ECALL (trap to handler), MRET (return from trap)
            0b1110011 => {
                match funct3 {
                    // ECALL (imm=0, so rs2 field must be 0 — rs2=1 is EBREAK)
                    //
                    // v7.6: SBI console intercept. If a7 == 1 (legacy SBI
                    // console_putchar), write a0 into the MMIO ring buffer on
                    // row 9 and resume at pc+4, bypassing the trap entirely.
                    // Otherwise fall through to the standard mtvec trap.
                    //
                    // MMIO layout (see riscv_sbi_console_spec.md):
                    //   (0, 9)          producer_head (monotonic u32)
                    //   (10..74, 9)     64-char ring buffer
                    // Reached via LOAD_IND/STORE_IND synthesized pointers, so
                    // the ±2047 rel-offset horizon never applies.
                    //
                    // Row width: 7 (DBCN) + 5 (TIME) + 5 (KALLOC) + 5 (KFREE) + 29 (trap) + 1 (HALT) + 25 (SBI) + 15 (KALLOC) = 92 cells.
                    // MUST stay <= the bank width (payload_loader BANK_WIDTH,
                    // 128) or the row silently overwrites the next bank's
                    // column.
                    0b000 if rd == 0 && rs1 == 0 && rs2 == 0 && funct7 == 0 => {
                        let base_pc = match self.base_pc {
                            Some(b) => b,
                            None => {
                                self.push_halt(out);
                                return true;
                            }
                        };

                        const A0: usize = 10; // x10
                        const A7: usize = 17; // x17
                        // SBI Debug Console extension id (what the GeOS xv6
                        // port's uartputc_sync actually calls, fid 2 =
                        // console_write_byte; fid is not checked since the
                        // port only uses write_byte)
                        const SBI_DBCN: u32 = 0x4442_434E;
                        // SBI TIME extension ("TIME"): set_timer. Serviced as
                        // a no-op — the substrate has no timer interrupts yet,
                        // and timerinit() in the GeOS xv6 port's start() calls
                        // it before any trap vector exists.
                        const SBI_TIME: u32 = 0x5449_4D45;
                        const GEOS_KALLOC: u32 = 0x100;
                        const GEOS_KFREE: u32 = 0x101;
                        const SBI_HEAD_PTR: u32 = 9 << 16; // (0, 9) packed
                        const SBI_RING_X: u32 = 10;
                        const SBI_RING_MASK: u32 = 63;

                        // [7 cells] a7 == DBCN check; taken -> SBI block below
                        self.push_rr(out, TYPE_COPY, T_ADDR, A7);
                        self.push_ri(out, TYPE_XOR_RI, T_ADDR, SBI_DBCN);
                        let (cx, cy) = self.code_pos();
                        // Layout from the DBCN JZ opcode cell at cx:
                        let halt_x = cx + 47;
                        let sbi_x = cx + 48;
                        let resume_x = sbi_x + 22; // The JMP inside SBI block
                        let kalloc_x = sbi_x + 25; // cx + 73
                        
                        self.push_jz(out, T_ADDR, sbi_x, cy);

                        // [5 cells] a7 == TIME check
                        self.push_ri(out, TYPE_XOR_RI, T_ADDR, SBI_DBCN ^ SBI_TIME);
                        self.push_jz(out, T_ADDR, resume_x, cy);

                        // [5 cells] a7 == KALLOC check
                        self.push_ri(out, TYPE_XOR_RI, T_ADDR, SBI_TIME ^ GEOS_KALLOC);
                        self.push_jz(out, T_ADDR, kalloc_x, cy);

                        // [5 cells] a7 == KFREE check
                        self.push_ri(out, TYPE_XOR_RI, T_ADDR, GEOS_KALLOC ^ GEOS_KFREE);
                        self.push_jz(out, T_ADDR, resume_x, cy);

                        // [29 cells] standard trap: mepc <- pc + 4 (resume
                        // PC — no CSR arithmetic transpiles yet, so MRET
                        // returns past the ECALL), then jump through mtvec.
                        //
                        // Wild-jump guardrail: if mtvec is still 0 (no trap
                        // handler installed yet — e.g. an unserviced GeOS
                        // hypervisor call 0x100/0x101/0x200/0x201 or SBI TIME
                        // during early boot), HALT instead of mapping garbage
                        // through the PC-to-coord chain and flinging the
                        // token into arbitrary code.
                        self.push_ri(out, TYPE_LDI, CSR_MEPC, link_pc.unwrap_or(0));
                        self.push_rr(out, TYPE_COPY, T_ADDR, CSR_MTVEC);
                        self.push_jz(out, T_ADDR, halt_x, cy);
                        self.push_pc_to_coord_chain(out, base_pc);
                        self.push_jmp_ind_via_t_addr(out);

                        // [1 cell] HALT - target of the mtvec==0 guard
                        debug_assert_eq!(
                            self.code_pos().0,
                            halt_x,
                            "guardrail HALT drifted from the JZ target"
                        );
                        self.push_halt(out);
                        debug_assert_eq!(
                            self.code_pos().0,
                            sbi_x,
                            "SBI block offset drifted from the JZ target"
                        );

                        // [25 cells] SBI console_putchar
                        // head -> T_BYTE via pointer in T_CSR
                        self.push_ri(out, TYPE_LDI, T_CSR, SBI_HEAD_PTR);
                        self.push_load_ind(out, T_BYTE, T_CSR);
                        // ring cell pointer: (SBI_RING_X + head % 64, 9)
                        self.push_rr(out, TYPE_COPY, T_ADDR, T_BYTE);
                        self.push_ri(out, TYPE_AND_RI, T_ADDR, SBI_RING_MASK);
                        self.push_ri(out, TYPE_ADD_RI, T_ADDR, SBI_RING_X);
                        self.push_ri(out, TYPE_LDI, T_Y, 9 << 16);
                        self.push_rr(out, TYPE_OR_RR, T_ADDR, T_Y);
                        // ring[head % 64] = a0
                        self.push_store_ind(out, T_ADDR, A0);
                        // head += 1, write back
                        self.push_ri(out, TYPE_ADD_RI, T_BYTE, 1);
                        self.push_store_ind(out, T_CSR, T_BYTE);
                        // resume at pc + 4 (statically resolved); also the
                        // TIME no-op's branch target
                        let (rx, ry) = self.code_pos();
                        debug_assert_eq!(
                            rx, resume_x,
                            "resume JMP drifted from the TIME JZ target"
                        );
                        let (tx, ty) = branch_target(4).unwrap_or((kalloc_x + 15, cy));
                        self.push_jmp(out, tx, ty);
                        
                        // [15 cells] GEOS KALLOC (a7 == 0x100)
                        debug_assert_eq!(self.code_pos().0, kalloc_x, "KALLOC block drifted");
                        let init_bump_x = kalloc_x + 10;
                        let jmp_target_x = kalloc_x + 3;
                        
                        // JZ KALLOC_BUMP, init_bump
                        self.push_jz(out, KALLOC_BUMP, init_bump_x, cy);
                        // jmp_target: COPY a0, KALLOC_BUMP
                        self.push_rr(out, TYPE_COPY, A0, KALLOC_BUMP);
                        // ADD_RI KALLOC_BUMP, 4096 (1 page)
                        self.push_ri(out, TYPE_ADD_RI, KALLOC_BUMP, 4096);
                        // JMP tx, ty (resume)
                        self.push_jmp(out, tx, ty);
                        
                        // init_bump: LDI KALLOC_BUMP, 0x80200000 (after kernel)
                        debug_assert_eq!(self.code_pos().0, init_bump_x, "init_bump drifted");
                        self.push_ri(out, TYPE_LDI, KALLOC_BUMP, 0x80200000);
                        // JMP jmp_target
                        self.push_jmp(out, jmp_target_x, cy);

                        return true;
                    }

                    // MRET: return to the resume PC held in mepc
                    0b000 if rd == 0 && rs1 == 0 && rs2 == 2 && funct7 == 0b0011000 => {
                        let base_pc = match self.base_pc {
                            Some(b) => b,
                            None => {
                                self.push_halt(out);
                                return true;
                            }
                        };

                        self.push_rr(out, TYPE_COPY, T_ADDR, CSR_MEPC);
                        self.push_pc_to_coord_chain(out, base_pc);
                        self.push_jmp_ind_via_t_addr(out);
                        return true;
                    }

                    // SRET: return to the resume PC held in sepc
                    0b000 if rd == 0 && rs1 == 0 && rs2 == 2 && funct7 == 0b0001000 => {
                        let base_pc = match self.base_pc {
                            Some(b) => b,
                            None => {
                                self.push_halt(out);
                                return true;
                            }
                        };

                        self.push_rr(out, TYPE_COPY, T_ADDR, CSR_SEPC);
                        self.push_pc_to_coord_chain(out, base_pc);
                        self.push_jmp_ind_via_t_addr(out);
                        return true;
                    }

                    // WFI: sleep, but here just fall through
                    0b000 if rd == 0 && rs1 == 0 && rs2 == 5 && funct7 == 0b0001000 => {
                        // NOP
                    }

                    // SFENCE.VMA (any rs1/rs2 form): no-op on the
                    // single-token substrate — no TLB/VM caching to flush.
                    // Emits NOTHING (an actual NOP cell would kill the token).
                    0b000 if rd == 0 && funct7 == 0b0001001 => {}

                    // CSR instructions. The csr field (bits 31:20) is a
                    // RISC-V CSR NUMBER (0x300/0x305/0x341...), mapped to a
                    // register-bank slot via csr_to_reg — never used as a
                    // bank index directly. Unknown CSRs: reads return 0,
                    // writes are dropped (placeholder).
                    0b001 | 0b010 | 0b011 | 0b101 | 0b110 | 0b111 => {
                        let csr_num = (inst >> 20) & 0xFFF;
                        let csr = match Self::csr_to_reg(csr_num) {
                            Some(slot) => slot,
                            None => {
                                if rd != 0 {
                                    self.push_ri(out, TYPE_LDI, rd, 0);
                                }
                                return false;
                            }
                        };
                        let zimm = rs1 as u32; // immediate variants: 5-bit zimm in rs1 field
                        match funct3 {
                            // CSRRW: atomic read-write (always writes)
                            0b001 => self.push_csr_read_write(out, rd, csr, rs1),
                            // CSRRS: read, set bits (writes only if rs1 != x0)
                            0b010 => self.push_csr_read_set(out, rd, csr, rs1, None),
                            // CSRRC: read, clear bits
                            0b011 => self.push_csr_read_clear(out, rd, csr, rs1, None),
                            // CSRRWI: read, write immediate constant
                            0b101 => self.push_csr_read_write_imm(out, rd, csr, zimm),
                            // CSRRSI: read, set immediate bits
                            0b110 => self.push_csr_read_set(out, rd, csr, 0, Some(zimm)),
                            // CSRRCI: read, clear immediate bits
                            0b111 => self.push_csr_read_clear(out, rd, csr, 0, Some(zimm)),
                            _ => unreachable!(),
                        }
                    }

                    // EBREAK and unknown SYSTEM: halt
                    _ => {
                        self.push_halt(out);
                        return true;
                    }
                }
            }

            // Unknown: emit nothing (a bare NOP in the code row would kill
            // the token — NOP cells cannot acquire it)
            _ => {},
        }

        false
    }

    /// Transpile a single instruction with no program context.
    /// Branches/jumps resolve to fall-through (harmless no-ops); use
    /// transpile_program for real control flow.
    pub fn transpile(&mut self, inst: u32) -> Vec<TranspiledCell> {
        let mut out = Vec::new();
        self.transpile_instruction(inst, &mut out, None, None, &|_| None);
        out
    }

    /// Transpile a program using One-PC-per-Row layout (v7.2). If banking
    /// is enabled, uses Multi-Column Row-Bank Scheme:
    ///
    /// **Banking disabled**: instruction i occupies row code_base_y + i
    ///
    /// **Banking enabled**: instruction i's cells start at (bank_x, code_base_y + row) where:
    ///   row = i & (bank_height - 1)
    ///   bank = i >> bank_height_shift
    ///   bank_x = original_code_base_x + (bank << bank_shift)
    ///
    /// Runtime PC -> coordinate translation is pure math for JALR:
    ///   I = (PC - base_pc) >> 2
    ///   (with banking) row = I & (bank_height - 1), bank = I >> bank_height_shift
    ///   y = code_base_y + row
    ///   x = (banking_enabled ? bank << bank_shift : 0)
    ///   packed = (y << 16) | x
    ///
    /// Instructions that can fall through get a stitch JMP to the next row.
    /// When banking is enabled and crossing a bank boundary (row = bank_height - 1),
    /// the stitch JMP targets the next bank's first row.
    ///
    /// A HALT row is appended after the last instruction.
    ///
    /// Bounds: per-instruction width <= bank_width or grid_width (worst case SW: 23 cells
    /// + 3-cell stitch).
    pub fn transpile_program(&mut self, instructions: &[u32]) -> Vec<TranspiledCell> {
        let mut out = Vec::new();
        let n = instructions.len();

        if self.banking_enabled {
            // Multi-Column Row-Bank layout
            for (idx, &inst) in instructions.iter().enumerate() {
                // Calculate bank and row for this instruction
                let bank = idx >> self.bank_height_shift;
                let row = idx & (self.bank_height - 1);
                let bank_x = self.original_code_base_x + (bank << self.bank_shift);

                self.current_code_y = self.code_base_y + row;
                self.code_base_x = bank_x;
                self.pc_offset = 0;

                let orig_base_x = self.original_code_base_x;
                let code_base_y = self.code_base_y;
                let bank_height = self.bank_height;
                let bank_height_shift = self.bank_height_shift;
                let bank_shift = self.bank_shift;
                let resolver = move |byte_offset: i32| -> Option<(usize, usize)> {
                    let delta = byte_offset / 4;
                    let target_idx = idx as i64 + delta as i64;
                    if target_idx < 0 || (target_idx as usize) > n {
                        return None;
                    }
                    let target_idx = target_idx as usize;
                    let target_bank = target_idx >> bank_height_shift;
                    let target_row = target_idx & (bank_height - 1);
                    let target_bank_x = orig_base_x + (target_bank << bank_shift);
                    Some((target_bank_x, code_base_y + target_row))
                };
                let link_pc = self.base_pc.map(|b| b + 4 * (idx as u32 + 1));
                let current_pc = self.base_pc.map(|b| b + 4 * (idx as u32));

                let terminated = self.transpile_instruction(inst, &mut out, link_pc, current_pc, &resolver);
                if !terminated {
                    // Stitch: hand the token to the next instruction's row
                    let next_idx = idx + 1;
                    let next_bank = next_idx >> self.bank_height_shift;
                    let next_row = next_idx & (self.bank_height - 1);
                    let next_bank_x = orig_base_x + (next_bank << bank_shift);
                    self.push_jmp(&mut out, next_bank_x, code_base_y + next_row);
                }
            }

            // Final HALT row
            let last_idx = n;
            let last_bank = last_idx >> self.bank_height_shift;
            let last_row = last_idx & (self.bank_height - 1);
            let last_bank_x = self.original_code_base_x + (last_bank << self.bank_shift);
            self.current_code_y = self.code_base_y + last_row;
            self.code_base_x = last_bank_x;
            self.pc_offset = 0;
            self.push_halt(&mut out);

            // Restore bases for subsequent single-shot use
            self.code_base_x = self.original_code_base_x;
            self.current_code_y = self.code_base_y;
        } else {
            // Original single-column layout
            for (idx, &inst) in instructions.iter().enumerate() {
                self.current_code_y = self.code_base_y + idx;
                self.pc_offset = 0;

                let code_base_x = self.code_base_x;
                let code_base_y = self.code_base_y;
                let resolver = move |byte_offset: i32| -> Option<(usize, usize)> {
                    let delta = byte_offset / 4;
                    let target_idx = idx as i64 + delta as i64;
                    if target_idx >= 0 && (target_idx as usize) <= n {
                        Some((code_base_x, code_base_y + target_idx as usize))
                    } else {
                        None
                    }
                };
                let link_pc = self.base_pc.map(|b| b + 4 * (idx as u32 + 1));
                let current_pc = self.base_pc.map(|b| b + 4 * (idx as u32));

                let terminated = self.transpile_instruction(inst, &mut out, link_pc, current_pc, &resolver);
                if !terminated {
                    let (nx, ny) = (self.code_base_x, self.code_base_y + idx + 1);
                    self.push_jmp(&mut out, nx, ny);
                }
            }

            // Final HALT row
            self.current_code_y = self.code_base_y + n;
            self.pc_offset = 0;
            self.push_halt(&mut out);
        }

        // Restore for subsequent single-shot use
        self.code_base_x = self.original_code_base_x;
        self.current_code_y = self.code_base_y;
        out
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn opcode_of(cell: &CellState) -> u32 {
        cell.opcode_or_type & 0xFF
    }

    fn rel_of(cell: &CellState) -> (i32, i32) {
        let unpack = |v: u32| -> i32 {
            let v = v & 0xFFF;
            if v >= 0x800 {
                v as i32 - 0x1000
            } else {
                v as i32
            }
        };
        (
            unpack(cell.opcode_or_type >> 8),
            unpack(cell.opcode_or_type >> 20),
        )
    }

    #[test]
    fn test_spatial_register_bank() {
        let bank = SpatialRegisterBank::new(10, 5);
        assert_eq!(bank.register_to_coord(0), (10, 5));
        assert_eq!(bank.register_to_coord(10), (12, 6));
        assert_eq!(bank.register_to_coord(31), (17, 8));
        assert_eq!(bank.register_to_coord(32), (10, 9));
        assert_eq!(bank.register_to_coord(33), (10, 10));
        // T_BYTE at base+(1,6) — base+(0,8) collided with the code region
        assert_eq!(bank.register_to_coord(37), (11, 11));
    }

    #[test]
    fn test_cells_live_in_code_rows() {
        // One-PC-per-Row: instruction i's cells occupy row 8 + i only, are
        // consecutive from x=0 (no gaps for the token to die in), and never
        // touch register rows (0-5).
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_memory_region(0, 32, 128);
        // SW x6, 8(x5); LW x2, 8(x5)
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (8 << 7) | 0b0100011;
        let lw = (8 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0000011;
        let cells = t.transpile_program(&[sw, lw]);

        let mut per_row: std::collections::BTreeMap<usize, Vec<usize>> =
            std::collections::BTreeMap::new();
        for c in &cells {
            assert!(
                c.y >= 8,
                "cell at ({}, {}) is outside the code rows",
                c.x,
                c.y
            );
            per_row.entry(c.y).or_default().push(c.x);
        }
        // SW row 8, LW row 9, HALT row 10
        assert_eq!(per_row.keys().copied().collect::<Vec<_>>(), vec![8, 9, 10]);
        for (row, xs) in &per_row {
            for (i, x) in xs.iter().enumerate() {
                assert_eq!(*x, i, "row {} not consecutive at cell {}", row, i);
            }
        }
        // SW: 25 cells + 3 stitch; LW: 24 + 3 stitch; HALT: 1
        assert_eq!(per_row[&8].len(), 28);
        assert_eq!(per_row[&9].len(), 27);
        assert_eq!(per_row[&10].len(), 1);
    }

    #[test]
    fn test_lw_pointer_chain_layout() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_memory_region(0, 32, 128);
        // LW x2, 8(x5)
        let lw = (8 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0000011;
        let cells = t.transpile(lw);

        // 11 chain ops x 2 cells + LOAD_IND (2 cells) = 24
        assert_eq!(cells.len(), 24);

        // Step 1: COPY t_addr, rs1 — opcode cell at (0,8), target t_addr (0,4)
        assert_eq!(opcode_of(&cells[0].cell), TYPE_COPY);
        assert_eq!(rel_of(&cells[0].cell), (0, -4));
        // Companion packs src offsets to x5 at (5,0), relative to opcode cell
        assert_eq!(rel_of(&cells[1].cell), (5, -8));

        // Step 2: ADD_RI t_addr, 8 — immediate in companion data_buffer
        assert_eq!(opcode_of(&cells[2].cell), TYPE_ADD_RI);
        assert_eq!(cells[3].cell.data_buffer, 8);
        // Step 3: vaddr rebase (SUB_RI 0 when no with_memory_vaddr)
        assert_eq!(opcode_of(&cells[4].cell), TYPE_SUB_RI);
        assert_eq!(cells[5].cell.data_buffer, 0);

        // Final op: LOAD_IND targeting x2 at (2,0) from opcode cell (22,8)
        assert_eq!(opcode_of(&cells[22].cell), TYPE_LOAD_IND);
        assert_eq!(rel_of(&cells[22].cell), (2 - 22, -8));
        // Companion points to t_addr (0,4) relative to opcode cell (22,8)
        assert_eq!(rel_of(&cells[23].cell), (0 - 22, 4 - 8));
    }

    #[test]
    fn test_sw_uses_store_ind() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_memory_region(0, 32, 128);
        // SW x6, 8(x5)
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (8 << 7) | 0b0100011;
        let cells = t.transpile(sw);
        // 11 chain ops x 2 + STORE_IND (3 cells) = 25
        assert_eq!(cells.len(), 25);
        assert_eq!(opcode_of(&cells[22].cell), TYPE_STORE_IND);
        assert_eq!(rel_of(&cells[22].cell), (0, 0));
    }

    #[test]
    fn test_branch_beq_zero_uses_direct_jz() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        // BEQ x5, x0, +8 (two instructions forward); imm[4:1] field = 8 >> 1
        let beq = (0 << 20) | (5 << 15) | (0b000 << 12) | (4 << 8) | 0b1100011;
        // addi x1, x0, 7 (the skipped instruction), addi x2, x0, 9 (target)
        let addi1 = (7 << 20) | (0 << 15) | (1 << 7) | 0b0010011;
        let addi2 = (9 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let cells = t.transpile_program(&[beq, addi1, addi2]);

        // BEQ vs x0 -> direct JZ on x5 in row 8, targeting instruction 2's
        // row (10) at x=0; then a stitch JMP to row 9.
        assert_eq!(opcode_of(&cells[0].cell), TYPE_JZ);
        assert_eq!(cells[1].cell.opcode_or_type, 0); // target x
        assert_eq!(cells[2].cell.opcode_or_type, 10); // target y = row of instr 2
        assert_eq!(opcode_of(&cells[3].cell), TYPE_JMP); // stitch to row 9
        assert_eq!(cells[4].cell.opcode_or_type, 0);
        assert_eq!(cells[5].cell.opcode_or_type, 9);
        // HALT row at the end
        let last = cells.last().unwrap();
        assert_eq!(opcode_of(&last.cell), TYPE_HALT);
        assert_eq!((last.x, last.y), (0, 11));
    }

    /// Guards the branch lowering that the SLT-inversion bug hid: BLT must
    /// lower to SLT_RR + JZ-over-JMP (taken when rs1 < rs2), and BGE to a
    /// direct JZ on the SLT result (taken when NOT rs1 < rs2). This is a
    /// structural check; the runtime-value proof is dump_gpu_signed_loop_bin
    /// (count==8), which fails loudly if the shader select() is reinverted.
    #[test]
    fn test_signed_branch_lowering() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        // BLT x5, x6, +8
        let blt = (0 << 25) | (6 << 20) | (5 << 15) | (0b100 << 12) | (4 << 8) | 0b1100011;
        let cells = t.transpile_program(&[blt, 0x13, 0x13]);
        let ops: Vec<u32> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_SLT_RR), "BLT must compute rs1 < rs2 via SLT_RR");
        assert!(ops.contains(&TYPE_JZ) && ops.contains(&TYPE_JMP),
                "BLT taken-path is JZ-over-JMP");
    }

    #[test]
    fn test_transpile_lui() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        // LUI x5, 0x12345
        let lui = (0x12345 << 12) | (5 << 7) | 0b0110111;
        let cells = t.transpile(lui);
        assert_eq!(cells.len(), 2);
        assert_eq!(opcode_of(&cells[0].cell), TYPE_LDI);
        assert_eq!(cells[1].cell.data_buffer, 0x12345 << 12);
    }

    #[test]
    fn test_writes_to_x0_are_discarded() {
        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        // ADDI x0, x0, 5
        let addi = (5 << 20) | (0 << 15) | (0 << 7) | 0b0010011;
        assert!(t.transpile(addi).is_empty());
        // LW x0, 0(x5) — side-effect free, fully elided
        let lw = (0 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0b0000011;
        assert!(t.transpile(lw).is_empty());
    }

    /// Dumps a harness-format .bin exercising SW + LW through runtime
    /// pointers, for GPU execution with tests/spatial_runner. Run with:
    ///   cargo test -p infinite_map_rs dump_gpu_smoke -- --ignored
    /// then: spatial_runner <GEOS_TRANSPILER_DUMP>/transpiler_lw_sw.bin
    #[test]
    #[ignore]
    fn dump_gpu_smoke_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_lw_sw.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_memory_region(0, 32, 128);
        // SW x6, 8(x5): mem[x5 + 8] = x6
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (8 << 7) | 0b0100011;
        // LW x2, 8(x5): x2 = mem[x5 + 8]
        let lw = (8 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0000011;
        let mut cells = t.transpile_program(&[sw, lw]);

        // Seed registers: x5 = 256 (byte addr base), x6 = 777 (store value).
        // addr 256+8=264 -> word 66 -> grid (66, 32)
        cells.push(TranspiledCell {
            x: 5,
            y: 0,
            cell: CellState {
                opcode_or_type: TYPE_NOP,
                is_active: 0,
                data_buffer: 256,
                executing: 0,
            },
        });
        cells.push(TranspiledCell {
            x: 6,
            y: 0,
            cell: CellState {
                opcode_or_type: TYPE_NOP,
                is_active: 0,
                data_buffer: 777,
                executing: 0,
            },
        });

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Dumps a harness-format .bin exercising JALR through JMP_IND in the
    /// single-column (non-banked) layout — the banked variant is covered by
    /// dump_gpu_banked_jalr_bin. Program (base_pc = 0):
    ///   0x0: ADDI x5, x0, 12   ; x5 = PC of instruction 3
    ///   0x4: JALR x1, 0(x5)    ; jump to PC 12, link x1 = 8
    ///   0x8: ADDI x2, x0, 99   ; must be skipped
    ///   0xC: ADDI x5, x0, 55   ; jump target
    /// Expected on GPU: x5 = 55, x1 = 8, x2 = 0.
    #[test]
    #[ignore]
    fn dump_gpu_jalr_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_jalr.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let addi_x5_12 = (12 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let jalr = (0 << 20) | (5 << 15) | (1 << 7) | 0b1100111;
        let addi_x2_99 = (99 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let addi_x5_55 = (55 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let cells = t.transpile_program(&[addi_x5_12, jalr, addi_x2_99, addi_x5_55]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    #[test]
    fn test_jalr_uses_jmp_ind() {
        // JALR x1, 0(x10): jump through x10, return addr to x1
        // Base PC = 0x1000 (so we test the PC-to-coordinate mapping)
        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0x1000)
            .with_row_banking(128, 4096);

        let jalr = (1 << 7) | (10 << 15) | (0 << 20) | 0b1100111;
        let cells = t.transpile(jalr);

        // JALR should emit:
        // - LDI x1, return_packed (2 cells) - return address
        // - COPY T_ADDR, x10 (2 cells)
        // - ADDI T_ADDR, 0 (2 cells)
        // - ANDI T_ADDR, 0xfffffffe (2 cells)
        // - SUBI T_ADDR, 0x1000 (2 cells)
        // - SHRI T_ADDR, 2 (2 cells)
        // - COPY T_Y, T_ADDR (2 cells)
        // - ANDI T_Y, 0xfff (2 cells) - bank_height mask
        // - ADDI T_Y, 8 (2 cells) - code_base_y
        // - SHRI T_ADDR, 12 (2 cells) - bank_height_shift
        // - SHLI T_ADDR, 7 (2 cells) - bank_shift
        // - SHLI T_Y, 16 (2 cells)
        // - OR T_ADDR, T_Y (2 cells)
        // - JMP_IND rel->T_ADDR (2 cells)
        // Total: ~28 cells
        assert!(
            cells.len() >= 20,
            "JALR should emit multiple cells, got {}",
            cells.len()
        );

        // Find the JMP_IND cell
        let jmp_ind_idx = cells
            .iter()
            .position(|c| opcode_of(&c.cell) == TYPE_JMP_IND);
        assert!(jmp_ind_idx.is_some(), "JALR should emit JMP_IND opcode");

        // Verify key operations are present
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "JALR should emit COPY");
        assert!(ops.contains(&TYPE_ADD_RI), "JALR should emit ADD_RI");
        assert!(ops.contains(&TYPE_AND_RI), "JALR should emit AND_RI");
        assert!(ops.contains(&TYPE_SHR_RI), "JALR should emit SHR_RI");
        assert!(ops.contains(&TYPE_SHL_RI), "JALR should emit SHL_RI");
        assert!(ops.contains(&TYPE_OR_RR), "JALR should emit OR_RR");

        println!(
            "JALR transpilation test passed: {} cells emitted",
            cells.len()
        );
    }

    #[test]
    fn test_row_banking_layout() {
        // Test that multi-bank layout distributes instructions correctly
        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_row_banking(128, 16); // bank_height=16 for easy testing

        // Create 35 instructions (enough to cross bank boundary at 16)
        let addi_x5_0 = (0 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let instructions: Vec<u32> = (0..35).map(|_| addi_x5_0).collect();

        let cells = t.transpile_program(&instructions);

        // Check that cells are in correct banks
        // Bank 0: instructions 0-15 at x=0, y=8-23
        // Bank 1: instructions 16-31 at x=128, y=8-23
        // Bank 2: instruction 32 at x=256, y=8
        // HALT: instruction 35 at x=256, y=9
        let mut per_bank: std::collections::BTreeMap<usize, Vec<usize>> =
            std::collections::BTreeMap::new();
        for c in &cells {
            let bank = c.x >> 7; // bank_width=128, bank_shift=7
            per_bank.entry(bank).or_default().push(c.y);
        }

        assert!(per_bank.contains_key(&0), "Should have bank 0");
        assert!(per_bank.contains_key(&1), "Should have bank 1");
        assert!(per_bank.contains_key(&2), "Should have bank 2");

        // The stitch at the END of bank 0 (instruction 15, last row) must
        // target bank 1's first row — not loop back to bank 0. Instruction
        // 15 is LDI(2) + stitch JMP(3) starting at (0, 8 + 15).
        let stitch = cells
            .iter()
            .position(|c| c.x == 2 && c.y == 8 + 15)
            .expect("stitch JMP for instruction 15");
        assert_eq!(cells[stitch].cell.opcode_or_type & 0xFF, TYPE_JMP);
        assert_eq!(cells[stitch + 1].cell.opcode_or_type, 128, "stitch tx = bank 1");
        assert_eq!(cells[stitch + 2].cell.opcode_or_type, 8, "stitch ty = first row");

        // HALT (index 35) lives in bank 2 (35 >> 4 = 2) at row 35 & 15 = 3
        let last = cells.last().unwrap();
        assert_eq!(last.cell.opcode_or_type & 0xFF, TYPE_HALT);
        assert_eq!((last.x, last.y), (256, 8 + 3));

        println!("Row banking layout test passed: {} cells across {} banks", cells.len(), per_bank.len());
    }

    /// Dumps a harness-format .bin exercising a JALR across bank boundaries
    /// under the Multi-Column Row-Bank Scheme (banks 32 wide, 4 rows tall —
    /// sized for the 128x64 GPU harness). Program (base_pc = 0):
    ///   i0 (bank 0, row 0): ADDI x5, x0, 28  ; x5 = PC of i7
    ///   i1 (bank 0, row 1): JALR x1, 0(x5)   ; jump to bank 1 row 3
    ///   i2..i6:             ADDI x2, x0, 99  ; all must be skipped
    ///   i7 (bank 1, row 3): ADDI x5, x0, 55  ; then stitch crosses into
    ///                                          bank 2 for the HALT (idx 8)
    /// Expected on GPU: x5 = 55, x1 = 8, x2 = 0.
    #[test]
    #[ignore]
    fn dump_gpu_banked_jalr_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_banked_jalr.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_row_banking(32, 4);
        let addi_x5_28 = (28 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let jalr = (0 << 20) | (5 << 15) | (1 << 7) | 0b1100111;
        let addi_x2_99 = (99 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let addi_x5_55 = (55 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let program = [
            addi_x5_28, jalr, addi_x2_99, addi_x2_99, addi_x2_99, addi_x2_99, addi_x2_99,
            addi_x5_55,
        ];
        let cells = t.transpile_program(&program);

        // Static layout sanity: i7 in bank 1 (x 32+), HALT in bank 2 (x 64+)
        let last = cells.last().unwrap();
        assert_eq!(last.cell.opcode_or_type & 0xFF, TYPE_HALT);
        assert_eq!((last.x, last.y), (64, 8), "HALT must open bank 2");

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Dumps a harness-format .bin exercising a full trap round-trip:
    /// ECALL -> handler (via mtvec) -> MRET -> resume -> JAL -> HALT.
    /// mtvec cell (1, 6) is pre-seeded with the handler PC (16).
    /// Program (base_pc = 0, code rows 8..14):
    ///   PC 0  (row 8):  ADDI x2, x0, 7   ; pre-trap marker
    ///   PC 4  (row 9):  ECALL            ; mepc <- 8, jump to mtvec (16)
    ///   PC 8  (row 10): ADDI x5, x0, 55  ; resume point
    ///   PC 12 (row 11): JAL x0, +12      ; skip handler, go to HALT row
    ///   PC 16 (row 12): ADDI x1, x0, 42  ; handler body
    ///   PC 20 (row 13): MRET             ; return to mepc (8)
    /// Expected on GPU: x2 = 7, x1 = 42, x5 = 55.
    #[test]
    #[ignore]
    fn dump_gpu_trap_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_trap.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let addi_x2_7 = (7 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let ecall = 0x0000_0073;
        let addi_x5_55 = (55 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let jal_skip = (6 << 21) | 0b1101111; // JAL x0, +12
        let addi_x1_42 = (42 << 20) | (0 << 15) | (1 << 7) | 0b0010011;
        let mret = 0x3020_0073;
        let mut cells =
            t.transpile_program(&[addi_x2_7, ecall, addi_x5_55, jal_skip, addi_x1_42, mret]);

        // Pre-seed mtvec (reg 35 at (1, 7)) with the handler PC
        cells.push(TranspiledCell {
            x: 1,
            y: 7,
            cell: CellState {
                opcode_or_type: TYPE_NOP,
                is_active: 0,
                data_buffer: 16,
                executing: 0,
            },
        });

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    #[test]
    fn test_ecall_saves_pc_and_jumps_to_mtvec() {
        // Test that ECALL saves PC to mepc and jumps to mtvec
        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0x1000)
            .with_row_banking(128, 4096);

        // ECALL instruction (0x00000073)
        let ecall = 0x00000073;
        let cells = t.transpile(ecall);

        // ECALL should emit several cells for the trap handling
        assert!(
            cells.len() >= 15,
            "ECALL should emit trap chain, got {}",
            cells.len()
        );

        // Check for key operations
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(
            ops.contains(&TYPE_LDI),
            "ECALL should emit LDI to save PC to mepc"
        );
        assert!(
            ops.contains(&TYPE_COPY),
            "ECALL should emit COPY to read mtvec"
        );
        assert!(
            ops.contains(&TYPE_SUB_RI),
            "ECALL should emit SUB_RI for PC math"
        );
        assert!(
            ops.contains(&TYPE_SHR_RI),
            "ECALL should emit SHR_RI for banking math"
        );
        assert!(
            ops.contains(&TYPE_AND_RI),
            "ECALL should emit AND_RI for banking math"
        );
        // The bug class this guards: a chain that computes the pointer but
        // never jumps. ECALL must end in JMP_IND.
        assert!(
            ops.contains(&TYPE_JMP_IND),
            "ECALL must emit JMP_IND to actually enter the handler"
        );
        // v7.6 layout: 7-cell DBCN check, 5-cell TIME check, 29-cell trap
        // block (with mtvec==0 guardrail), 1-cell HALT, 25-cell SBI block —
        // 67 cells total. Must stay <= 128 (payload_loader BANK_WIDTH) or
        // ECALL rows overwrite the next code bank's column.
        assert_eq!(cells.len(), 92);
        assert!(cells.len() <= 128, "ECALL row must fit a 128-cell code bank");
        assert_eq!(opcode_of(&cells[0].cell), TYPE_COPY); // a7 check
        assert_eq!(opcode_of(&cells[4].cell), TYPE_JZ); // branch to SBI block
        assert_eq!(cells[5].cell.opcode_or_type, 52); // JZ tx = SBI block col
        assert!(ops.contains(&TYPE_STORE_IND), "SBI block writes the ring");

        // SBI TIME no-op: XOR chain (a7^DBCN) ^ (DBCN^TIME) = a7^TIME, then
        // JZ to the resume JMP at column 74 (set_timer must not trap).
        assert_eq!(
            cells[8].cell.data_buffer,
            0x4442_434E ^ 0x5449_4D45,
            "TIME check should XOR against DBCN^TIME"
        );
        assert_eq!(opcode_of(&cells[9].cell), TYPE_JZ, "TIME check JZ");
        assert_eq!(
            cells[10].cell.opcode_or_type, 74,
            "TIME JZ should target the resume JMP"
        );
        assert_eq!(opcode_of(&cells[74].cell), TYPE_JMP); // resume JMP

        // Wild-jump guardrail: after COPY T_ADDR <- mtvec (cells 24-25), a JZ
        // must branch to the HALT cell at column 51 when mtvec is still 0,
        // instead of jumping through a garbage trap vector.
        assert_eq!(opcode_of(&cells[26].cell), TYPE_JZ, "mtvec==0 guard JZ");
        assert_eq!(
            cells[27].cell.opcode_or_type, 51,
            "mtvec==0 guard should target the HALT cell"
        );
        assert_eq!(opcode_of(&cells[51].cell), TYPE_HALT); // guardrail HALT

        println!("ECALL test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_mret_restores_from_mepc() {
        // Test that MRET restores PC from mepc
        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0x1000)
            .with_row_banking(128, 4096);

        // MRET instruction (0x30200073)
        let mret = 0x30200073;
        let cells = t.transpile(mret);

        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(
            ops.contains(&TYPE_JMP_IND),
            "MRET must emit JMP_IND to actually return"
        );

        // MRET should emit similar chain to JALR/ECALL
        assert!(
            cells.len() >= 12,
            "MRET should emit restore chain, got {}",
            cells.len()
        );

        // Check for key operations
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(
            ops.contains(&TYPE_COPY),
            "MRET should emit COPY to read mepc"
        );
        assert!(
            ops.contains(&TYPE_SUB_RI),
            "MRET should emit SUB_RI for PC math"
        );
        assert!(
            ops.contains(&TYPE_SHR_RI),
            "MRET should emit SHR_RI for banking math"
        );

        println!("MRET test passed: {} cells emitted", cells.len());
    }

    /// Dumps a harness-format .bin where the program installs its OWN trap
    /// handler via CSRRWI (no pre-seeded cells at all), then traps:
    ///   PC 0  (row 8):  CSRRWI x0, mtvec, 20 ; install handler
    ///   PC 4  (row 9):  ADDI x2, x0, 7
    ///   PC 8  (row 10): ECALL                ; mepc <- 12, jump to 20
    ///   PC 12 (row 11): ADDI x5, x0, 55      ; resume point
    ///   PC 16 (row 12): JAL x0, +12          ; skip handler -> HALT row
    ///   PC 20 (row 13): ADDI x1, x0, 42      ; handler body
    ///   PC 24 (row 14): MRET                 ; return to mepc (12)
    /// Expected on GPU: x2 = 7, x1 = 42, x5 = 55.
    #[test]
    #[ignore]
    fn dump_gpu_csr_trap_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_csr_trap.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let csrrwi_mtvec_20 =
            (0x305 << 20) | (20 << 15) | (0b101 << 12) | (0 << 7) | 0b1110011;
        let addi_x2_7 = (7 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let ecall = 0x0000_0073;
        let addi_x5_55 = (55 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let jal_skip = (6 << 21) | 0b1101111; // JAL x0, +12
        let addi_x1_42 = (42 << 20) | (0 << 15) | (1 << 7) | 0b0010011;
        let mret = 0x3020_0073;
        let cells = t.transpile_program(&[
            csrrwi_mtvec_20,
            addi_x2_7,
            ecall,
            addi_x5_55,
            jal_skip,
            addi_x1_42,
            mret,
        ]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Dumps a harness-format .bin exercising the v7.3 shift opcodes:
    ///   PC 0: ADDI x5, x0, -8   ; x5 = 0xFFFFFFF8
    ///   PC 4: SRAI x2, x5, 2    ; x2 = 0xFFFFFFFE (sign-extending shift)
    ///   PC 8: ADDI x6, x0, 3
    ///   PC 12: ADDI x7, x0, 2
    ///   PC 16: SLL x1, x6, x7   ; x1 = 3 << 2 = 12 (register-amount shift)
    /// Expected on GPU: x2 = 4294967294, x1 = 12.
    #[test]
    #[ignore]
    fn dump_gpu_shift_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_shift.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let addi_x5_neg8 = (0xFF8 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let srai_x2_x5_2 =
            (0b0100000 << 25) | (2 << 20) | (5 << 15) | (0b101 << 12) | (2 << 7) | 0b0010011;
        let addi_x6_3 = (3 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        let addi_x7_2 = (2 << 20) | (0 << 15) | (7 << 7) | 0b0010011;
        let sll_x1_x6_x7 = (7 << 20) | (6 << 15) | (0b001 << 12) | (1 << 7) | 0b0110011;
        let cells = t.transpile_program(&[
            addi_x5_neg8,
            srai_x2_x5_2,
            addi_x6_3,
            addi_x7_2,
            sll_x1_x6_x7,
        ]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        let mut f = std::fs::File::create(&path).unwrap();
        f.write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Sub-word loads on GPU: store 0xFFFFFF80, then LB (sign-extends the
    /// 0x80 byte) and LBU (zero-extends).
    /// Expected: x2 = 0xFFFFFF80 (4294967168), x1 = 128, x5 = 256.
    #[test]
    #[ignore]
    fn dump_gpu_subword_load_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_subword_load.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_memory_region(0, 32, 128);
        let addi_x5_256 = (256 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let addi_x6_neg128 = (0xF80 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0b0100011;
        let lb_x2 = (0 << 20) | (5 << 15) | (0b000 << 12) | (2 << 7) | 0b0000011;
        let lbu_x1 = (0 << 20) | (5 << 15) | (0b100 << 12) | (1 << 7) | 0b0000011;
        let cells = t.transpile_program(&[addi_x5_256, addi_x6_neg128, sw, lb_x2, lbu_x1]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// SB read-modify-write on GPU: word = 0xFFFFFF80, SB 0x42 into byte 1,
    /// LW back. Expected: x2 = 0xFFFF4280 (4294918784).
    #[test]
    #[ignore]
    fn dump_gpu_subword_store_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_subword_store.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_memory_region(0, 32, 128);
        let addi_x5_256 = (256 << 20) | (0 << 15) | (5 << 7) | 0b0010011;
        let addi_x6_neg128 = (0xF80 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0b0100011;
        let addi_x7_66 = (66 << 20) | (0 << 15) | (7 << 7) | 0b0010011;
        // SB x7, 1(x5): S-type imm=1 -> imm[4:0]=1 in bits 11:7
        let sb = (7 << 20) | (5 << 15) | (0b000 << 12) | (1 << 7) | 0b0100011;
        let lw_x2 = (0 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0000011;
        let cells =
            t.transpile_program(&[addi_x5_256, addi_x6_neg128, sw, addi_x7_66, sb, lw_x2]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// SBI console on GPU: two console_putchar ECALLs (a7=1) must write
    /// 'H' then 'i' into the row-9 ring buffer, bump the producer head to 2,
    /// and resume past each ECALL (x2 = 55 proves the resume path).
    /// The harness prints "[sbi-console] Hi".
    #[test]
    #[ignore]
    fn dump_gpu_sbi_console_bin() {
        use std::io::Write;

        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_sbi_console.bin");

        let mut t = RiscvTranspiler::new(0, 10, 0, 0).with_base_pc(0);
        // a7 = 0x4442434E (SBI DBCN) via LUI + ADDI
        let lui_a7 = (0x44424 << 12) | (17 << 7) | 0b0110111;
        let addi_a7 = (0x34E << 20) | (17 << 15) | (17 << 7) | 0b0010011;
        let addi_a0_h = (72 << 20) | (0 << 15) | (10 << 7) | 0b0010011; // a0 = 'H'
        let ecall = 0x0000_0073;
        let addi_a0_i = (105 << 20) | (0 << 15) | (10 << 7) | 0b0010011; // a0 = 'i'
        let addi_x2_55 = (55 << 20) | (0 << 15) | (2 << 7) | 0b0010011;
        let cells = t.transpile_program(&[
            lui_a7, addi_a7, addi_a0_h, ecall, addi_a0_i, ecall, addi_x2_55,
        ]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 10] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [
                c.x as u32,
                c.y as u32,
                c.cell.opcode_or_type,
                c.cell.data_buffer,
            ] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Decisive AMOSWAP.W test on the GPU. Seeds mem[lock]=7 with a normal
    /// SW, then amoswap.w swaps in 1 and must return the old 7:
    ///   ADDI x6, x0, 7
    ///   LUI  x5, 0x80000 ; ADDI x5, x5, 0x100   ; lock @ 0x80000100
    ///   SW   x6, 0(x5)                           ; mem[lock] = 7
    ///   ADDI x6, x0, 1
    ///   amoswap.w x2, x6, (x5)                   ; x2 = old (7), mem = 1
    ///   LW   x1, 0(x5)                           ; x1 = readback (1)
    /// Expected: x2 = 7 (AMO read old), x1 = 1 (AMO wrote). Anything else
    /// localizes the spinlock panic to the atomic itself.
    #[test]
    #[ignore]
    fn dump_gpu_amoswap_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_amoswap.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_memory_region(0, 32, 128)
            .with_memory_vaddr(0x8000_0000);
        let addi_x6_7 = (7 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        let lui_x5 = 0x8000_02B7u32; // LUI x5, 0x80000
        let addi_x5 = (0x100 << 20) | (5 << 15) | (5 << 7) | 0b0010011;
        let sw = (6 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0b0100011;
        let addi_x6_1 = (1 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        // amoswap.w x2, x6, (x5): funct5=00001, rd=2, rs1=5, rs2=6
        let amoswap = (0b00001 << 27) | (6 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0101111;
        let lw = (0 << 20) | (5 << 15) | (0b010 << 12) | (1 << 7) | 0b0000011;
        let cells = t.transpile_program(&[
            addi_x6_7, lui_x5, addi_x5, sw, addi_x6_1, amoswap, lw,
        ]);

        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] {
            buf.extend_from_slice(&v.to_le_bytes());
        }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells to {}", cells.len(), path.display());
    }

    /// Isolates the diag_hex failure: a down-counting signed loop
    ///   for (i = 28; i >= 0; i -= 4) count++;   // expect count == 8
    /// If x1 != 8, signed branch (BGE/BLT vs x0) is broken — which would
    /// also break loops throughout the kernel.
    #[test]
    #[ignore]
    fn dump_gpu_signed_loop_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_signed_loop.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let addi = |rd: u32, rs1: u32, imm: i32| ((imm as u32) << 20) | (rs1 << 15) | (rd << 7) | 0b0010011;
        // BLT rs1, rs2, imm (B-type). imm=16 -> bits: [12|10:5|4:1|11]
        let blt = |rs1: u32, rs2: u32, imm: i32| {
            let u = imm as u32;
            (((u >> 12) & 1) << 31) | (((u >> 5) & 0x3F) << 25) | (rs2 << 20) | (rs1 << 15)
                | (0b100 << 12) | (((u >> 1) & 0xF) << 8) | (((u >> 11) & 1) << 7) | 0b1100011
        };
        // JAL x0, imm (J-type)
        let jal = |imm: i32| {
            let u = imm as u32;
            (((u >> 20) & 1) << 31) | (((u >> 1) & 0x3FF) << 21) | (((u >> 11) & 1) << 20)
                | (((u >> 12) & 0xFF) << 12) | 0b1101111
        };
        let prog = [
            addi(2, 0, 28),  // i0: i = 28  (x2)
            addi(1, 0, 0),   // i1: count = 0 (x1)
            blt(2, 0, 16),   // i2 (loop): if i < 0 -> i6 (end), +16 bytes
            addi(1, 1, 1),   // i3: count++
            addi(2, 2, -4),  // i4: i -= 4
            jal(-12),        // i5: goto loop (i2)
            addi(3, 0, 99),  // i6 (end): sentinel x3 = 99
        ];
        let cells = t.transpile_program(&prog);
        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] { buf.extend_from_slice(&v.to_le_bytes()); }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells", cells.len());
    }

    /// Struct-clobber test (spinlock acquire->cpu-store->reread). Mirrors
    /// how acquire() writes lk->locked (offset 0) via AMOSWAP then lk->cpu
    /// (offset 8) via SW, and holding() re-reads lk->locked:
    ///   x5 = &lock (0x80000100)
    ///   amoswap.w x0, x6=1, (x5)   ; lock.locked = 1
    ///   sw x7=42, 8(x5)            ; lock.cpu = 42
    ///   lw x1, 0(x5)              ; reread locked -> expect 1 (NOT clobbered)
    ///   lw x2, 8(x5)              ; reread cpu    -> expect 42
    /// If x1 != 1, the offset-8 store corrupted offset 0: a spatial address
    /// aliasing bug in the pointer chain / memory wrap.
    #[test]
    #[ignore]
    fn dump_gpu_struct_clobber_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_struct_clobber.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_memory_region(0, 32, 128)
            .with_memory_vaddr(0x8000_0000);
        let lui_x5 = 0x8000_02B7u32;
        let addi_x5 = (0x100 << 20) | (5 << 15) | (5 << 7) | 0b0010011;
        let addi_x6_1 = (1 << 20) | (0 << 15) | (6 << 7) | 0b0010011;
        let amoswap = (0b00001 << 27) | (6 << 20) | (5 << 15) | (0b010 << 12) | (0 << 7) | 0b0101111;
        let addi_x7_42 = (42 << 20) | (0 << 15) | (7 << 7) | 0b0010011;
        // sw x7, 8(x5): S-type imm=8 -> imm[4:0]=8 in bits 11:7
        let sw8 = (7 << 20) | (5 << 15) | (0b010 << 12) | (8 << 7) | 0b0100011;
        let lw0 = (0 << 20) | (5 << 15) | (0b010 << 12) | (1 << 7) | 0b0000011;
        let lw8 = (8 << 20) | (5 << 15) | (0b010 << 12) | (2 << 7) | 0b0000011;
        let cells = t.transpile_program(&[
            lui_x5, addi_x5, addi_x6_1, amoswap, addi_x7_42, sw8, lw0, lw8,
        ]);
        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] { buf.extend_from_slice(&v.to_le_bytes()); }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells", cells.len());
    }

    /// Confirms a seeded data word (simulating a .data global) is readable
    /// on-grid via LW — the loader seeds .data at its vaddr, the pointer
    /// chain must read the same cell. Test seeds mem[0x80000200]=16 as a
    /// TranspiledCell (as the loader does), then LW x1, 0x200(x0-based ptr).
    #[test]
    #[ignore]
    fn dump_gpu_data_seed_read_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_data_seed.bin");

        let mut t = RiscvTranspiler::new(0, 8, 0, 0)
            .with_base_pc(0)
            .with_memory_region(0, 32, 128)
            .with_memory_vaddr(0x8000_0000);
        let lui_x5 = 0x8000_02B7u32;               // x5 = 0x80000000
        let addi_x5 = (0x200 << 20) | (5 << 15) | (5 << 7) | 0b0010011; // x5 = 0x80000200
        let lw = (0 << 20) | (5 << 15) | (0b010 << 12) | (1 << 7) | 0b0000011; // x1 = mem[x5]
        let mut cells = t.transpile_program(&[lui_x5, addi_x5, lw]);

        // Seed like the loader: (0x200>>2 = 128) -> (128 % 128, 32 + 128/128) = (0, 33)
        cells.push(TranspiledCell {
            x: 0, y: 33,
            cell: CellState { opcode_or_type: TYPE_NOP, is_active: 0, data_buffer: 16, executing: 0 },
        });
        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] { buf.extend_from_slice(&v.to_le_bytes()); }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] {
                buf.extend_from_slice(&v.to_le_bytes());
            }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells", cells.len());
    }

    /// REMU correctness (the hand-drafted a-(a/b)*b chain). consoleintr
    /// indexes cons.buf with `cons.e % INPUT_BUF`; a wrong REMU sends the
    /// write off the end of buf and can clobber cons.lock at offset 0.
    ///   x6 = 100, x7 = 7  -> REMU x1 = 2
    ///   x8 = 333, x9 = 128 -> REMU x2 = 77
    #[test]
    #[ignore]
    fn dump_gpu_remu_bin() {
        use std::io::Write;
        let dir = std::env::var("GEOS_TRANSPILER_DUMP").unwrap_or_else(|_| ".".to_string());
        let path = std::path::Path::new(&dir).join("transpiler_remu.bin");
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0);
        let addi = |rd: u32, imm: i32| ((imm as u32) << 20) | (0 << 15) | (rd << 7) | 0b0010011;
        // REMU rd, rs1, rs2: funct7=0000001, funct3=111
        let remu = |rd: u32, rs1: u32, rs2: u32| (0b0000001 << 25) | (rs2 << 20) | (rs1 << 15) | (0b111 << 12) | (rd << 7) | 0b0110011;
        let prog = [
            addi(6, 100), addi(7, 7), remu(1, 6, 7),      // x1 = 100 % 7 = 2
            addi(8, 333), addi(9, 128), remu(2, 8, 9),    // x2 = 333 % 128 = 77
        ];
        let cells = t.transpile_program(&prog);
        let mut buf: Vec<u8> = Vec::new();
        for v in [128u32, 64, cells.len() as u32, 0, 8] { buf.extend_from_slice(&v.to_le_bytes()); }
        for c in &cells {
            for v in [c.x as u32, c.y as u32, c.cell.opcode_or_type, c.cell.data_buffer] { buf.extend_from_slice(&v.to_le_bytes()); }
        }
        std::fs::File::create(&path).unwrap().write_all(&buf).unwrap();
        println!("wrote {} cells", cells.len());
    }

    #[test]
    fn test_csrrw_atomic_read_write() {
        // Test CSRRW x5, mepc, x10
        // Encoding: csr=0x341 (mepc), rs1=x10, rd=x5, funct3=001
        let csr_val = 0x341u32 << 20; // real CSR number for mepc in bits 31:20
        let csrrw_x5_mepc_x10 = csr_val | (10 << 15) | (5 << 7) | (0b001 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(100);
        let cells = t.transpile(csrrw_x5_mepc_x10);

        // Should emit: COPY T_CSR, x10; COPY x5, mepc; COPY mepc, T_CSR
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRW should emit COPY operations");

        // Check that the chain doesn't emit cells when rd=0 and rs1=0 (no-op)
        let csrrw_x0_mepc_x0 = csr_val | (0 << 15) | (0 << 7) | (0b001 << 12) | 0b1110011;
        let cells_zero_write = t.transpile(csrrw_x0_mepc_x0);
        // Per RISC-V, CSRRW always writes: x0 source writes zero (COPY csr, x0)
        assert_eq!(
            cells_zero_write.len(),
            2,
            "CSRRW x0, csr, x0 must still write zero to the CSR"
        );
        assert_eq!(opcode_of(&cells_zero_write[0].cell), TYPE_COPY);

        println!("CSRRW test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_csrrs_read_set() {
        // Test CSRRS x5, mepc, x10
        let csr_val = 0x341u32 << 20; // real CSR number for mepc
        let csrrs_x5_mepc_x10 = csr_val | (10 << 15) | (5 << 7) | (0b010 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        let cells = t.transpile(csrrs_x5_mepc_x10);

        // Should emit: COPY T_CSR, x10; COPY x5, mepc; OR_RR mepc, T_CSR
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRS should emit COPY operations");
        assert!(ops.contains(&TYPE_OR_RR), "CSRRS should emit OR_RR");

        println!("CSRRS test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_csrrc_read_clear() {
        // Test CSRRC x5, mepc, x10
        let csr_val = 0x341u32 << 20; // real CSR number for mepc
        let csrrc_x5_mepc_x10 = csr_val | (10 << 15) | (5 << 7) | (0b011 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        let cells = t.transpile(csrrc_x5_mepc_x10);

        // Should emit: COPY T_CSR, x10; XOR_RI T_CSR, 0xFFFFFFFF; COPY x5, mepc; AND_RR mepc, T_CSR
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRC should emit COPY operations");
        assert!(ops.contains(&TYPE_XOR_RI), "CSRRC should emit XOR_RI to invert");
        assert!(ops.contains(&TYPE_AND_RR), "CSRRC should emit AND_RR");

        println!("CSRRC test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_csrrwi_immediate() {
        // Test CSRRWI x5, mepc, 7
        let csr_val = 0x341u32 << 20; // real CSR number for mepc
        let csrrwi_x5_mepc_7 = csr_val | (7 << 15) | (5 << 7) | (0b101 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        let cells = t.transpile(csrrwi_x5_mepc_7);

        // Should emit: COPY x5, mepc; COPY mepc, x5 (swap-like behavior)
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRWI should emit COPY operations");

        println!("CSRRWI test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_csrrsi_immediate_set() {
        // Test CSRRSI x5, mepc, 7
        let csr_val = 0x341u32 << 20; // real CSR number for mepc
        let csrrsi_x5_mepc_7 = csr_val | (7 << 15) | (5 << 7) | (0b110 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        let cells = t.transpile(csrrsi_x5_mepc_7);

        // Should emit: COPY x5, mepc; OR_RI mepc, 7
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRSI should emit COPY");
        assert!(ops.contains(&TYPE_OR_RI), "CSRRSI should emit OR_RI");

        println!("CSRRSI test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_csrrci_immediate_clear() {
        // Test CSRRCI x5, mepc, 7
        let csr_val = 0x341u32 << 20; // real CSR number for mepc
        let csrrci_x5_mepc_7 = csr_val | (7 << 15) | (5 << 7) | (0b111 << 12) | 0b1110011;

        let mut t = RiscvTranspiler::new(0, 8, 0, 0);
        let cells = t.transpile(csrrci_x5_mepc_7);

        // Should emit: COPY x5, mepc; AND_RI mepc, 0xFFFFFFF8 (~7)
        let ops: Vec<_> = cells.iter().map(|c| opcode_of(&c.cell)).collect();
        assert!(ops.contains(&TYPE_COPY), "CSRRCI should emit COPY");
        assert!(ops.contains(&TYPE_AND_RI), "CSRRCI should emit AND_RI with inverted mask");

        println!("CSRRCI test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_auipc_adds_pc() {
        // AUIPC rd, imm: rd = pc + imm[31:12]
        // Test at PC 0x1000 with imm=2 -> rd = 0x1000 + (2 << 12) = 0x3000
        // Encoding: (imm << 12) | (rd << 7) | opcode[6:0]
        let auipc_x10_2 = ((2u32) << 12) | (10 << 7) | 0b0010111;
        
        // Use transpile_program to get proper PC tracking
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0x1000);
        let cells = t.transpile_program(&[auipc_x10_2]);
        
        // Should emit LDI with the computed value (opcode + immediate + stitch JMP)
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_LDI), "AUIPC should emit LDI, got: {:?}", ops);
        assert!(ops.contains(&TYPE_NOP), "AUIPC should emit NOP cell with immediate");
        
        // Find the first NOP cell (holds the AUIPC immediate)
        let imm_cell = cells.iter()
            .filter(|c| (c.cell.opcode_or_type & 0xFF) == TYPE_NOP)
            .next()
            .expect("AUIPC should have NOP cell with immediate");
        assert_eq!(imm_cell.cell.data_buffer, 0x3000, "AUIPC x10, 2 at PC 0x1000 should load PC(0x1000) + (2 << 12) = 0x3000");
        
        println!("AUIPC test passed: x10 = PC(0x1000) + (2 << 12) = 0x3000");
    }
    
    #[test]
    fn test_auipc_wraps_overflow() {
        // Test PC wrapping: AUIPC at PC 0xFFFF0000 with imm[31:12]=0x11
        // Encoding: (0x11 << 12) | (5 << 7) | 0b0010111
        // PC=0xFFFF0000 + 0x11000 = 0x00001000 (32-bit wrapping)
        let auipc_x5_1 = ((0x11u32) << 12) | (5 << 7) | 0b0010111;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0xFFFF0000);
        let cells = t.transpile_program(&[auipc_x5_1]);
        
        let imm_cell = cells.iter()
            .filter(|c| (c.cell.opcode_or_type & 0xFF) == TYPE_NOP)
            .next()
            .expect("AUIPC should have NOP cell with immediate");
        // PC=0xFFFF0000 + 0x11000 = 0x00001000 (32-bit wrapping)
        assert_eq!(imm_cell.cell.data_buffer, 0x1000, "AUIPC should wrap on overflow");
        
        println!("AUIPC overflow test passed: 0xFFFF0000 + 0x11000 = 0x00001000 (wrapped)");
    }
    
    #[test]
    fn test_auipc_without_base_pc_halts() {
        // AUIPC without base_pc should halt loudly
        let auipc_x10_2 = ((2u32) << 12) | (10 << 7) | 0b0010111;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0);  // No base_pc set
        let cells = t.transpile(auipc_x10_2);
        
        // Should emit a HALT
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_HALT), "AUIPC without base_pc should HALT");
        
        println!("AUIPC base_pc test passed: halts loudly when no base_pc");
    }

    #[test]
    fn test_lb_signed_byte_load() {
        // LB x10, 0(x1): load signed byte from address in x1
        // Pattern: lb rd, offset(rs1) = funct3=000, opcode=0000011
        let lb_x10_0_x1 = (1 << 15) | (10 << 7) | (0b000 << 12) | 0b0000011;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0x1000);
        let cells = t.transpile(lb_x10_0_x1);
        
        // Should emit: pointer chain, LOAD_IND, shift-extract, sign-extension
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_LOAD_IND), "LB should emit LOAD_IND");
        assert!(ops.contains(&TYPE_SHR_RR), "LB should emit SHR_RR to extract byte");
        assert!(ops.contains(&TYPE_SHL_RI), "LB should emit SHL_RI for sign extension");
        assert!(ops.contains(&TYPE_SRA_RI), "LB should emit SRA_RI for sign extension");
        
        println!("LB test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_lbu_unsigned_byte_load() {
        // LBU x10, 0(x1): load unsigned byte
        let lbu_x10_0_x1 = (1 << 15) | (10 << 7) | (0b100 << 12) | 0b0000011;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0x1000);
        let cells = t.transpile(lbu_x10_0_x1);
        
        // Should emit sign extension with mask instead of shift
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_AND_RI), "LBU should emit AND_RI to mask upper bits");
        
        println!("LBU test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_lh_signed_halfword_load() {
        // LH x10, 0(x1): load signed halfword
        let lh_x10_0_x1 = (1 << 15) | (10 << 7) | (0b001 << 12) | 0b0000011;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0x1000);
        let cells = t.transpile(lh_x10_0_x1);
        
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_SHR_RR), "LH should emit SHR_RR to extract halfword");
        
        println!("LH test passed: {} cells emitted", cells.len());
    }

    #[test]
    fn test_lhu_unsigned_halfword_load() {
        // LHU x10, 0(x1): load unsigned halfword
        let lhu_x10_0_x1 = (1 << 15) | (10 << 7) | (0b101 << 12) | 0b0000011;
        
        let mut t = RiscvTranspiler::new(0, 8, 0, 0).with_base_pc(0x1000);
        let cells = t.transpile(lhu_x10_0_x1);
        
        let ops: Vec<_> = cells.iter().map(|c| c.cell.opcode_or_type & 0xFF).collect();
        assert!(ops.contains(&TYPE_AND_RI), "LHU should emit AND_RI to mask upper bits");
        
        println!("LHU test passed: {} cells emitted", cells.len());
    }
}