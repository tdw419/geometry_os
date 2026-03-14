// demo_glyph_pipeline.c - Complete Glyph → SPIR-V → Batch Buffer → Display Pipeline
// Compile with: gcc -o demo_glyph_pipeline demo_glyph_pipeline.c -lm
// Run with: sudo ./demo_glyph_pipeline

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <drm/drm.h>
#include <drm/drm_mode.h>
#include <drm/drm_fourcc.h>

// ============================================================================
// Part 1: Glyph Program Opcodes
// ============================================================================

// Glyph opcodes (200-227)
typedef enum {
    GLYPH_NOP       = 200,  // No operation
    GLYPH_ADD       = 201,  // Add two values
    GLYPH_SUB       = 202,  // Subtract two values
    GLYPH_MUL       = 203,  // Multiply two values
    GLYPH_DIV       = 204,  // Divide two values
    GLYPH_LOAD      = 205,  // Load from memory
    GLYPH_STORE     = 206,  // Store to memory
    GLYPH_LOAD_IMM  = 207,  // Load immediate
    GLYPH_JUMP      = 208,  // Unconditional jump
    GLYPH_JUMP_Z    = 209,  // Jump if zero
    GLYPH_JUMP_NZ   = 210,  // Jump if not zero
    GLYPH_CMP       = 211,  // Compare
    GLYPH_AND       = 212,  // Bitwise AND
    GLYPH_OR        = 213,  // Bitwise OR
    GLYPH_XOR       = 214,  // Bitwise XOR
    GLYPH_NOT       = 215,  // Bitwise NOT
    GLYPH_SHL       = 216,  // Shift left
    GLYPH_SHR       = 217,  // Shift right
    GLYPH_CALL      = 218,  // Call subroutine
    GLYPH_RET       = 219,  // Return from subroutine
    GLYPH_PUSH      = 220,  // Push to stack
    GLYPH_POP       = 221,  // Pop from stack
    GLYPH_READ      = 222,  // Read input
    GLYPH_WRITE     = 223,  // Write output
    GLYPH_SYNC      = 224,  // Memory barrier
    GLYPH_ATOMIC    = 225,  // Atomic operation
    GLYPH_FADD      = 226,  // Floating-point add
    GLYPH_FMUL      = 227,  // Floating-point multiply
} GlyphOpcode;

// Glyph instruction format: [opcode:8][dst:8][src1:8][src2:8]
typedef struct {
    uint8_t opcode;
    uint8_t dst;
    uint8_t src1;
    uint8_t src2;
} GlyphInst;

// Build glyph instruction
static inline uint32_t glyph_inst(uint8_t op, uint8_t dst, uint8_t src1, uint8_t src2) {
    return (op << 24) | (dst << 16) | (src1 << 8) | src2;
}

// ============================================================================
// Part 2: SPIR-V Generation
// ============================================================================

// SPIR-V magic and header
#define SPIRV_MAGIC         0x07230203
#define SPIRV_VERSION       0x00010000  // SPIR-V 1.0
#define SPIRV_GENERATOR     0x00100000  // Geometry OS Generator

// SPIR-V opcodes
#define SPIRV_OP_NOP        0
#define SPIRV_OP_VARIABLE   59
#define SPIRV_OP_LOAD       61
#define SPIRV_OP_STORE      62
#define SPIRV_OP_IADD       128
#define SPIRV_OP_ISUB       129
#define SPIRV_OP_IMUL       132
#define SPIRV_OP_SDIV       134
#define SPIRV_OP_FADD       129
#define SPIRV_OP_FMUL       133
#define SPIRV_OP_RETURN     253

// SPIR-V builder context
typedef struct {
    uint32_t *words;
    size_t count;
    size_t capacity;
    uint32_t next_id;
    uint32_t type_void;
    uint32_t type_int;
    uint32_t type_float;
    uint32_t type_v4float;
    uint32_t type_image;
    uint32_t type_sampler;
    uint32_t type_sampled_image;
} SpirvBuilder;

// Add word to SPIR-V
static void spirv_word(SpirvBuilder *b, uint32_t word) {
    if (b->count >= b->capacity) {
        b->capacity *= 2;
        b->words = realloc(b->words, b->capacity * sizeof(uint32_t));
    }
    b->words[b->count++] = word;
}

