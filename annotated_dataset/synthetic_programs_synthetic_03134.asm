; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses the `CIRCLE` instruction to draw two circles on a display. The first circle is centered at (0,0) with a radius of 16 and color 0x091DE4, while the second circle is centered at (1293,527) with a radius of 16 and color 0xF68479. The program then halts execution.

; simple draw program
; initialization
  LDI r7, 10
  LDI r2, 0xB58C5B
  LDI r5, 8
  LDI r13, 0xF68479
  LDI r12, 32
  LDI r19, 0x091DE4
  LDI r9, 0
  LDI r12, 16
  LDI r3, 255
  CIRCLE r19, r9, r12, r3
  LDI r8, 1293
  LDI r14, 527
  LDI r11, 3980
  LDI r13, 16
  CIRCLE r8, r14, r11, r13
  HALT
