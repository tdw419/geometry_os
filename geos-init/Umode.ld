OUTPUT_ARCH( "riscv" )
OUTPUT_FORMAT( "elf32-littleriscv" )
ENTRY( _start )

MEMORY
{
  /* xv6 user-space RAM — starts at page 0, stack grows up from USERSTACK*PGSIZE */
  RAM (rw)       : ORIGIN = 0x0,      LENGTH = 64M

  /* Verified framebuffer MMIO range — pixel buffer (256KB) + control regs (to 5MB) */
  FRAMEBUFFER (rw) : ORIGIN = 0x60000000, LENGTH = 0x500000
}

PHDRS
{
  text PT_LOAD FLAGS(5);    /* R+X */
  data PT_LOAD FLAGS(6);    /* R+W */
}

SECTIONS
{
  /* ================================================================
   *  TEXT — read+execute, page-aligned for xv6 exec() loader
   * ================================================================ */
  .text : ALIGN(0x1000)
  {
    *(.text .text.*)
  } > RAM : text

  /* ================================================================
   *  RODATA — read-only data, merged with text segment
   * ================================================================ */
  .rodata : ALIGN(0x1000)
  {
    *(.srodata .srodata.*)
    *(.rodata .rodata.*)
  } > RAM : text

  /* ================================================================
   *  DATA — read-write data
   * ================================================================ */
  .data : ALIGN(0x1000)
  {
    *(.sdata .sdata.*)
    *(.data .data.*)
  } > RAM : data

  /* ================================================================
   *  BSS — zero-initialised
   * ================================================================ */
  .bss : ALIGN(0x1000)
  {
    *(.sbss .sbss.*)
    *(.bss .bss.*)
  } > RAM : data

  /* ================================================================
   *  End-of-binary marker
   * ================================================================ */
  PROVIDE( __bss_end = . );
  PROVIDE( _end = . );

  /* ================================================================
   *  Framebuffer linker symbols
   *
   *  Rust code references these as:
   *    extern "C" { static __fb_base: u8; }
   *    let fb = &__fb_base as *const u8 as usize;
   *
   *  The symbol's ADDRESS *is* the value — linker absolute symbols
   *  don't occupy storage.
   * ================================================================ */
  __fb_base       = ORIGIN(FRAMEBUFFER);
  __fb_end        = ORIGIN(FRAMEBUFFER) + LENGTH(FRAMEBUFFER);
  __fb_size       = LENGTH(FRAMEBUFFER);

  /* Pixel buffer is the first 256 KB of the FB region (GeOS emulator layout). */
  __fb_pixels     = ORIGIN(FRAMEBUFFER);
  __fb_pixels_end = ORIGIN(FRAMEBUFFER) + 0x40000;

  /* Control register follows the pixel buffer (at offset 0x40000, NOT 0x400000).
     GeOS emulator: FB_TOTAL_SIZE = 256KB + 8 bytes.
     Control reg at FB_BASE + FB_PIXEL_SIZE = 0x60000000 + 0x40000 = 0x60040000. */
  __fb_control    = ORIGIN(FRAMEBUFFER) + 0x40000;
  __fb_control_end = ORIGIN(FRAMEBUFFER) + 0x40008;

  /* Stabs-in-debuginfo sections (discard) */
  /DISCARD/ : {
    *(.eh_frame .eh_frame.*)
  }
}