// Add instruction (opcode + word count)
static void spirv_inst(SpirvBuilder *b, uint16_t opcode, uint32_t *args, size_t argc) {
    spirv_word(b, (uint32_t)((argc + 1) << 16) | opcode);
    for (size_t i = 0; i < argc; i++) {
        spirv_word(b, args[i]);
    }
}

// Compile glyph program to SPIR-V
static SpirvBuilder compile_glyph_to_spirv(uint32_t *program, size_t len) {
    SpirvBuilder b = {
        .words = malloc(4096 * sizeof(uint32_t)),
        .count = 0,
        .capacity = 4096,
        .next_id = 1,
    };

    // SPIR-V Header
    spirv_word(&b, SPIRV_MAGIC);
    spirv_word(&b, SPIRV_VERSION);
    spirv_word(&b, SPIRV_GENERATOR);
    spirv_word(&b, 0);  // Bound (IDs < bound)
    spirv_word(&b, 0);  // Schema

    // Types
    b.type_void = b.next_id++;
    uint32_t args[] = {b.type_void};
    spirv_inst(&b, 19, args, 1);  // OpTypeVoid

    b.type_int = b.next_id++;
    uint32_t args_int[] = {b.type_int, 32, 1};
    spirv_inst(&b, 21, args_int, 3);  // OpTypeInt 32 signed

    b.type_float = b.next_id++;
    uint32_t args_float[] = {b.type_float, 32};
    spirv_inst(&b, 22, args_float, 2);  // OpTypeFloat 32

    b.type_v4float = b.next_id++;
    uint32_t args_v4[] = {b.type_v4float, b.type_float, 4};
    spirv_inst(&b, 23, args_v4, 3);  // OpTypeVector

    // Compile each glyph instruction
    for (size_t i = 0; i < len; i++) {
        uint32_t inst = program[i];
        uint8_t op = (inst >> 24) & 0xFF;
        uint8_t dst = (inst >> 16) & 0xFF;
        uint8_t src1 = (inst >> 8) & 0xFF;
        uint8_t src2 = inst & 0xFF;

        uint32_t result_id = b.next_id++;

        switch (op) {
            case GLYPH_ADD: {
                uint32_t add_args[] = {b.type_int, result_id, src1, src2};
                spirv_inst(&b, SPIRV_OP_IADD, add_args, 4);
                break;
            }
            case GLYPH_SUB: {
                uint32_t sub_args[] = {b.type_int, result_id, src1, src2};
                spirv_inst(&b, SPIRV_OP_ISUB, sub_args, 4);
                break;
            }
            case GLYPH_MUL: {
                uint32_t mul_args[] = {b.type_int, result_id, src1, src2};
                spirv_inst(&b, SPIRV_OP_IMUL, mul_args, 4);
                break;
            }
            case GLYPH_FADD: {
                uint32_t fadd_args[] = {b.type_float, result_id, src1, src2};
                spirv_inst(&b, SPIRV_OP_FADD, fadd_args, 4);
                break;
            }
            case GLYPH_FMUL: {
                uint32_t fmul_args[] = {b.type_float, result_id, src1, src2};
                spirv_inst(&b, SPIRV_OP_FMUL, fmul_args, 4);
                break;
            }
            case GLYPH_NOP:
            default:
                spirv_inst(&b, SPIRV_OP_NOP, NULL, 0);
                break;
        }
    }

    // OpReturn
    spirv_inst(&b, SPIRV_OP_RETURN, NULL, 0);

    return b;
}

// ============================================================================
// Part 3: Intel Batch Buffer Generation
// ============================================================================

// MI command opcodes (bits 23:29)
#define MI_OPCODE_SHIFT     23
#define MI_OPCODE(x)        ((x) << MI_OPCODE_SHIFT)

#define MI_NOOP             MI_OPCODE(0x00)
#define MI_BATCH_BUFFER_END MI_OPCODE(0x05)
#define MI_FLUSH            MI_OPCODE(0x04)
#define MI_STORE_DATA_IMM   MI_OPCODE(0x22)
#define MI_LOAD_REGISTER_IMM MI_OPCODE(0x22)

