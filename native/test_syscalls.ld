OUTPUT_ARCH("riscv")
ENTRY(main)

SECTIONS
{
    . = 0x80200000;

    .text : {
        *(.text)
        *(.text.*)
    }

    .rodata : {
        *(.rodata)
        *(.rodata.*)
    }

    .data : {
        *(.data)
        *(.data.*)
        *(.sdata)
        *(.sdata.*)
    }

    .bss : {
        __bss_start = .;
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
        __bss_end = .;
    }

    . = ALIGN(4096);
    _stack_top = .;
    . += 0x4000;  /* 16KB stack */

    /DISCARD/ : {
        *(.riscv.attributes)
        *(.comment)
        *(.note.gnu.build-id)
    }
}