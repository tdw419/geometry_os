/*
 * xor_neural_test.c -- Step 3: XOR Neural Offload Test
 *
 * Runs inside the RISC-V guest. Offloads XOR computation to the
 * Spatial Neural Circuit via the /dev/substrate driver.
 *
 * Truth table expected:
 *   A  B  |  A XOR B
 *   0  0  |    0
 *   0  1  |    1
 *   1  0  |    1
 *   1  1  |    0
 *
 * Flow: open -> load XOR circuit -> for each input: write ports -> fire ->
 *       tick -> read output -> report.
 */

#include "libgeos.h"

/* Helper: pack port+value for WRITE_PORT IOCTL */
static inline long write_port(int fd, uint32_t port, uint32_t value) {
    return geos_ioctl(fd, SUB_IOCTL_WRITE_PORT, ((port & 0xFFFF) << 16) | (value & 0xFFFF));
}

/* Helper: read from a circuit port */
static inline long read_port(int fd, uint32_t port) {
    return geos_ioctl(fd, SUB_IOCTL_READ_PORT, port);
}

/* XOR truth table: {A, B, expected} */
static const uint32_t xor_truth[4][3] = {
    {0, 0, 0},
    {0, 1, 1},
    {1, 0, 1},
    {1, 1, 0},
};

void c_start() {
    geos_puts("[xor] XOR Neural Offload Test\n");
    geos_puts("[xor] ========================\n\n");

    /* 1. Open the substrate device */
    int fd = (int)geos_open("/dev/substrate", GEO_O_RDWR);
    if (fd < 0) {
        geos_puts("[ERROR] Failed to open /dev/substrate\n");
        return;
    }
    geos_puts("[xor] opened /dev/substrate (fd=");
    geos_put_dec((uint32_t)fd);
    geos_puts(")\n");

    /* 2. Load the pre-built XOR circuit (id=2) */
    geos_puts("[xor] loading XOR circuit (id=2)...\n");
    long rc = geos_ioctl(fd, SUB_IOCTL_LOAD_CIRCUIT, SUB_CIRCUIT_XOR);
    if (rc < 0) {
        geos_puts("[ERROR] LOAD_CIRCUIT failed\n");
        geos_close(fd);
        return;
    }
    geos_puts("[xor] XOR circuit loaded\n");

    /* 3. Query substrate version */
    uint32_t version = (uint32_t)geos_ioctl(fd, SUB_IOCTL_QUERY, SUB_QUERY_VERSION);
    geos_puts("[xor] substrate version: 0x");
    geos_put_hex(version);
    geos_puts("\n");

    /* 4. Run XOR truth table & Training Loop */
    geos_puts("\n[xor] --- Autonomous Training Loop ---\n");
    
    int epoch = 0;
    int max_epochs = 20;
    int correct = 0;

    while (epoch < max_epochs && correct < 4) {
        geos_puts("[xor] Epoch ");
        geos_put_dec(epoch);
        geos_puts("...\n");
        correct = 0;

        for (int i = 0; i < 4; i++) {
            uint32_t a = xor_truth[i][0];
            uint32_t b = xor_truth[i][1];
            uint32_t expected = xor_truth[i][2];

            /* Write inputs to circuit ports (Use strong 200 payload for active signals) */
            write_port(fd, 0, a ? 200 : 0);   /* Port 0 = input A */
            write_port(fd, 1, b ? 200 : 0);   /* Port 1 = input B */

            /* Fire the circuit -- inject activation pulse */
            geos_ioctl(fd, SUB_IOCTL_FIRE, 0);

            /* Tick the substrate to propagate signals */
            geos_ioctl(fd, SUB_IOCTL_TICK, 12);

            /* Read output from port 1 */
            uint32_t raw_out = (uint32_t)read_port(fd, 1);

            /* Threshold: active wire (tax=15) or signal (tax=12) means "1" */
            uint32_t tax = raw_out >> 28;
            uint32_t got = (tax == 15 || tax == 12) ? 1 : 0;
            if (got == expected) correct++;
        }

        geos_puts("  correct: ");
        geos_put_dec((uint32_t)correct);
        geos_puts("/4\n");

        if (correct < 4) {
            /* Apply Hebbian learning pass (Disabled for baseline topology proof)
             * decay=0.0 (0/256), bump=0
             */
            geos_ioctl(fd, SUB_IOCTL_LEARN, (0 << 16) | 0);
        }
        epoch++;
    }

    /* 5. Summary */
    geos_puts("\n[xor] --- Results ---\n");

    geos_puts("[xor] correct: ");
    geos_put_dec((uint32_t)correct);
    geos_puts("/4\n");

    if (correct == 4) {
        geos_puts("[xor] PERFECT SCORE -- spatial XOR fully functional!\n");
    } else {
        geos_puts("[xor] partial -- circuit may need tuning or more ticks\n");
    }

    /* 6. Query final tick count */
    uint32_t ticks = (uint32_t)geos_ioctl(fd, SUB_IOCTL_QUERY, SUB_QUERY_TICKS);
    geos_puts("[xor] total substrate ticks: ");
    geos_put_dec(ticks);
    geos_puts("\n");

    geos_close(fd);
    geos_puts("\n[xor] test complete.\n");
}
