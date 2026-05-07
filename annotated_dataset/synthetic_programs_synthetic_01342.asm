; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses those values to draw two circles on the screen using the `CIRCLE` instruction. The first circle is drawn at position (1120, 255) with a radius of 4 and color 0x012D1B, while the second circle is drawn at position (0x918242, 267) with a radius of 3 and color 0xB5DAF3. The program halts after drawing the circles.

; simple draw program
; initialization
  LDI r9, 0x14C0AF
  LDI r26, 3851
  LDI r12, 4
  LDI r7, 3828
  LDI r5, 64
  LDI r8, 4
  LDI r11, 0x0FC943
  LDI r7, 128
  LDI r4, 0x3AC014
  LDI r3, 672
  PSETI
  LDI r12, 1120
  LDI r15, 255
  LDI r29, 0x012D1B
  LDI r14, 256
  CIRCLE r12, r15, r29, r14
  LDI r0, 0x918242
  LDI r8, 267
  LDI r14, 0xB5DAF3
  LDI r3, 4
  CIRCLE r0, r8, r14, r3
  HALT
