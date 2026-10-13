// RISC-V GPU Emulator for Spatial Glyph Assembly
// Matches wgpu_backend.rs binding layout

// RISC-V Opcodes (bits[6:0])
const OP_LUI: u32 = 0x37u;
const OP_AUIPC: u32 = 0x17u;
const OP_JAL: u32 = 0x6Fu;
const OP_JALR: u32 = 0x67u;
const OP_BRANCH: u32 = 0x63u;
const OP_LOAD: u32 = 0x03u;
const OP_STORE: u32 = 0x23u;
const OP_OP_IMM: u32 = 0x13u;
const OP_OP: u32 = 0x33u;
const OP_SYSTEM: u32 = 0x73u;
const OP_AMO: u32 = 0x2Fu;

// System call numbers
const SYS_WRITE: u32 = 64u;
const SYS_READ: u32 = 63u;
const SYS_EXIT: u32 = 93u;
const SYS_GETPID: u32 = 172u;
const SYS_BRK: u32 = 214u;

@group(0) @binding(0) var<storage, read_write> ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> registers: array<u32, 32>;
@group(0) @binding(2) var<storage, read_write> memory: array<u32, 32768>;
@group(0) @binding(3) var<storage, read_write> stack: array<u32, 256>;
@group(0) @binding(3) var<storage, read_write> syscall_queue_buffer: array<SyscallEntry>;
@group(0) @binding(4) var<storage, read_write> display_buffer: array<u32>;
@group(0) @binding(5) var<storage, read_write> console_buffer: array<u32>;
@group(0) @binding(6) var<storage, read_write> pending_counts_buffer: array<u32>;
@group(0) @binding(7) var<storage, read_write> vm_status_buffer: array<u32>;
@group(0) @binding(8) var<storage, read_write> profiler_buffer: array<ProfilerEntry>;
@group(0) @binding(9) var<storage, read_write> vib: array<u32>;
@group(0) @binding(10) var<storage, read_write> csr: array<u32, 4096>;

// Status constants
const STATUS_WAITING_SYSCALL: u32 = 1u;
const STATUS_SYSCALL_COMPLETE: u32 = 2u;

// Syscall queue entry (40 bytes, matching Rust)
struct SyscallEntry {
    vm_id: u32,
    num: u32,
    arg0: u32,
    arg1: u32,
    arg2: u32,
    arg3: u32,
    arg4: u32,
    arg5: u32,
    result: i32,
    _pad: u32,
}

// Profiler entry (16 bytes)
struct ProfilerEntry {
    pc: u32,
    opcode: u32,
    count: u32,
    _pad: u32,
}

// x0 = PC, x1 = halted, x2 = instr_count, x3 = hart_id

// Hilbert curve d2xy conversion
fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

// Sign-extend 12-bit immediate
fn sign_ext12(x: u32) -> i32 {
    if ((x & 0x800u) != 0u) {
        return i32(x | 0xFFFFF000u);
    }
    return i32(x);
}

// Check if instruction is compressed (bits[1:0] == 01 or 10)
fn is_compressed(instr: u32) -> bool {
    return (instr & 0x3u) == 0x1u || (instr & 0x3u) == 0x2u;
}

// Compressed instruction immediate decoder (C.ADDI, C.LI, C.LUI, C.ANDI)
fn decode_ci_imm(c_instr: u32) -> i32 {
    let imm5 = (c_instr >> 12u) & 0x1u;
    let imm4_0 = (c_instr >> 2u) & 0x1Fu;
    let imm = (imm5 << 5u) | imm4_0;
    if ((imm & 0x20u) != 0u) {
        return i32(imm | 0xFFFFFFC0u);
    }
    return i32(imm);
}

// Compressed load/store immediate decoder (C.LW, C.SW)
fn decode_cl_cs_imm(c_instr: u32) -> u32 {
    let imm5 = (c_instr >> 12u) & 0x1u;
    let imm4_3_2_6 = ((c_instr >> 10u) & 0x6u) | ((c_instr >> 5u) & 0x1u);
    let imm7_6 = (c_instr >> 5u) & 0x3u;
    return (imm5 << 7u) | (imm4_3_2_6 << 3u) | imm7_6;
}

