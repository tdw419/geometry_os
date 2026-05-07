; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of drawing operations. It first draws a pixel at coordinates (743, 3720) with color 0x506B9B, then fills a rectangle starting from coordinates (4010, 128) with dimensions 32x128 using color 0xE1E2D4. Finally, it halts the program.

; simple draw program
; initialization
  LDI r2, 16
  LDI r8, 1
  LDI r1, 743
  LDI r9, 3720
  LDI r19, 1685
  LDI r13, 0x506B9B
  LDI r5, 0
  LDI r2, 0x349CDE
  LDI r5, 1580
  WPIXEL
  LDI r0, 0x177DC6
  LDI r8, 4010
  LDI r4, 32
  LDI r12, 0xE1E2D4
  LDI r9, 128
  RECTF r0, r8, r4, r12, r9
  HALT
