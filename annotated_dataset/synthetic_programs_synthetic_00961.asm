; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws two circles on the screen using the `CIRCLE` instruction. It also sets a single pixel using the `PSET` instruction before halting execution. The first circle is drawn at coordinates (0x6D9F58, 0xE15651) with a radius of 0x84FF81 and color 0xEFAA31. The second circle is drawn at (8, 255) with a radius of 128 and color 0x1137F3. A pixel is set at coordinates (4, 10) with color 0xC96D92.

; simple draw program
; initialization
  LDI r6, 0x8ECE8C
  LDI r10, 3792
  LDI r25, 0x292F37
  LDI r12, 0x6D9F58
  LDI r13, 0xE15651
  LDI r15, 0x84FF81
  LDI r1, 0xEFAA31
  CIRCLE r12, r13, r15, r1
  LDI r11, 8
  LDI r14, 255
  LDI r13, 0x1137F3
  LDI r14, 128
  CIRCLE r11, r14, r13, r14
  LDI r14, 4
  LDI r17, 10
  LDI r1, 0xC96D92
  PSET r14, r17, r1
  HALT
