; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws two rectangles on the screen using the `RECTF` instruction. The first rectangle is drawn at coordinates (3242, 32) with dimensions (32, 1345) and color 0x9F75B7, while the second rectangle is drawn at coordinates (26, 0) with dimensions (490, 3841) and color 0xD056E9. The program halts after executing these drawing commands.

; simple draw program
; initialization
  LDI r8, 64
  LDI r3, 2961
  LDI r26, 2
  LDI r15, 0
  LDI r5, 2027
  LDI r13, 0x7372AA
  LDI r3, 1897
  LDI r14, 3803
  LDI r7, 0xD056E9
  PSET r3, r14, r7
  LDI r0, 0
  LDI r24, 32
  LDI r2, 490
  LDI r4, 0x9F75B7
  LDI r8, 4087
  RECTF r0, r24, r2, r4, r8
  LDI r26, 256
  LDI r0, 3242
  LDI r8, 32
  LDI r7, 3841
  LDI r2, 1345
  RECTF r26, r0, r8, r7, r2
  HALT
