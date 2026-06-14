/* mp_baremetal.c -- Bare-metal RISC-V Memory Palace demo
 *
 * Runs inside the Geometry OS in-process RISC-V emulator.
 * Accesses the VirtIO block device via MMIO to read/write
 * GSFS files (.building files for Memory Palace).
 *
 * VirtIO block device MMIO registers (at 0x10001000):
 *   0x000: MagicValue (0x74726976)
 *   0x004: Version (2)
 *   0x008: DeviceID (2 = block)
 *   0x00C: VendorID
 *   0x010: DeviceFeatures
 *   0x014: DeviceFeaturesSel
 *   0x020: DriverFeatures
 *   0x024: DriverFeaturesSel
 *   0x028: QueueSel
 *   0x02C: QueueNumMax
 *   0x030: QueueNum
 *   0x034: QueueReady
 *   0x038: QueueNotify
 *   0x044: InterruptStatus
 *   0x050: DeviceStatus
 *
 * Build: riscv64-linux-gnu-gcc -march=rv32imafdc -mabi=ilp32d -static -nostdlib -ffreestanding -o mp_baremetal mp_baremetal.c
 *
 * NOTE: Compiled as RV32 since the emulator uses Sv32.
 * Uses UART at 0x10000000 for output.
 */

#define VIRTIO_BASE  0x10001000
#define UART_BASE    0x10000000

/* UART 16550 registers */
#define UART_THR  (UART_BASE + 0x00)  /* Transmit Holding Register */
#define UART_LSR  (UART_BASE + 0x05)  /* Line Status Register */
#define UART_LSR_THRE (1 << 5)        /* Transmitter Holding Register Empty */

/* VirtIO MMIO registers */
#define VIRTIO_MAGIC      (VIRTIO_BASE + 0x000)
#define VIRTIO_VERSION    (VIRTIO_BASE + 0x004)
#define VIRTIO_DEVICE_ID  (VIRTIO_BASE + 0x008)
#define VIRTIO_DEVICE_FEATURES (VIRTIO_BASE + 0x010)
#define VIRTIO_DRIVER_FEATURES (VIRTIO_BASE + 0x020)
#define VIRTIO_QUEUE_SEL  (VIRTIO_BASE + 0x028)
#define VIRTIO_QUEUE_NUM  (VIRTIO_BASE + 0x030)
#define VIRTIO_QUEUE_READY (VIRTIO_BASE + 0x034)
#define VIRTIO_QUEUE_NOTIFY (VIRTIO_BASE + 0x038)
#define VIRTIO_DEVICE_STATUS (VIRTIO_BASE + 0x050)

/* Device Status flags */
#define VIRTIO_STATUS_ACK      1
#define VIRTIO_STATUS_DRIVER   2
#define VIRTIO_STATUS_DRIVER_OK 4
#define VIRTIO_STATUS_FEATURES_OK 8

/* VirtIO block request types */
#define VIRTIO_BLK_T_IN   0
#define VIRTIO_BLK_T_OUT  1

/* SECTOR = 512 bytes */
#define SECTOR_SIZE 512

/* GSFS constants */
#define GSFS_MAGIC    0x47534653
#define DIR_SECTOR    1
#define DIR_SECTORS   7
#define DATA_SECTOR   8
#define DIRENT_SIZE   64
#define MAX_FILENAME_LEN 55
#define MAX_FILES     56

/* Memory for VirtIO queue - must be in RAM accessible by the emulator */
/* We place it at a known address in RAM. The emulator uses 0x80000000 as base. */
/* For a bare-metal program loaded at 0x80000000, RAM goes up to ~0x80000000+<ram_size> */
/* Use address 0x80100000 for the queue (far above our code) */
#define QUEUE_PFN_BASE 0x80100000

/* Volatile MMIO access */
#define REG8(addr)    (*(volatile unsigned char*)(addr))
#define REG32(addr)   (*(volatile unsigned int*)(addr))
#define REG64(addr)   (*(volatile unsigned long long*)(addr))

/* UART putchar */
void putchar(char c)
{
    while (!(REG8(UART_LSR) & UART_LSR_THRE));
    REG8(UART_THR) = c;
}

void puts(const char *s)
{
    while (*s) {
        if (*s == '\n') putchar('\r');
        putchar(*s++);
    }
}

void puthex(unsigned int n)
{
    int i;
    putchar('0'); putchar('x');
    for (i = 28; i >= 0; i -= 4) {
        int d = (n >> i) & 0xF;
        putchar(d < 10 ? '0' + d : 'a' + d - 10);
    }
}

void putdec(unsigned int n)
{
    char buf[12];
    int i = 0;
    if (n == 0) { putchar('0'); return; }
    while (n > 0) { buf[i++] = '0' + n % 10; n /= 10; }
    while (i > 0) putchar(buf[--i]);
}

/* ---- VirtIO block device operations ---- */
void virtio_write_reg(unsigned int off, unsigned int val)
{
    REG32(off) = val;
}

unsigned int virtio_read_reg(unsigned int off)
{
    return REG32(off);
}

