OUTPUT_ARCH(riscv)
ENTRY(_start)
SECTIONS
{
    . = BASE_ADDR;
    .text : { *(.text.entry) *(.text .text.*) }
    .rodata : ALIGN(4) { *(.rodata .rodata.*) }
    .data : ALIGN(4) { *(.data .data.*) }
    .bss : ALIGN(4) { __bss_start = .; *(.bss .bss.*) *(COMMON) . = ALIGN(4); __bss_end = .; }
    /DISCARD/ : { *(.comment) *(.note.*) *(.note.gnu.build-id) *(.eh_frame*) }
}
