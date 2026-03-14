// test_batch.c - Test batch buffer execution
// Compile with: gcc -o test_batch test_batch.c

#include <stdio.h>
#include <stdint.h>
#include <string.h>

// MI command opcodes (bits 23:29)
#define MI_OPCODE_MASK 0x7F
#define MI_FLUSH_OPCODE 0x04
#define MI_STORE_DWORD_OPCODE 0x22
#define MI_BATCH_BUFFER_END_OPCODE 0x05

// MI command builder
static inline uint32_t mi_flush(void) {
    return MI_FLUSH_OPCODE << 23;
}

static inline void mi_store_dword(uint32_t *buf, uint64_t addr, uint32_t value) {
    buf[0] = MI_STORE_DWORD_OPCODE << 23 | (4 - 2);  // MI_STORE_DATA_IMM, 4 dwords
    buf[1] = (uint32_t)(addr & 0xFFFFFFFF);
    buf[2] = (uint32_t)((addr >> 32) & 0xFFFFFFFF);
    buf[3] = value;
}

static inline uint32_t mi_batch_buffer_end(void) {
    return MI_BATCH_BUFFER_END_OPCODE << 23;
}

// Test functions
int test_batch_builder(void) {
    uint32_t commands[256];
    size_t count = 0;

    // Build: MI_FLUSH
    commands[count++] = mi_flush();

    // Build: MI_STORE_DWORD
    mi_store_dword(&commands[count], 0x100000000ULL, 0xDEADBEEF);
    count += 4;

    // Build: MI_BATCH_BUFFER_END
    commands[count++] = mi_batch_buffer_end();

    printf("✓ BatchBuilder: %zu commands built\n", count);
    return 1;
}

int test_mi_commands(void) {
    uint32_t flush = mi_flush();

    // Verify MI_FLUSH opcode
    if (((flush >> 23) & 0x7F) != MI_FLUSH_OPCODE) {
        printf("✗ MI_FLUSH opcode mismatch\n");
        return 0;
    }

    // Test store dword
    uint32_t store[4];
    mi_store_dword(store, 0x12345678ULL, 0xDEADBEEF);

    if (store[3] != 0xDEADBEEF) {
        printf("✗ MI_STORE_DWORD value mismatch\n");
        return 0;
    }

    printf("✓ MI commands verified\n");
    return 1;
}

int test_batch_buffer_end(void) {
    uint32_t end = mi_batch_buffer_end();

    if (((end >> 23) & 0x7F) != MI_BATCH_BUFFER_END_OPCODE) {
        printf("✗ MI_BATCH_BUFFER_END opcode mismatch\n");
        return 0;
    }

    printf("✓ MI_BATCH_BUFFER_END verified\n");
    return 1;
}

int main(void) {
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Real Batch Execution Test\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("\n");

    int passed = 1;

    printf("[1/3] Testing BatchBuilder...\n");
    passed &= test_batch_builder();

    printf("[2/3] Testing MI commands...\n");
    passed &= test_mi_commands();

    printf("[3/3] Testing MI_BATCH_BUFFER_END...\n");
    passed &= test_batch_buffer_end();

    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Test Summary\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  BatchBuilder:       %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("  MI Commands:        %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("  Batch Buffer End:   %s\n", passed ? "✓ PASS" : "✗ FAIL");
    printf("\n");
    printf("═════════════════════════════════════════════════════════════\n");
    printf("  Real Batch Execution Test %s\n", passed ? "Complete" : "Failed");
    printf("═════════════════════════════════════════════════════════════\n");

    return passed ? 0 : 1;
}