// 2D BLT commands
#define XY_COLOR_BLT        0x78000000

// Batch buffer builder
typedef struct {
    uint32_t *commands;
    size_t count;
    size_t capacity;
} BatchBuilder;

static void batch_init(BatchBuilder *b, size_t capacity) {
    b->commands = malloc(capacity * sizeof(uint32_t));
    b->count = 0;
    b->capacity = capacity;
}

static void batch_add(BatchBuilder *b, uint32_t cmd) {
    if (b->count >= b->capacity) {
        b->capacity *= 2;
        b->commands = realloc(b->commands, b->capacity * sizeof(uint32_t));
    }
    b->commands[b->count++] = cmd;
}

static void batch_add_mi_flush(BatchBuilder *b) {
    batch_add(b, MI_FLUSH | (1 << 0));  // Flush state
}

static void batch_add_color_blt(BatchBuilder *b, uint32_t pitch, uint64_t dst,
                                 uint32_t width, uint32_t height, uint32_t color) {
    batch_add(b, XY_COLOR_BLT | (6 - 2));  // DWord count
    batch_add(b, pitch << 16 | 4);         // Pitch, BPP
    batch_add(b, (uint32_t)(dst & 0xFFFFFFFF));
    batch_add(b, (uint32_t)((dst >> 32) & 0xFFFFFFFF));
    batch_add(b, height << 16 | width);    // Size
    batch_add(b, color);                   // Fill color
}

static void batch_add_end(BatchBuilder *b) {
    batch_add(b, MI_BATCH_BUFFER_END);
}

// Compile SPIR-V to batch buffer (simulated - real would use shader compiler)
static BatchBuilder compile_spirv_to_batch(SpirvBuilder *spirv, uint64_t fb_addr,
                                            uint32_t fb_pitch, uint32_t width, uint32_t height) {
    BatchBuilder batch;
    batch_init(&batch, 4096);

    // Start with flush
    batch_add_mi_flush(&batch);

    // For now, interpret the SPIR-V and generate BLT commands
    // A real implementation would compile to GPU shader code

    // Draw a pattern based on SPIR-V operations
    for (size_t i = 0; i < spirv->count; i++) {
        uint32_t word = spirv->words[i];

        // Use word as color seed
        uint32_t color = 0xFF000000 | (word & 0x00FFFFFF);

        // Draw colored rectangle
        uint32_t x = (i * 64) % width;
        uint32_t y = ((i * 64) / width) * 64;
        if (y + 64 <= height) {
            batch_add_color_blt(&batch, fb_pitch, fb_addr + y * fb_pitch + x * 4,
                               64, 64, color);
        }
    }

    // End batch
    batch_add_end(&batch);

    return batch;
}

// ============================================================================
// Part 4: Display via DRM/KMS
// ============================================================================

#define DRM_MODE_CONNECTED 1

static int drm_ioctl(int fd, unsigned long request, void *arg) {
    int ret;
    do {
        ret = ioctl(fd, request, arg);
    } while (ret == -1 && errno == EINTR);
    return ret;
}

static int get_resources(int fd, struct drm_mode_card_res *res) {
    memset(res, 0, sizeof(*res));
    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETRESOURCES, res))
        return -1;

    res->fb_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_fbs * sizeof(uint32_t));
    res->crtc_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_crtcs * sizeof(uint32_t));
    res->connector_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_connectors * sizeof(uint32_t));
    res->encoder_id_ptr = (uint64_t)(uintptr_t)malloc(res->count_encoders * sizeof(uint32_t));

    return drm_ioctl(fd, DRM_IOCTL_MODE_GETRESOURCES, res);
}

static int get_connector(int fd, uint32_t conn_id, struct drm_mode_get_connector *conn) {
    memset(conn, 0, sizeof(*conn));
    conn->connector_id = conn_id;

    if (drm_ioctl(fd, DRM_IOCTL_MODE_GETCONNECTOR, conn))
        return -1;

    conn->props_ptr = (uint64_t)(uintptr_t)malloc(conn->count_props * sizeof(uint32_t));
    conn->prop_values_ptr = (uint64_t)(uintptr_t)malloc(conn->count_props * sizeof(uint64_t));
    conn->modes_ptr = (uint64_t)(uintptr_t)malloc(conn->count_modes * sizeof(struct drm_mode_modeinfo));
    conn->encoders_ptr = (uint64_t)(uintptr_t)malloc(conn->count_encoders * sizeof(uint32_t));

    return drm_ioctl(fd, DRM_IOCTL_MODE_GETCONNECTOR, conn);
}

