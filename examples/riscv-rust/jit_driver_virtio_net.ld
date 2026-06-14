/* Linker script for JIT-injected VIRTIO_NET driver.
   Slot 3: 0x8008C000 (arena base + 3 * 0x4000)
*/
MEMORY {
    RAM (rwx) : ORIGIN = 0x8008C000, LENGTH = 0x4000  /* 16KB slot */
}

ENTRY(_jit_entry)

SECTIONS {
    .text : {
        *(.text.entry)
        *(.text .text.*)
    } > RAM

    .rodata : {
        *(.rodata .rodata.*)
    } > RAM

    .data : {
        *(.data .data.*)
    } > RAM

    .bss : {
        __bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        __bss_end = .;
    } > RAM

    /DISCARD/ : {
        *(.comment)
        *(.note.*)
        *(.eh_frame*)
    }
}
