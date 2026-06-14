OUTPUT_ARCH( "riscv" )
ENTRY( _entry )

SECTIONS
{
    . = 0x80000000;

    .text : {
        *(.text .text.*)
        . = ALIGN(0x1000);
        PROVIDE(etext = .);
    }

    .rodata : {
        . = ALIGN(16);
        *(.srodata .srodata.*)
        . = ALIGN(16);
        *(.rodata .rodata.*)
    }

    .data : {
        . = ALIGN(16);
        *(.sdata .sdata.*)
        . = ALIGN(16);
        *(.data .data.*)
    }

    . = ALIGN(4096);
    _bss_start = .;
    .bss : {
        . = ALIGN(16);
        *(.sbss .sbss.*)
        . = ALIGN(16);
        *(.bss .bss.*)
        . = ALIGN(16);
        *(COMMON)
        . = ALIGN(4096);
        _bss_end = .;
    }

    /* Stack: 16KB at the end of BSS */
    . = ALIGN(4096);
    .stack : {
        . += 0x4000;  /* 16KB stack */
        _stack_top = .;
    }

    PROVIDE(end = .);
    PROVIDE(_end = .);
}
