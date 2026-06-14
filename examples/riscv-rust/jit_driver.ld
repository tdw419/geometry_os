/* Linker script for JIT-injected drivers.
   Entry at 0x80080000 (the JIT arena in guest RAM).
   The host extracts the .text segment and injects it at this address.
   The guest calls it as a bare function: fn() -> i32
*/

MEMORY {
    RAM (rwx) : ORIGIN = 0x80080000, LENGTH = 0x10000  /* 64KB arena */
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
        *(.ARM.attributes)
    }
}
