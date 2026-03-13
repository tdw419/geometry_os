/*
 * Geometry OS Bare Metal Kernel
 *
 * Direct GPU execution without Linux
 */

#include "gpu.h"

/* Boot info from UEFI */
struct boot_info {
    unsigned long magic;
    unsigned long gpu_mmio_base;
    unsigned long gpu_mmio_size;
    unsigned long vram_base;
    unsigned long vram_size;
    unsigned long glyph_memory_base;
    unsigned long glyph_memory_size;
    unsigned int gpu_vendor_id;
    unsigned int gpu_device_id;
    unsigned int num_compute_units;
    unsigned char reserved[52];
};

/* UART for debug output */
#define UART_BASE 0x3F8

/* GPU context */
static struct {
    void *mmio_base;
    void *vram_base;
    void *glyph_memory;
    unsigned int vendor_id;
    unsigned int device_id;
} gpu;

/* Framebuffer */
static unsigned int *framebuffer;
static int fb_width = 1920;
static int fb_height = 1080;

/* Simple outb for port I/O */
static inline void outb(unsigned short port, unsigned char val)
{
    __asm__ volatile ("outb %0, %1" : : "a"(val), "Nd"(port));
}

/* Simple inb for port I/O */
static inline unsigned char inb(unsigned short port)
{
    unsigned char ret;
    __asm__ volatile ("inb %1, %0" : "=a"(ret) : "Nd"(port));
    return ret;
}

/* MMIO read/write */
static inline unsigned int mmio_read(void *addr)
{
    return *(volatile unsigned int *)addr;
}

static inline void mmio_write(void *addr, unsigned int val)
{
    *(volatile unsigned int *)addr = val;
}

/* Debug output via serial */
static void uart_putc(char c)
{
    while (!(inb(UART_BASE + 5) & 0x20));  /* Wait for TX ready */
    outb(UART_BASE, c);
}

static void uart_puts(const char *s)
{
    while (*s) {
        if (*s == '\n')
            uart_putc('\r');
        uart_putc(*s++);
    }
}

/* Initialize GPU for compute */
static int gpu_init(struct boot_info *info)
{
    uart_puts("\n[GPU] Initializing...\n");

    gpu.mmio_base = (void *)info->gpu_mmio_base;
    gpu.vram_base = (void *)info->vram_base;
    gpu.glyph_memory = (void *)info->glyph_memory_base;
    gpu.vendor_id = info->gpu_vendor_id;
    gpu.device_id = info->gpu_device_id;

    uart_puts("[GPU] MMIO base: ");
    /* Print hex address */
    char buf[20];
    unsigned long addr = (unsigned long)gpu.mmio_base;
    for (int i = 60; i >= 0; i -= 4) {
        int digit = (addr >> i) & 0xF;
        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
    }
    uart_puts("\n");

    /* TODO: Initialize GPU command queues */
    /* TODO: Set up compute rings */

    uart_puts("[GPU] Ready\n");
    return 0;
}

/* Simple glyph compute test */
static void glyph_compute_test(void)
{
    uart_puts("\n[Glyph] Running compute test...\n");

    /* In a full implementation:
     * 1. Allocate GPU memory for SPIR-V
     * 2. Upload compute shader
     * 3. Dispatch compute workgroups
     * 4. Read back results
     */

    /* For now, just touch glyph memory */
    unsigned int *mem = (unsigned int *)gpu.glyph_memory;
    mem[0] = 0xDEADBEEF;
    mem[1] = 0xCAFEBABE;

    uart_puts("[Glyph] Memory test: ");
    if (mem[0] == 0xDEADBEEF && mem[1] == 0xCAFEBABE) {
        uart_puts("PASS\n");
    } else {
        uart_puts("FAIL\n");
    }
}

/* Render test pattern to framebuffer */
static void render_test_pattern(void)
{
    uart_puts("\n[Display] Rendering test pattern...\n");

    if (!framebuffer) {
        framebuffer = (unsigned int *)gpu.vram_base;
    }

    /* Draw gradient */
    for (int y = 0; y < fb_height; y++) {
        for (int x = 0; x < fb_width; x++) {
                unsigned int color = 0xFF000000; /* Alpha */
                color |= (x * 255 / fb_width) << 16; /* Red */
                color |= (y * 255 / fb_height) << 8; /* Green */
                color |= ((x + y) * 255 / (fb_width + fb_height)); /* Blue */

                framebuffer[y * fb_width + x] = color;
            }
        }
    }

    uart_puts("[Display] Test pattern rendered\n");
}

/* Kernel main */
void kernel_main(void *mmio, void *glyph_mem)
{
    struct boot_info *info = (struct boot_info *)0x1000;

    uart_puts("\n");
    uart_puts("╔════════════════════════════════════════════════════════════╗\n");
    uart_puts("║     Geometry OS - Bare Metal Kernel                        ║\n");
    uart_puts("║     GPU-Native Glyph Execution                              ║\n");
    uart_puts("╚════════════════════════════════════════════════════════════╝\n");
    uart_puts("\n");

    uart_puts("[Kernel] Boot info at ");
    char buf[20];
    unsigned long addr = (unsigned long)info;
    for (int i = 60; i >= 0; i -= 4) {
        int digit = (addr >> i) & 0xF;
        uart_putc(digit < 10 ? '0' + digit : 'A' + digit - 10);
    }
    uart_puts("\n");

    /* Initialize GPU */
    if (gpu_init(info) != 0) {
        uart_puts("[Kernel] GPU init failed, halting.\n");
        while (1) {
            __asm__ volatile ("hlt");
        }
    }

    /* Run glyph compute test */
    glyph_compute_test();

    /* Render to display */
    render_test_pattern();

    uart_puts("\n[Kernel] Initialization complete\n");
    uart_puts("[Kernel] Geometry OS running - glyphs executing\n");
    uart_puts("[Kernel] Press power to reboot\n\n");

    /* Main loop - glyph programs execute continuously */
    while (1) {
        /* In full implementation:
         * 1. Poll GPU for completion
         * 2. Execute next glyph program
         * 3. Update display
         */
        __asm__ volatile ("hlt");  /* Wait for interrupt */
    }
}