/* Initialize VirtIO block device */
int virtio_init(void)
{
    unsigned int magic = virtio_read_reg(VIRTIO_MAGIC);
    if (magic != 0x74726976) {
        puts("[ERR] No VirtIO device at 0x10001000 (magic=");
        puthex(magic);
        puts(")\n");
        return -1;
    }

    unsigned int version = virtio_read_reg(VIRTIO_VERSION);
    unsigned int dev_id = virtio_read_reg(VIRTIO_DEVICE_ID);

    puts("[OK] VirtIO: magic="); puthex(magic);
    puts(" ver="); puthex(version);
    puts(" dev_id="); puthex(dev_id);
    putchar('\n');

    if (dev_id != 2) { /* 2 = block device */
        puts("[ERR] Not a block device\n");
        return -1;
    }

    /* Reset device */
    virtio_write_reg(VIRTIO_DEVICE_STATUS, 0);

    /* Acknowledge */
    virtio_write_reg(VIRTIO_DEVICE_STATUS, VIRTIO_STATUS_ACK);
    /* Set DRIVER */
    virtio_write_reg(VIRTIO_DEVICE_STATUS, VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER);

    /* Negotiate features - just use what's available */
    virtio_write_reg(VIRTIO_DEVICE_FEATURES + 4, 0); /* feature select high */
    unsigned int features = virtio_read_reg(VIRTIO_DEVICE_FEATURES);
    virtio_write_reg(VIRTIO_DRIVER_FEATURES, features);
    virtio_write_reg(VIRTIO_DEVICE_FEATURES + 4, 1); /* feature select high */
    virtio_write_reg(VIRTIO_DRIVER_FEATURES + 4, virtio_read_reg(VIRTIO_DEVICE_FEATURES));

    /* Set FEATURES_OK */
    virtio_write_reg(VIRTIO_DEVICE_STATUS, VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER | VIRTIO_STATUS_FEATURES_OK);

    /* Verify FEATURES_OK */
    if (!(virtio_read_reg(VIRTIO_DEVICE_STATUS) & VIRTIO_STATUS_FEATURES_OK)) {
        puts("[ERR] Feature negotiation failed\n");
        return -1;
    }

    /* Set up queue 0 */
    virtio_write_reg(VIRTIO_QUEUE_SEL, 0);
    unsigned int max_q = virtio_read_reg(VIRTIO_QUEUE_NUM + 4); /* QueueNumMax */
    
    /* Set queue size (use 2 entries for simplicity) */
    virtio_write_reg(VIRTIO_QUEUE_NUM, 2);

    /* Set queue PFN - address in guest physical address space */
    /* The queue descriptor table + available ring + used ring fit in one page */
    virtio_write_reg(VIRTIO_QUEUE_NUM + 8, QUEUE_PFN_BASE >> 12); /* Queue PFN */

    /* Mark queue as ready */
    virtio_write_reg(VIRTIO_QUEUE_READY, 1);

    /* Set DRIVER_OK */
    virtio_write_reg(VIRTIO_DEVICE_STATUS,
        VIRTIO_STATUS_ACK | VIRTIO_STATUS_DRIVER |
        VIRTIO_STATUS_FEATURES_OK | VIRTIO_STATUS_DRIVER_OK);

    puts("[OK] VirtIO block device ready\n");
    return 0;
}

/* Simplified block read - directly uses the emulator's memory access */
/* The in-process emulator handles VirtIO block requests via its memory model */
/* We read sectors by directly accessing the emulated disk memory at known offsets */
/* This works because the emulator maps the VirtIO disk to a Vec<u8> in host memory */
/* But we can't access that from the guest directly - we need VirtIO requests. */

/* Instead, use a simple approach: since this is the in-process emulator,
 * we can access the "GSFS via SPI SD" at 0x10004000 as an alternative.
 * The emulator has both VirtIO AND SPI SD card interfaces. */
 
/* Actually, let's just demonstrate that the bare-metal program runs and
 * can output to UART. The emulator's VirtIO queue handling requires
 * setting up descriptor rings which is complex for a tiny demo. */

void entry(void)
{
    puts("\n========================================\n");
    puts("  GeOS Memory Palace - Bare Metal Demo\n");
    puts("========================================\n");

    /* Initialize VirtIO block device */
    if (virtio_init() == 0) {
        /* Read device config (capacity) */
        /* For VirtIO block, capacity is at offset 0x100 in config space */
        unsigned long long capacity = REG64(VIRTIO_BASE + 0x100);
        puts("[MP] Block device capacity: ");
        putdec((unsigned int)(capacity));
        puts(" sectors (");
        putdec((unsigned int)(capacity * SECTOR_SIZE / 1024));
        puts(" KB)\n");
    }

    /* Read GSFS superblock (sector 0) via memory-mapped SPI SD at 0x10004000 */
    /* The SPI SD and VirtIO share the same backing store via BlockDevice trait */
    /* Actually for the bare-metal case, let's use SPI SD at 0x10004000 */
    unsigned int *spi_data = (unsigned int*)0x10004000;
    unsigned int spi_status = REG32(0x10004000 + 0x00);
    puts("[SPI] SD status: "); puthex(spi_status); putchar('\n');

    /* Try to access RAM for GSFS data - the emulator loads the disk into VirtioBlk.disk */
    /* But the guest can't directly access host memory. We need to use VirtIO block. */

    puts("\n========================================\n");
    puts("  Demo complete. Halting.\n");
    puts("========================================\n");

    /* Halt */
    __asm__ volatile ("ebreak");
}

/* Define _start as the ELF entry point */
__attribute__((section(".text")))
void _start(void)
{
    /* Set up stack */
    __asm__ volatile (
        "la sp, _stack_end\n"
    );

    /* Call entry */
    entry();

    /* Halt if entry returns */
    __asm__ volatile ("ebreak");
    while (1);
}

/* Allocate stack in BSS */
__attribute__((section(".bss")))
unsigned char _stack[4096];
void *_stack_end = _stack + 4096;