static uint32_t find_connected_connector(int fd, struct drm_mode_card_res *res,
                                          struct drm_mode_get_connector *conn_out,
                                          struct drm_mode_modeinfo *mode_out) {
    uint32_t *connectors = (uint32_t *)(uintptr_t)res->connector_id_ptr;

    for (int i = 0; i < res->count_connectors; i++) {
        struct drm_mode_get_connector conn;
        if (get_connector(fd, connectors[i], &conn))
            continue;

        if (conn.connection == DRM_MODE_CONNECTED && conn.count_modes > 0) {
            *conn_out = conn;
            struct drm_mode_modeinfo *modes = (struct drm_mode_modeinfo *)(uintptr_t)conn.modes_ptr;
            *mode_out = modes[0];
            return connectors[i];
        }
    }
    return 0;
}

static uint32_t find_crtc(int fd, struct drm_mode_card_res *res,
                          struct drm_mode_get_connector *conn) {
    uint32_t *encoders = (uint32_t *)(uintptr_t)conn->encoders_ptr;
    uint32_t *crtcs = (uint32_t *)(uintptr_t)res->crtc_id_ptr;

    for (int i = 0; i < conn->count_encoders; i++) {
        struct drm_mode_get_encoder enc = { .encoder_id = encoders[i] };
        if (drm_ioctl(fd, DRM_IOCTL_MODE_GETENCODER, &enc))
            continue;

        for (int j = 0; j < res->count_crtcs; j++) {
            if (enc.possible_crtcs & (1 << j))
                return crtcs[j];
        }
    }
    return 0;
}

// ============================================================================
// Part 5: Demo
// ============================================================================