// Compressed branch immediate decoder (C.BEQZ, C.BNEZ)
fn decode_cb_imm(c_instr: u32) -> i32 {
    let imm8 = (c_instr >> 12u) & 0x1u;
    let imm4_3 = (c_instr >> 10u) & 0x3u;
    let imm7_6 = (c_instr >> 5u) & 0x3u;
    let imm2_1 = (c_instr >> 3u) & 0x3u;
    let imm5 = (c_instr >> 2u) & 0x1u;
    let imm = (imm8 << 8u) | (imm4_3 << 6u) | (imm7_6 << 4u) | (imm2_1 << 1u) | imm5;
    if ((imm & 0x100u) != 0u) {
        return i32(imm | 0xFFFFFE00u);
    }
    return i32(imm);
}

// Compressed jump immediate decoder (C.J, C.JAL)
fn decode_cj_imm(c_instr: u32) -> i32 {
    let imm11 = ((c_instr >> 12u) & 0x1u) << 11u;
    let imm4 = ((c_instr >> 11u) & 0x1u) << 4u;
    let imm9_8 = ((c_instr >> 9u) & 0x3u) << 8u;
    let imm10 = ((c_instr >> 8u) & 0x1u) << 10u;
    let imm6 = ((c_instr >> 7u) & 0x1u) << 6u;
    let imm7 = ((c_instr >> 6u) & 0x1u) << 7u;
    let imm3_1 = ((c_instr >> 3u) & 0x7u) << 1u;
    let imm5 = ((c_instr >> 2u) & 0x1u) << 5u;
    let imm = imm11 | imm10 | imm9_8 | imm7 | imm6 | imm5 | imm4 | imm3_1;
    if ((imm & 0x800u) != 0u) {
        return i32(imm | 0xFFFFF000u);
    }
    return i32(imm);
}

// Fetch instruction from RAM texture
fn fetch_instr(pc: u32) -> u32 {
    let coords = d2xy(4096u, pc >> 2u);
    let pixel = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));
    return (pixel.a << 24u) | (pixel.b << 16u) | (pixel.g << 8u) | pixel.r;
}

// Load word from memory
fn mem_load_word(addr: u32) -> u32 {
    return memory[(addr & 0x7FFFu) >> 2u];
}

// Store word to memory
fn mem_store_word(addr: u32, value: u32) {
    memory[(addr & 0x7FFFu) >> 2u] = value;
}

// Execute ECALL system call
fn do_ecall() -> u32 {
    let syscall_num = registers[17];
    let vm_id = 0u;
    let arg0 = registers[10];
    let arg1 = registers[11];

    // Write debug trace to console buffer (if exists)
    // Note: This is just for debugging; production code should use proper logging

    if (syscall_num == SYS_EXIT) {
        let exit_code = registers[10];
        // Write to syscall queue
        let index = pending_counts_buffer[vm_id];
        syscall_queue_buffer[index] = SyscallEntry(
            vm_id,
            syscall_num,
            registers[10],  // arg0: exit_code
            0u, 0u, 0u, 0u, 0u,
            0i32, 0u
        );
        pending_counts_buffer[vm_id] = index + 1u;
        vm_status_buffer[vm_id] = STATUS_WAITING_SYSCALL;
        registers[1] = 1u;
        return exit_code;
    }

    if (syscall_num == SYS_WRITE) {
        let fd = registers[10];
        let buf = registers[11];
        let count = registers[12];
        // Write to syscall queue
        let index = pending_counts_buffer[vm_id];
        syscall_queue_buffer[index] = SyscallEntry(
            vm_id,
            syscall_num,
            fd,
            buf,
            count,
            0u, 0u, 0u,
            0i32, 0u
        );
        pending_counts_buffer[vm_id] = index + 1u;
        vm_status_buffer[vm_id] = STATUS_WAITING_SYSCALL;
        return count;
    }

    if (syscall_num == SYS_GETPID) {
        // Write to syscall queue
        let index = pending_counts_buffer[vm_id];
        syscall_queue_buffer[index] = SyscallEntry(
            vm_id,
            syscall_num,
            0u, 0u, 0u, 0u, 0u, 0u,
            0i32, 0u
        );
        pending_counts_buffer[vm_id] = index + 1u;
        vm_status_buffer[vm_id] = STATUS_WAITING_SYSCALL;
        return 1u;
    }

    // Custom hypercalls (e.g., 0x123 for spatial alloc)
    let index = pending_counts_buffer[vm_id];
    syscall_queue_buffer[index] = SyscallEntry(
        vm_id,
        syscall_num,
        arg0,
        arg1,
        registers[12],  // arg2 (a2)
        registers[13],  // arg3 (a3)
        registers[14],  // arg4 (a4)
        registers[15],  // arg5 (a5)
        0i32, 0u
    );
    pending_counts_buffer[vm_id] = index + 1u;
    vm_status_buffer[vm_id] = STATUS_WAITING_SYSCALL;

    return 0u;
}

