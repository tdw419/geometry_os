/*
 * Geometry OS Bare Metal Kernel
 *
 * Phase 4: Native GPU execution without Linux
 * - Direct GPU MMIO access
 * - Glyph substrate as memory
 * - No OS abstraction layer
 */

.global _start

.section .text
.code64

/* Boot info from UEFI */
struct boot_info {
    .quad magic           /* 0x47454F535F52 ("GEOSR") */
    .quad gpu_mmio_base
    .quad gpu_mmio_size
    .quad vram_base
    .quad vram_size
    .quad glyph_memory_base
    .quad glyph_memory_size
    .long gpu_vendor_id
    .long gpu_device_id
    .long num_compute_units
    .byte reserved[52]
}

_start:
    /* x86_64 entry from UEFI */
    cli                 /* Clear interrupts */

    /* Save boot info pointer */
    mov %rdi, boot_info_ptr
    mov boot_info, %rdi

    /* Set up kernel stack */
    mov $stack_end, %rsp
    xor %rbp, %rbp

    /* Initialize GDT */
    lgdt gdt_descriptor(%rip)

    /* Initialize IDT */
    lidt idt_descriptor(%rip)

    /* Jump to higher half kernel */
    movabs $kernel_main, %rax
    jmp *%rax

/* GDT for long mode */
.align 16
gdt_start:
    .quad 0x0000000000000000    /* Null descriptor */
    .quad 0x00A09A000000FFFF    /* Code segment */
    .quad 0x00C092000000FFFF    /* Data segment */
gdt_end:
gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .quad gdt_start

/* IDT */
idt_descriptor:
    .word 0
    .quad 0

.section .bss
.align 16
stack_end:
    .skip 65536

.section .rodata
kernel_name:
    .asciz "Geometry OS"
    .asciz "Phase 4: Bare Metal"
    .asciz "GPU-Native Execution"