int main(void) {
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Glyph → SPIR-V → Batch Buffer → Display Pipeline\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("\n");

    // ========================================
    // Step 1: Create Glyph Program
    // ========================================
    printf("[1/6] Creating glyph program...\n");

    // Simple program: compute some values
    uint32_t glyph_program[] = {
        glyph_inst(GLYPH_LOAD_IMM, 0, 100, 0),    // r0 = 100
        glyph_inst(GLYPH_LOAD_IMM, 1, 200, 0),    // r1 = 200
        glyph_inst(GLYPH_ADD, 2, 0, 1),           // r2 = r0 + r1 = 300
        glyph_inst(GLYPH_MUL, 3, 2, 0),           // r3 = r2 * r0 = 30000
        glyph_inst(GLYPH_STORE, 4, 3, 0),         // mem[4] = r3
        glyph_inst(GLYPH_FADD, 5, 0, 1),          // f5 = f0 + f1 (float)
        glyph_inst(GLYPH_NOP, 0, 0, 0),           // End
    };

    printf("    ✓ Created program with %zu instructions\n",
           sizeof(glyph_program) / sizeof(glyph_program[0]));

    // ========================================
    // Step 2: Compile to SPIR-V
    // ========================================
    printf("\n[2/6] Compiling to SPIR-V...\n");

    SpirvBuilder spirv = compile_glyph_to_spirv(
        glyph_program,
        sizeof(glyph_program) / sizeof(glyph_program[0])
    );

    printf("    ✓ Generated SPIR-V: %zu words (%zu bytes)\n",
           spirv.count, spirv.count * 4);

    // ========================================
    // Step 3: Compile to Batch Buffer
    // ========================================
    printf("\n[3/6] Compiling to Intel batch buffer...\n");

    // Use simulated framebuffer address
    uint64_t fb_addr = 0x100000000;
    uint32_t fb_pitch = 2560 * 4;
    uint32_t fb_width = 2560;
    uint32_t fb_height = 1600;

    BatchBuilder batch = compile_spirv_to_batch(&spirv, fb_addr, fb_pitch,
                                                 fb_width, fb_height);

    printf("    ✓ Generated batch buffer: %zu commands (%zu bytes)\n",
           batch.count, batch.count * 4);

    // Verify batch buffer
    int valid = 1;
    if (((batch.commands[0] >> 23) & 0x7F) != 0x04) {
        printf("    ✗ First command should be MI_FLUSH\n");
        valid = 0;
    }
    if (batch.commands[batch.count - 1] != MI_BATCH_BUFFER_END) {
        printf("    ✗ Last command should be MI_BATCH_BUFFER_END\n");
        valid = 0;
    }
    if (valid) {
        printf("    ✓ Batch buffer validated\n");
    }

    // ========================================
    // Step 4: Open DRM Device
    // ========================================
    printf("\n[4/6] Opening DRM device...\n");

    const char *devices[] = {"/dev/dri/card1", "/dev/dri/card0", NULL};
    int drm_fd = -1;

    for (int i = 0; devices[i]; i++) {
        drm_fd = open(devices[i], O_RDWR | O_CLOEXEC);
        if (drm_fd >= 0) {
            printf("    ✓ Opened %s\n", devices[i]);
            break;
        }
    }

    if (drm_fd < 0) {
        printf("    ✗ Cannot open DRM device\n");
        free(spirv.words);
        free(batch.commands);
        return 1;
    }

    // ========================================
    // Step 5: Setup Display
    // ========================================
    printf("\n[5/6] Setting up display...\n");

    struct drm_mode_card_res res;
    if (get_resources(drm_fd, &res) < 0) {
        printf("    ✗ Failed to get DRM resources\n");
        close(drm_fd);
        free(spirv.words);
        free(batch.commands);
        return 1;
    }

    struct drm_mode_get_connector conn;
    struct drm_mode_modeinfo mode;
    uint32_t conn_id = find_connected_connector(drm_fd, &res, &conn, &mode);
    if (!conn_id) {
        printf("    ✗ No connected display\n");
        close(drm_fd);
        free(spirv.words);
        free(batch.commands);
        return 1;
    }
    printf("    ✓ Display: %dx%d\n", mode.hdisplay, mode.vdisplay);

    uint32_t crtc_id = find_crtc(drm_fd, &res, &conn);
    if (!crtc_id) {
        printf("    ✗ No CRTC available\n");
        close(drm_fd);
        free(spirv.words);
        free(batch.commands);
        return 1;
    }
    printf("    ✓ CRTC: %d\n", crtc_id);

    // ========================================
    // Step 6: Summary
    // ========================================
    printf("\n[6/6] Pipeline Summary...\n");

    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Pipeline Complete\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("\n");
    printf("  Stage              Input → Output\n");
    printf("  ───────────────────────────────────────────────────────────\n");
    printf("  1. Glyph Program   7 instructions (ADD, MUL, STORE, etc.)\n");
    printf("  2. SPIR-V          %zu words (%zu bytes)\n", spirv.count, spirv.count * 4);
    printf("  3. Batch Buffer    %zu dwords (%zu bytes)\n", batch.count, batch.count * 4);
    printf("  4. DRM Device      %s\n", drm_fd >= 0 ? "✓ Open" : "✗ Closed");
    printf("  5. Display         %dx%d\n", mode.hdisplay, mode.vdisplay);
    printf("\n");
    printf("  Glyph Opcodes Used:\n");
    printf("    • GLYPH_LOAD_IMM (207) - Load immediate value\n");
    printf("    • GLYPH_ADD (201)      - Integer addition\n");
    printf("    • GLYPH_MUL (203)      - Integer multiplication\n");
    printf("    • GLYPH_STORE (206)    - Store to memory\n");
    printf("    • GLYPH_FADD (226)     - Float addition\n");
    printf("    • GLYPH_NOP (200)      - No operation\n");
    printf("\n");
    printf("  Intel MI Commands Generated:\n");
    printf("    • MI_FLUSH            - Cache flush\n");
    printf("    • XY_COLOR_BLT        - 2D color fill\n");
    printf("    • MI_BATCH_BUFFER_END - End of batch\n");
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Next: Submit batch via MMIO ring or DRM execbuf\n");
    printf("═════════════════════════════════════════════════════════════\n");

    // Cleanup
    close(drm_fd);
    free(spirv.words);
    free(batch.commands);

    return 0;
}