// Execute compressed instruction, returns true if compressed
fn execute_compressed(pc: u32, word: u32) -> bool {
    // Extract 16-bit instruction based on PC alignment
    let c_instr = if ((pc & 0x2u) == 0u) {
        word & 0xFFFFu;
    } else {
        (word >> 16u) & 0xFFFFu;
    };

    let bits_1_0 = c_instr & 0x3u;
    let bits_15_13 = (c_instr >> 13u) & 0x7u;
    let rd_rs1 = (c_instr >> 7u) & 0x1Fu;
    let rd = rd_rs1;
    let rs1 = rd_rs1;
    let rs2_3bit = (c_instr >> 2u) & 0x7u;

    var next_pc = pc + 2u;
    var write_rd = true;
    var rd_value: u32 = 0u;

    if (bits_1_0 == 0x1u) {
        // Quadrant 0 or 1
        if (bits_15_13 == 0x0u) {
            // C.ADDI
            let imm = decode_ci_imm(c_instr);
            rd_value = registers[rd] + u32(imm);
        }
        else if (bits_15_13 == 0x2u) {
            // C.LI
            let imm = decode_ci_imm(c_instr);
            rd_value = u32(imm);
        }
        else if (bits_15_13 == 0x6u) {
            // C.BEQZ
            write_rd = false;
            let imm = decode_cb_imm(c_instr);
            if (registers[rd] == 0u) {
                next_pc = pc + u32(imm) + 2u;
            }
        }
        else if (bits_15_13 == 0x7u) {
            // C.BNEZ
            write_rd = false;
            let imm = decode_cb_imm(c_instr);
            if (registers[rd] != 0u) {
                next_pc = pc + u32(imm) + 2u;
            }
        }
        else {
            write_rd = false;
            next_pc = pc + 2u;
        }
    }
    else if (bits_1_0 == 0x2u) {
        // Quadrant 2 or 3
        if (bits_15_13 == 0x0u) {
            // C.SLLI: rd = rd << shamt
            let shamt = (((c_instr >> 12u) & 0x1u) << 5u) | ((c_instr >> 2u) & 0x1Fu);
            rd_value = registers[rd] << shamt;
        }
        else if (bits_15_13 == 0x2u) {
            // C.LWSP (load word from stack pointer)
            let uimm = decode_cl_cs_imm(c_instr);
            let addr = registers[2u] + uimm;
            rd_value = mem_load_word(addr);
        }
        else if (bits_15_13 == 0x4u) {
            // C.JR (rs2=0, bit12=0) / C.MV (rs2!=0, bit12=0)
            // C.ADD (rs2!=0, rd!=0, bit12=1) / C.JALR (rs2=0, rd!=0, bit12=1)
            // C.EBREAK (rd=0, bit12=1)
            let rs2 = (c_instr >> 2u) & 0x1Fu;
            let bit12 = (c_instr >> 12u) & 0x1u;
            if (bit12 == 0u) {
                if (rs2 == 0u) {
                    // C.JR: jalr x0, rd, 0
                    write_rd = false;
                    next_pc = registers[rd];
                } else {
                    // C.MV: rd = rs2
                    rd_value = registers[rs2];
                }
            } else {
                if (rd == 0u) {
                    // C.EBREAK
                    write_rd = false;
                    next_pc = pc + 2u;
                } else if (rs2 == 0u) {
                    // C.JALR: jalr x1, rd, 0
                    rd_value = pc + 2u;
                    next_pc = registers[rd];
                    next_pc = next_pc & 0xFFFFFFFEu;
                } else {
                    // C.ADD: rd = rd + rs2
                    rd_value = registers[rd] + registers[rs2];
                }
            }
        }
        else if (bits_15_13 == 0x6u) {
            // C.SWSP (store word to stack pointer)
            write_rd = false;
            // C.SWSP uses different immediate encoding
            let imm8 = (c_instr >> 8u) & 0x1u;
            let imm7 = (c_instr >> 7u) & 0x1u;
            let imm6 = (c_instr >> 6u) & 0x1u;
            let imm5 = (c_instr >> 5u) & 0x1u;
            let imm4 = (c_instr >> 4u) & 0x1u;
            let imm3 = (c_instr >> 3u) & 0x1u;
            let imm2 = (c_instr >> 2u) & 0x1u;
            let uimm = (imm8 << 7u) | (imm7 << 6u) | (imm6 << 5u) | (imm5 << 4u) | (imm4 << 3u) | (imm3 << 2u) | (imm2 << 1u);
            let addr = registers[2u] + uimm;
            mem_store_word(addr, registers[rs2_3bit]);
        }
        else {
            write_rd = false;
            next_pc = pc + 2u;
        }
    }
    else if (bits_1_0 == 0x1u && bits_15_13 == 0x5u) {
        // C.J: unconditional jump
        write_rd = false;
        let imm = decode_cj_imm(c_instr);
        next_pc = pc + u32(imm) + 2u;
    }
    else {
        return false; // Not a compressed instruction
    }

    if (write_rd && rd != 0u) {
        registers[rd] = rd_value;
    }

    registers[0] = next_pc;
    registers[2] = registers[2] + 1u;
    return true;
}

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (global_id.x > 0u || registers[1] != 0u) {
        return;
    }

    let pc = registers[0];
    let instr = fetch_instr(pc);

    // Debug: Write PC+instr to RAM at 0x2000 (single instruction trace)
    if (pc == 0x1000u) {
        mem_store_word(0x2000u, pc);
        mem_store_word(0x2004u, instr);
    }

    // Check for compressed instructions first
    if (is_compressed(instr)) {
        if (execute_compressed(pc, instr)) {
            return;
        }
        // Fall through to standard decode if compressed failed
    }

    let opcode = instr & 0x7Fu;
    let rd = (instr >> 7u) & 0x1Fu;
    let funct3 = (instr >> 12u) & 0x7u;
    let rs1 = (instr >> 15u) & 0x1Fu;
    let rs2 = (instr >> 20u) & 0x1Fu;
    let funct7 = (instr >> 25u) & 0x7Fu;

    var next_pc = pc + 4u;
    var write_rd = true;
    var rd_value: u32 = 0u;
    
    switch (opcode) {
        case OP_LUI: {
            rd_value = instr & 0xFFFFF000u;
        }
        case OP_AUIPC: {
            rd_value = pc + (instr & 0xFFFFF000u);
        }
        case OP_JAL: {
            rd_value = pc + 4u;
            // Simple JAL: assume imm[20|10:1|11|19:12] format
            let imm_20 = ((instr >> 31u) & 0x1u) << 20u;
            let imm_10_1 = ((instr >> 21u) & 0x3FFu) << 1u;
            let imm_11 = ((instr >> 20u) & 0x1u) << 11u;
            let imm_19_12 = ((instr >> 12u) & 0xFFu) << 12u;
            let imm = imm_20 | imm_10_1 | imm_11 | imm_19_12;
            let imm_sign = if ((imm_20 != 0u)) { 0xFFFFF000u } else { 0u };
            next_pc = pc + imm + imm_sign;
        }
        case OP_JALR: {
            rd_value = pc + 4u;
            let imm_i = sign_ext12((instr >> 20u) & 0xFFFu);
            next_pc = registers[rs1] + u32(imm_i);
            next_pc = next_pc & 0xFFFFFFFEu;
        }
        case OP_BRANCH: {
            write_rd = false;
            // Branch immediate: imm[12|10:5|4:1|11]
            let imm_12 = ((instr >> 31u) & 0x1u) << 12u;
            let imm_10_5 = ((instr >> 25u) & 0x3Fu) << 5u;
            let imm_4_1 = ((instr >> 8u) & 0xFu) << 1u;
            let imm_11 = ((instr >> 7u) & 0x1u) << 11u;
            let imm = imm_12 | imm_10_5 | imm_4_1 | imm_11;
            let imm_sign = if ((imm_12 != 0u)) { 0xFFFFF000u } else { 0u };
            
            var take_branch = false;
            if (funct3 == 0u) { // BEQ
                take_branch = registers[rs1] == registers[rs2];
            } else if (funct3 == 1u) { // BNE
                take_branch = registers[rs1] != registers[rs2];
            } else if (funct3 == 4u) { // BLT
                take_branch = i32(registers[rs1]) < i32(registers[rs2]);
            } else if (funct3 == 5u) { // BGE
                take_branch = i32(registers[rs1]) >= i32(registers[rs2]);
            }
            
            if (take_branch) {
                next_pc = pc + imm + imm_sign;
            }
        }
        case OP_LOAD: {
            let imm_i = sign_ext12((instr >> 20u) & 0xFFFu);
            let addr = registers[rs1] + u32(imm_i);

            if (funct3 == 2u) { // LW
                rd_value = mem_load_word(addr);
            } else if (funct3 == 0u) { // LB
                let byte_val = u8((mem_load_word(addr) >> ((addr & 0x3u) * 8u)) & 0xFFu);
                rd_value = u32(sign_ext12(u32(byte_val)));
            } else if (funct3 == 4u) { // LBU
                rd_value = u32(u8((mem_load_word(addr) >> ((addr & 0x3u) * 8u)) & 0xFFu));
            } else if (funct3 == 1u) { // LH
                let word = mem_load_word(addr);
                let halfword: u16 = if ((addr & 0x2u) == 0u) {
                    u16(word & 0xFFFFu);
                } else {
                    u16(word >> 16u);
                };
                // Sign-extend halfword to 32 bits
                if ((halfword & 0x8000u) != 0u) {
                    rd_value = u32(u32(halfword) | 0xFFFF0000u);
                } else {
                    rd_value = u32(halfword);
                }
            } else if (funct3 == 5u) { // LHU
                let word = mem_load_word(addr);
                let halfword: u16 = if ((addr & 0x2u) == 0u) {
                    u16(word & 0xFFFFu);
                } else {
                    u16(word >> 16u);
                };
                rd_value = u32(halfword);
            }
        }
        case OP_STORE: {
            write_rd = false;
            let imm_s = i32(((instr >> 7u) & 0x1Fu) | ((instr >> 25u) << 5u));
            let addr = registers[rs1] + u32(imm_s);

            if (funct3 == 2u) { // SW
                mem_store_word(addr, registers[rs2]);
            } else if (funct3 == 0u) { // SB
                let old_word = mem_load_word(addr);
                let shift = (addr & 0x3u) * 8u;
                let new_word = (old_word & ~(0xFFu << shift)) | ((registers[rs2] & 0xFFu) << shift);
                mem_store_word(addr, new_word);
            } else if (funct3 == 1u) { // SH
                let old_word = mem_load_word(addr);
                let shift = (addr & 0x2u) * 8u;
                let new_word = (old_word & ~(0xFFFFu << shift)) | ((registers[rs2] & 0xFFFFu) << shift);
                mem_store_word(addr, new_word);
            }
        }
        case OP_OP_IMM: {
            let imm = sign_ext12((instr >> 20u) & 0xFFFu);
            
            if (funct3 == 0u) { // ADDI
                rd_value = registers[rs1] + u32(imm);
            } else if (funct3 == 4u) { // XORI
                rd_value = registers[rs1] ^ u32(imm);
            } else if (funct3 == 6u) { // ORI
                rd_value = registers[rs1] | u32(imm);
            } else if (funct3 == 7u) { // ANDI
                rd_value = registers[rs1] & u32(imm);
            } else if (funct3 == 1u) { // SLLI
                let shamt = u32(imm) & 0x1Fu;
                rd_value = registers[rs1] << shamt;
            } else if (funct3 == 5u) {
                if (funct7 == 0u) { // SRLI
                    let shamt = u32(imm) & 0x1Fu;
                    rd_value = registers[rs1] >> shamt;
                } else if (funct7 == 32u) { // SRAI
                    let shamt = u32(imm) & 0x1Fu;
                    rd_value = u32(i32(registers[rs1]) >> shamt);
                }
            }
        }
        case OP_OP: {
            if (funct3 == 0u) {
                if (funct7 == 0u) { // ADD
                    rd_value = registers[rs1] + registers[rs2];
                } else if (funct7 == 32u) { // SUB
                    rd_value = registers[rs1] - registers[rs2];
                }
            } else if (funct3 == 4u) { // XOR
                rd_value = registers[rs1] ^ registers[rs2];
            } else if (funct3 == 6u) { // OR
                rd_value = registers[rs1] | registers[rs2];
            } else if (funct3 == 7u) { // AND
                rd_value = registers[rs1] & registers[rs2];
            } else if (funct3 == 1u) { // SLL
                rd_value = registers[rs1] << (registers[rs2] & 0x1Fu);
            } else if (funct3 == 5u) {
                if (funct7 == 0u) { // SRL
                    rd_value = registers[rs1] >> (registers[rs2] & 0x1Fu);
                } else if (funct7 == 32u) { // SRA
                    rd_value = u32(i32(registers[rs1]) >> (registers[rs2] & 0x1Fu));
                }
            }
        }
        case OP_SYSTEM: {
            if (funct3 == 0u && (instr & 0xFFFFFFFFu) == 0x00000073u) {
                // ECALL
                write_rd = false;
                let result = do_ecall();
                registers[10] = result;
                registers[1] = 0u; // Clear ready_flag so execution can continue
            } else if (funct3 == 1u) {
                // CSRRW: CSR Read Write
                let csr_idx = (instr >> 20u) & 0xFFFu;
                let old_val = csr[csr_idx];
                csr[csr_idx] = registers[rs1];
                rd_value = old_val;
            } else if (funct3 == 2u) {
                // CSRRS: CSR Read Set
                let csr_idx = (instr >> 20u) & 0xFFFu;
                let old_val = csr[csr_idx];
                if (rs1 != 0u) {
                    csr[csr_idx] = old_val | registers[rs1];
                }
                rd_value = old_val;
            } else if (funct3 == 3u) {
                // CSRRC: CSR Read Clear
                let csr_idx = (instr >> 20u) & 0xFFFu;
                let old_val = csr[csr_idx];
                if (rs1 != 0u) {
                    csr[csr_idx] = old_val & ~registers[rs1];
                }
                rd_value = old_val;
            } else {
                write_rd = false;
            }
        }
        case OP_AMO: {
            // Atomic memory operations
            let addr = registers[rs1];
            let old_val = mem_load_word(addr);
            
            // Decode funct5 for AMO operation (bits[31:27])
            let amo_funct5 = funct7 >> 2u; // Remove AQ/RL bits
            
            if (funct3 == 2u) {
                if (amo_funct5 == 0b00010u) {
                    // LR.W: Load Reserved (simplified)
                    rd_value = old_val;
                } else if (amo_funct5 == 0b00011u) {
                    // SC.W: Store Conditional (simplified: always succeed)
                    mem_store_word(addr, registers[rs2]);
                    rd_value = 0u; // Success
                } else if (amo_funct5 == 0b00001u) {
                    // AMOSWAP.W
                    mem_store_word(addr, registers[rs2]);
                    rd_value = old_val;
                } else if (amo_funct5 == 0b00000u) {
                    // AMOADD.W
                    mem_store_word(addr, old_val + registers[rs2]);
                    rd_value = old_val;
                } else if (amo_funct5 == 0b01000u) {
                    // AMOOR.W
                    mem_store_word(addr, old_val | registers[rs2]);
                    rd_value = old_val;
                } else if (amo_funct5 == 0b01100u) {
                    // AMOAND.W
                    mem_store_word(addr, old_val & registers[rs2]);
                    rd_value = old_val;
                } else if (amo_funct5 == 0b00100u) {
                    // AMOXOR.W
                    mem_store_word(addr, old_val ^ registers[rs2]);
                    rd_value = old_val;
                } else {
                    write_rd = false;
                }
            } else {
                write_rd = false;
            }
        }
        default: {
            write_rd = false;
        }
    }
    
    if (write_rd && rd != 0u) {
        registers[rd] = rd_value;
    }
    
    registers[0] = next_pc;
    registers[2] = registers[2] + 1u;
}