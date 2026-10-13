#version 450
#extension GL_EXT_shader_explicit_arithmetic_types_int64 : require

// Simplified RV64 shader for wgpu execution
// Uses standard storage buffer layout compatible with DrmGlyphExecutor

layout(local_size_x = 8, local_size_y = 8) in;

// Binding 0: Storage buffer (read/write) - glyph memory with kernel and state
layout(std430, binding = 0) buffer MemoryBuffer {
    uint memory[];
};

// Binding 1: Storage texture (write-only) - output
layout(rgba8ui, binding = 1) uniform uimage2D outputImage;

// Binding 2: Uniform buffer
layout(std140, binding = 2) uniform Uniforms {
    uint width;
    uint height;
    float time;
    uint _padding;
}

// Memory layout:
// [0..3]: execution state (pc_lo, pc_hi, cycles_lo, cycles_hi)
// [4]: running flag
// [8..71]: registers x0-x31 (64 bytes as 16 uints)
// [72+]: kernel/memory

const uint STATE_PC_LO = 0u;
const uint STATE_PC_HI = 1u;
const uint STATE_CYCLES_LO = 2u;
const uint STATE_CYCLES_HI = 3u;
const uint STATE_RUNNING = 4u;
const uint STATE_REGISTERS = 8u; // Start of 32 registers (as 64 uints for 64-bit)

const uint KERNEL_OFFSET = 72u; // Kernel starts at 288 bytes

// Helper to read 64-bit value from memory (as two uints)
uint64_t read_u64(uint offset) {
    if (offset + 1u >= memory.length()) return 0u;
    uint lo = memory[offset];
    uint hi = memory[offset + 1u];
    return (uint64_t(hi) << 32u) | uint64_t(lo);
}

// Helper to write 64-bit value to memory
void write_u64(uint offset, uint64_t value) {
    if (offset + 1u >= memory.length()) return;
    memory[offset] = uint(value & 0xFFFFFFFFu);
    memory[offset + 1u] = uint(value >> 32u);
}

// Simple instruction fetch
uint fetch_instruction(uint64_t pc) {
    uint byte_offset = uint(pc) / 4u);
    if (KERNEL_OFFSET + byte_offset >= memory.length()) return 0u;
    return memory[KERNEL_OFFSET + byte_offset];
}

