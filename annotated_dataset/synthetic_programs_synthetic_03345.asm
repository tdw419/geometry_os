; DESCRIPTION: This GeOS assembly code initializes several registers and then draws a filled rectangle and a line on the display. It uses specific instructions to load values into registers and perform drawing operations like `RECTF` for filling rectangles and `LINE` for drawing lines, followed by a halt instruction to stop execution.

; simple draw program
; initialization
  LDI r0, 16
  LDI r5, 1
  LDI r1, 3603
  LDI r13, 4
  LDI r4, 128
  LDI r0, 2996
  LDI r9, 2809
  LDI r14, 1
  RECTF r13, r4, r0, r9, r14
  LDI r2, 0x6D2E63
  LDI r3, 0x3BAA6C
  LDI r15, 256
  WPIXEL
  LDI r1, 32
  LDI r7, 1
  LDI r3, 0xE1DB47
  LDI r15, 0xE4EF13
  LDI r3, 10
  LINE r1, r7, r3, r15, r3
  HALT
