/*
 * Geometry OS Bare Metal Kernel Entry
 *
 * x86_64 entry point from UEFI bootloader
 */

.global _start
.global kernel_main

.section .text
.code64

_start:
    /* x86_64 entry from UEFI */
    /* RDI contains pointer to boot_info */
    cli                     /* Clear interrupts */

    /* Set up kernel stack (64KB) */
    leaq stack_end(%rip), %rsp
    xorq %rbp, %rbp

    /* Save boot info pointer */
    pushq %rdi

    /* Initialize GDT */
    lgdt gdt_descriptor(%rip)

    /* Initialize IDT (minimal) */
    lidt idt_descriptor(%rip)

    /* Enable SSE */
    movq %cr0, %rax
    andw $0xFFFB, %ax       /* Clear CR0.EM */
    orw $0x2, %ax           /* Set CR0.MP */
    movq %rax, %cr0
    movq %cr4, %rax
    orw $0x600, %ax         /* Set CR4.OSFXSR and CR4.OSXMMEXCPT */
    movq %rax, %cr4

    /* Restore boot info and call kernel */
    popq %rdi
    callq kernel_main

    /* If kernel returns, halt */
.halt:
    hlt
    jmp .halt

/* GDT for long mode */
.align 16
gdt_start:
    .quad 0x0000000000000000    /* Null descriptor */
    .quad 0x00AF9A000000FFFF    /* Code segment (64-bit) */
    .quad 0x00CF92000000FFFF    /* Data segment */
gdt_end:

gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .quad gdt_start

/* Minimal IDT */
idt_descriptor:
    .word 0
    .quad 0

.section .bss
.align 16
stack_bottom:
    .skip 65536               /* 64KB stack */
stack_end:

.section .rodata
kernel_banner:
    .asciz "Geometry OS - Bare Metal\n"