// Decode and execute one instruction
void execute_instruction(uint64_t pc, inout uint64_t x[32], inout bool running) {
    uint inst = fetch_instruction(pc);
    if (inst == 0u) return; // Invalid instruction

    uint opcode = inst & 0x7Fu;

    // Common decodes
    uint rd = (inst >> 7u) & 0x1Fu;
    uint funct3 = (inst >> 12u) & 0x7u;
    uint rs1 = (inst >> 15u) & 0x1Fu;
    uint rs2 = (inst >> 20u) & 0x1Fu;
    uint funct7 = (inst >> 25u) & 0x7Fu;

    // Immediate decodes
    int imm_i = int(inst) >> 20;  // Sign extended
    uint imm_u = inst & 0xFFFFF000u;
    int imm_s = int(((inst >> 25u) << 5u) | ((inst >> 7u) & 0x1Fu));
    imm_s = (imm_s << 20) >> 20;  // Sign extend

    // Execute based on opcode
    switch (opcode) {
        case 0x37u:  // LUI
            if (rd != 0u) x[rd] = uint64_t(imm_u);
            break;

        case 0x17u:  // AUIPC
            if (rd != 0u) x[rd] = pc + int64_t(int(imm_i));
            break;

        case 0x6Fu:  // JAL
            {
                int imm_j = int(((inst >> 31u) << 12u)
                             | (((inst >> 12u) & 0xFFu) << 12u)
                             | (((inst >> 20u) & 0x1Fu) << 11u)
                             | (((inst >> 21u) & 0x3FFu) << 1u));
                imm_j = (imm_j << 11) >> 11;  // Sign extend
                if (rd != 0u) x[rd] = pc + uint64_t(imm_j);
                x[0] = pc + 4u;
            }
            break;

        case 0x67u:  // JALR
            {
                uint64_t target = (x[rs1] + int64_t(imm_i)) & ~uint64_t(1u);
                if (rd != 0u) x[rd] = pc + 4u;
                x[0] = target;  // Temp store in x0 for                // Note: Not fully implementing memory ops yet
            }
            break;

        case 0x03u:  // LOAD
            {
                uint64_t addr = x[rs1] + int64_t(imm_i);
                uint byte_offset = uint(addr / 4u);
                if (KERNEL_OFFSET + byte_offset >= memory.length()) return;

                uint word = memory[KERNEL_OFFSET + byte_offset];
                uint byte_pos = uint(addr % 4u);

                uint64_t result = 0u;
                switch (funct3) {
                    case 0x0u:  // LB
                        result = uint64_t(int8_t((word >> (byte_pos * 8u)) & 0xFFu);
                        break;
                    case 0x1u:  // LH
                        result = uint64_t(int16_t((word >> (byte_pos * 8u)) & 0xFFFFu));
                        break;
                    case 0x2u:  // LW
                        result = uint64_t(int32_t(word));
                        break;
                    case 0x3u:  // LD
                        result = read_u64(KERNEL_OFFSET + byte_offset);
                        break;
                }

                if (rd != 0u) x[rd] = result;
            }
            break;

        case 0x23u:  // STORE
            {
                uint64_t addr = x[rs1] + int64_t(imm_s);
                uint byte_offset = uint(addr / 4u);
                if (KERNEL_OFFSET + byte_offset >= memory.length()) return;

                uint byte_pos = uint(addr % 4u);
                uint word = memory[KERNEL_OFFSET + byte_offset];
                uint old_val = word;

                switch (funct3) {
                    case 0x0u:  // SB
                        word = (word & ~(0xFFu << (byte_pos * 8u))) | ((uint(x[rs2]) & 0xFFu) << (byte_pos * 8u);
                        break;
                    case 0x1u:  // SH
                        word = (word & ~(0xFFFFu << (byte_pos * 8u))) | ((uint(x[rs2]) & 0xFFFFu) << (byte_pos * 8u));
                        break;
                    case 0x2u:  // SW
                        word = uint(x[rs2]);
                        break;
                }
            }
            break;

        case 0x13u:  // OP-IMM
            {
                uint64_t result = 0u;
                uint shamt = (inst >> 20u) & 0x3Fu;

                switch (funct3) {
                    case 0x0u: result = x[rs1] + int64_t(imm_i); break;  // ADDI
                    case 0x2u: result = (int64_t(x[rs1]) < int64_t(imm_i)) ? 1u : 0u; break;  // SLTI
                    case 0x3u: result = (x[rs1] < uint64_t(imm_i)) ? 1u : 0u; break;  // SLTIU
                    case 0x4u: result = x[rs1] ^ uint(int(imm_i)); break;  // XORI
                    case 0x6u: result = x[rs1] | uint(int(imm_i)); break;  // ORI
                    case 0x7u: result = x[rs1] & uint(int(imm_i)); break;  // ANDI
                    case 0x1u: result = x[rs1] << shamt; break;  // SLLI
                    case 0x5u:
                        if ((inst & 0x40000000u) != 0u) {
                            result = int64_t(x[rs1]) >> shamt;  // SRAI
                        } else {
                            result = x[rs1] >> shamt;  // SRLI
                        }
                        break;
                }

                if (rd != 0u) x[rd] = result;
            }
            break;

        case 0x33u:  // OP
            {
                uint64_t result = 0u;
                switch (funct3) {
                    case 0x0u:
                        if (funct7 == 0x20u) {
                            result = int64_t(x[rs1]) - int64_t(x[rs2]);  // SUB
                        } else {
                            result = x[rs1] + x[rs2];  // ADD
                        }
                        break;
                    case 0x1u: result = x[rs1] << (uint(x[rs2]) & 0x3Fu); break;  // SLL
                    case 0x2u: result = (int64_t(x[rs1]) < int64_t(x[rs2])) ? 1u : 0u; break;  // SLT
                    case 0x3u: result = (x[rs1] < x[rs2]) ? 1u : 0u; break;  // SLTU
                    case 0x4u: result = x[rs1] ^ x[rs2]; break;  // XOR
                    case 0x5u:
                        if (funct7 == 0x20u) {
                            result = int64_t(x[rs1]) >> (uint(x[rs2]) & 0x3Fu);  // SRA
                        } else {
                            result = x[rs1] >> (uint(x[rs2]) & 0x3Fu);  // SRL
                        }
                        break;
                    case 0x6u: result = x[rs1] | x[rs2]; break;  // OR
                    case 0x7u: result = x[rs1] & x[rs2]; break;  // AND
                }

                if (rd != 0u) x[rd] = result;
            }
            break;

        case 0x63u:  // BRANCH
            {
                int imm_b = int(((inst >> 31u) << 12u)
                             | (((inst >> 7u) & 0x1Fu) << 11u)
                             | (((inst >> 25u) & 0x3Fu) << 5u)
                             | (((inst >> 8u) & 0xFu) << 1));
                imm_b = (imm_b << 19) >> 19;  // Sign extend

                bool take_branch = false;
                int64_t a = int64_t(x[rs1]);
                int64_t b = int64_t(x[rs2]);

                switch (funct3) {
                    case 0x0u: take_branch = (a == b); break;  // BEQ
                    case 0x1u: take_branch = (a != b); break;  // BNE
                    case 0x4u: take_branch = (a < b); break;  // BLT
                    case 0x5u: take_branch = (a >= b); break;  // BGE
                    case 0x6u: take_branch = (a < b); break;  // BLTU
                    case 0x7u: take_branch = (a >= b); break;  // BGEU
                }

                if (take_branch) {
                    x[0] = uint64_t(int64_t(pc) + imm_b);
                }
            }
            break;

        case 0x73u:  // SYSTEM (ECALL, EBREAK, CSR)
            if ((inst & 0xFFFFFFFFu) == 0x00000073u) {
                // ECALL - halt execution
                running = false;
            }
            break;

        default:
            // Unknown opcode - skip
            break;
    }
}

void main() {
    // Only thread 0 does the work
    if (gl_GlobalInvocationID.x != 0 || gl_GlobalInvocationID.y != 0 || gl_GlobalInvocationID.z != 1) {
        return;
    }

    // Initialize state on first run
    if (memory[STATE_RUNNING] == 0u) {
        // Set entry point
        write_u64(STATE_PC_LO, uint64_t(0u));  // Set entry point to 0x0
        memory[STATE_RUNNING] = 1u;
        memory[STATE_CYCLES_LO] = 0u;
        memory[STATE_CYCLES_HI] = 0u;

        // Initialize registers
        for (int i = 0; i < 32; i++) {
            write_u64(STATE_REGISTERS + uint(i) * 2u, uint64_t(0u));
        }
    }

    // Load current state
    uint64_t pc = read_u64(STATE_PC_LO);
    uint64_t cycles = read_u64(STATE_CYCLES_LO);
    bool running = memory[STATE_RUNNING] != 0u;

    // Execute instructions
    uint64_t x[32];
    for (int i = 0; i < 32; i++) {
        x[i] = read_u64(STATE_REGISTERS + uint(i) * 2u);
    }

    // Run up to max cycles (limit to 100 per frame for now)
    uint max_frame_cycles = 100u;
    uint cycles_executed = 0u;

    while (running && cycles_executed < max_frame_cycles) {
        execute_instruction(pc, x, running);
        pc += 4u;
        cycles++;
        cycles_executed++;
    }

    // Store updated state
    write_u64(STATE_PC_LO, pc);
    write_u64(STATE_CYCLES_LO, cycles);
    memory[STATE_RUNNING] = running ? 1u : 0u;

    for (int i = 0; i < 32; i++) {
        write_u64(STATE_REGISTERS + uint(i) * 2u, x[i]);
    }

    // Output visualization
    uint gid_x = gl_GlobalInvocationID.x;
    uint gid_y = gl_GlobalInvocationID.y;

    if (gid_x < width && gid_y < height) {
        // Color based on PC and cycles
        uint pc_color = uint(pc >> 8u) & 0xFFu;
        uint cycle_color = uint(cycles) & 0xFFu;

        // Write output pixel
        imageStore(outputImage, ivec2(gid_x, gid_y), uvec4(pc_color, cycle_color, 128u, 255u));
    }
}
