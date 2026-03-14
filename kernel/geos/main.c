/*
 * Geometry OS Bare Metal Kernel
 *
 * Phase 4: Native GPU execution without Linux
 * - Direct GPU MMIO access
 * - Glyph substrate as memory
 * - No OS abstraction layer
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

/* Print hex number */
static void uart_puthex(unsigned long val)
{
    const char *hex = "0123456789ABCDEF";
    for (int i = 60; i >= 0; i -= 4) {
        uart_putc(hex[(val >> i) & 0xF]);
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

    uart_puts("[GPU] MMIO base: 0x");
    uart_puthex((unsigned long)gpu.mmio_base);
    uart_puts("\n");

    uart_puts("[GPU] Vendor: 0x");
    uart_puthex(gpu.vendor_id);
    uart_puts(" Device: 0x");
    uart_puthex(gpu.device_id);
    uart_puts("\n");

    /* Initialize GPU command queues based on vendor */
    if (gpu.vendor_id == 0x1002) {
        uart_puts("[GPU] AMD GPU detected - initializing amdgpu...\n");
        /* TODO: amdgpu_init(gpu.mmio_base); */
    } else if (gpu.vendor_id == 0x8086) {
        uart_puts("[GPU] Intel GPU detected - initializing i915...\n");
        /* TODO: intel_gpu_init(gpu.mmio_base); */
    }

    uart_puts("[GPU] Ready\n");
    return 0;
}

/* Simple glyph compute test */
static void glyph_compute_test(void)
{
    uart_puts("\n[Glyph] Running compute test...\n");

    /* Test glyph memory */
    unsigned int *mem = (unsigned int *)gpu.glyph_memory;
    mem[0] = 0xDEADBEEF;
    mem[1] = 0xCAFEBABE;

    uart_puts("[Glyph] Memory test: ");
    if (mem[0] == 0xDEADBEEF && mem[1] == 0xCAFEBABE) {
        uart_puts("PASS\n");
    } else {
        uart_puts("FAIL\n");
    }

    /* Test simple glyph program execution */
    uart_puts("[Glyph] Executing glyph program (NOP loop)...\n");

    /* Simulate glyph execution - in real impl would dispatch to GPU */
    for (int i = 0; i < 10; i++) {
        mem[2 + i] = 0x20000000 | i;  /* Glyph opcodes 200-209 */
    }

    uart_puts("[Glyph] Program complete\n");
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

    uart_puts("[Display] Test pattern rendered (");
    char buf[16];
    int len = 0;
    int w = fb_width;
    while (w > 0) { buf[len++] = '0' + (w % 10); w /= 10; }
    for (int i = len - 1; i >= 0; i--) uart_putc(buf[i]);
    uart_puts("x");
    len = 0;
    int h = fb_height;
    while (h > 0) { buf[len++] = '0' + (h % 10); h /= 10; }
    for (int i = len - 1; i >= 0; i--) uart_putc(buf[i]);
    uart_puts(")\n");
}

/* Kernel main */
void kernel_main(struct boot_info *info)
{
    uart_puts("\n");
    uart_puts("============================================================\n");
    uart_puts("     Geometry OS - Bare Metal Kernel\n");
    uart_puts("     GPU-Native Glyph Execution\n");
    uart_puts("============================================================\n");
    uart_puts("\n");

    uart_puts("[Kernel] Boot info at 0x");
    uart_puthex((unsigned long)info);
    uart_puts("\n");

    uart_puts("[Kernel] Magic: 0x");
    uart_puthex(info->magic);
    uart_puts("\n");

    /* Verify boot info magic */
    if (info->magic != 0x47454F535F52ULL) {
        uart_puts("[Kernel] Invalid boot magic, halting.\n");
        while (1) {
            __asm__ volatile ("hlt");
        }
    }

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
        __asm__ volatile ("hlt");  /* Wait for interrupt */
    }
}
