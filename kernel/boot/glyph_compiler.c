/*
 * Geometry OS - Bare Metal Glyph Compiler
 *
 * Compiles glyph programs to Intel GPU MI commands.
 * Runs on bare metal without Linux.
 */

#include <stdint.h>
#include <stddef.h>
#include "glyph_compiler.h"

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

// ============================================================================
// Glyph Opcodes (matching Phase 1 Rust implementation)
// ============================================================================

typedef enum {
    GLYPH_NOP      = 0,
    GLYPH_ADD_M    = 200,
    GLYPH_SUB_M    = 201,
    GLYPH_MUL_M    = 202,
    GLYPH_DIV_M    = 203,
    GLYPH_LD       = 204,
    GLYPH_ST       = 205,
    GLYPH_MOV      = 206,
    GLYPH_CLR      = 207,
    GLYPH_JMP      = 208,
    GLYPH_JZ       = 209,
    GLYPH_CALL_M   = 210,
    GLYPH_RET_M    = 211,
    GLYPH_HALT_M   = 212,
    GLYPH_DRAW     = 215,
    GLYPH_ADD_MEM  = 216,
    GLYPH_SUB_MEM  = 217,
} GlyphOpcode;

// Single glyph instruction
typedef struct {
    u32 opcode;
    u32 dst;
    u32 src1;
    u32 src2;
} GlyphInst;

// Compiled glyph program
#define MAX_GLYPH_INSTS 256
typedef struct {
    GlyphInst insts[MAX_GLYPH_INSTS];
    u32 count;
} GlyphProgram;

// MiBatchBuffer type defined in glyph_compiler.h

// ============================================================================
// MI Command Opcodes (Intel GPU)
// ============================================================================

#define MI_CMD(type, op) ((u32)(((type) << 22) | (op)))

#define MI_TYPE_MI    0x00
#define MI_TYPE_2D    0x02
#define MI_TYPE_3D    0x03

// MI commands
#define MI_NOOP                    MI_CMD(MI_TYPE_MI, 0x00)
#define MI_BATCH_BUFFER_END        MI_CMD(MI_TYPE_MI, 0x0A)
#define MI_FLUSH                   MI_CMD(MI_TYPE_MI, 0x04)

// 2D commands (for DRAW operations)
#define XY_COLOR_BLT               MI_CMD(MI_TYPE_2D, 0x50)

// ============================================================================
// Glyph Parser (simple text format)
// ============================================================================

// Parse a single glyph instruction from text
// Format: "OPCODE DST SRC1 SRC2"
// Example: "ADD_M 0 1 2" means r0 = r1 + r2
int glyph_parse_line(const char *line, GlyphInst *out) {
    // Skip whitespace
    while (*line == ' ' || *line == '\t') line++;
    if (*line == '\0' || *line == '#') return -1;  // Empty or comment

    // Parse opcode
    u32 opcode = 0;
    if (line[0] == 'A' && line[1] == 'D' && line[2] == 'D') {
        opcode = GLYPH_ADD_M;
        line += 5;  // Skip "ADD_M"
    } else if (line[0] == 'S' && line[1] == 'U' && line[2] == 'B') {
        opcode = GLYPH_SUB_M;
        line += 5;
    } else if (line[0] == 'M' && line[1] == 'U' && line[2] == 'L') {
        opcode = GLYPH_MUL_M;
        line += 5;
    } else if (line[0] == 'M' && line[1] == 'O' && line[2] == 'V') {
        opcode = GLYPH_MOV;
        line += 4;
    } else if (line[0] == 'L' && line[1] == 'D') {
        opcode = GLYPH_LD;
        line += 3;
    } else if (line[0] == 'S' && line[1] == 'T') {
        opcode = GLYPH_ST;
        line += 3;
    } else if (line[0] == 'D' && line[1] == 'R' && line[2] == 'A') {
        opcode = GLYPH_DRAW;
        line += 5;
    } else if (line[0] == 'H' && line[1] == 'A' && line[2] == 'L') {
        opcode = GLYPH_HALT_M;
        out->opcode = opcode;
        out->dst = out->src1 = out->src2 = 0;
        return 0;
    } else {
        return -1;  // Unknown opcode
    }

    // Skip whitespace
    while (*line == ' ' || *line == '\t') line++;

    // Parse operands (simple integer parsing)
    u32 vals[3] = {0, 0, 0};
    for (int i = 0; i < 3 && *line; i++) {
        while (*line == ' ' || *line == '\t') line++;
        while (*line >= '0' && *line <= '9') {
            vals[i] = vals[i] * 10 + (*line - '0');
            line++;
        }
    }

    out->opcode = opcode;
    out->dst = vals[0];
    out->src1 = vals[1];
    out->src2 = vals[2];
    return 0;
}

