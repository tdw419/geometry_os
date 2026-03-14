/*
 * Geometry OS Kernel Linker Script
 *
 * Load kernel at 1MB (0x100000), above UEFI bootloader
 */

OUTPUT_FORMAT(elf64-x86-64)
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)

SECTIONS
{
    /* Load at 1MB */
    . = 0x100000;

    /* Code section */
    .text : ALIGN(4K)
    {
        *(.text)
        *(.text.*)
    }

    /* Read-only data */
    .rodata : ALIGN(4K)
    {
        *(.rodata)
        *(.rodata.*)
    }

    /* Read-write data */
    .data : ALIGN(4K)
    {
        *(.data)
        *(.data.*)
    }

    /* BSS (uninitialized data) */
    .bss : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
        *(.bss.*)
    }

    /* Discard unwanted sections */
    /DISCARD/ :
    {
        *(.comment)
        *(.note.*)
        *(.eh_frame*)
    }
}