// Parse a full program
int glyph_parse_program(const char *text, GlyphProgram *prog) {
    prog->count = 0;
    const char *line = text;

    while (*line && prog->count < MAX_GLYPH_INSTS) {
        // Find end of line
        const char *end = line;
        while (*end && *end != '\n') end++;

        // Parse line
        GlyphInst inst;
        if (glyph_parse_line(line, &inst) == 0) {
            prog->insts[prog->count++] = inst;
        }

        // Move to next line
        line = (*end == '\n') ? end + 1 : end;
    }

    return prog->count;
}

// ============================================================================
// MI Command Generator
// ============================================================================

// Initialize MI batch buffer
void mi_batch_init(MiBatchBuffer *batch) {
    batch->count = 0;
}

// Add MI command to batch
void mi_batch_add(MiBatchBuffer *batch, u32 cmd) {
    if (batch->count < (MI_BATCH_SIZE / 4)) {
        batch->commands[batch->count++] = cmd;
    }
}

// Add MI_NOOP (for alignment)
void mi_batch_noop(MiBatchBuffer *batch) {
    mi_batch_add(batch, MI_NOOP);
}

// Add MI_FLUSH (sync GPU)
void mi_batch_flush(MiBatchBuffer *batch) {
    mi_batch_add(batch, MI_FLUSH);
}

// Add MI_BATCH_BUFFER_END (terminate batch)
void mi_batch_end(MiBatchBuffer *batch) {
    mi_batch_add(batch, MI_BATCH_BUFFER_END);
}

// Add XY_COLOR_BLT (solid fill rectangle)
void mi_batch_color_blt(MiBatchBuffer *batch, u32 x, u32 y, u32 w, u32 h, u32 color) {
    mi_batch_add(batch, XY_COLOR_BLT);
    mi_batch_add(batch, (h << 16) | w);       // Size
    mi_batch_add(batch, 0);                    // Pitch (TODO: framebuffer pitch)
    mi_batch_add(batch, 0);                    // Destination offset (TODO: FB base)
    mi_batch_add(batch, color);                // Color
}

// ============================================================================
// Glyph to MI Compiler
// ============================================================================

// Compile single glyph instruction to MI commands
int glyph_compile_inst(GlyphInst *inst, MiBatchBuffer *batch, u32 *registers) {
    switch (inst->opcode) {
        case GLYPH_ADD_M:
            if (inst->dst < 16 && inst->src1 < 16 && inst->src2 < 16) {
                registers[inst->dst] = registers[inst->src1] + registers[inst->src2];
            }
            break;

        case GLYPH_SUB_M:
            if (inst->dst < 16 && inst->src1 < 16 && inst->src2 < 16) {
                registers[inst->dst] = registers[inst->src1] - registers[inst->src2];
            }
            break;

        case GLYPH_MUL_M:
            if (inst->dst < 16 && inst->src1 < 16 && inst->src2 < 16) {
                registers[inst->dst] = registers[inst->src1] * registers[inst->src2];
            }
            break;

        case GLYPH_MOV:
            if (inst->dst < 16 && inst->src1 < 16) {
                registers[inst->dst] = inst->src2;  // Immediate value
            }
            break;

        case GLYPH_DRAW:
            // Draw rectangle at (r[dst], r[src1]) with size (r[src2], r[src2])
            mi_batch_color_blt(batch,
                registers[inst->dst],
                registers[inst->src1],
                registers[inst->src2] > 0 ? registers[inst->src2] : 10,
                registers[inst->src2] > 0 ? registers[inst->src2] : 10,
                0xFF00FF00);  // Green
            break;

        case GLYPH_HALT_M:
            mi_batch_flush(batch);
            mi_batch_end(batch);
            return 0;  // Stop compilation

        default:
            break;
    }
    return 1;  // Continue
}

// Compile full glyph program to MI batch
int glyph_compile_program(GlyphProgram *prog, MiBatchBuffer *batch, u32 *registers) {
    mi_batch_init(batch);

    for (u32 i = 0; i < prog->count; i++) {
        if (glyph_compile_inst(&prog->insts[i], batch, registers) == 0) {
            break;  // HALT
        }
    }

    // Ensure batch ends properly
    if (batch->count > 0 && batch->commands[batch->count - 1] != MI_BATCH_BUFFER_END) {
        mi_batch_end(batch);
    }

    return batch->count;
}

// ============================================================================
// Test Program
// ============================================================================

// Built-in test glyph program
static const char *test_glyph_program =
    "MOV 0 0 100\n"    // r0 = 100 (x)
    "MOV 1 0 200\n"    // r1 = 200 (y)
    "MOV 2 0 50\n"     // r2 = 50 (size)
    "DRAW 0 1 2\n"     // Draw rect at (100, 200) size 50
    "HALT\n";          // End

// Compile and return test batch
int glyph_test_compile(MiBatchBuffer *batch) {
    GlyphProgram prog;
    u32 registers[16] = {0};

    int count = glyph_parse_program(test_glyph_program, &prog);
    if (count <= 0) return -1;

    return glyph_compile_program(&prog, batch, registers);
}
