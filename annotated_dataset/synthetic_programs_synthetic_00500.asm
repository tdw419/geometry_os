; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a line and a rectangle on the screen using the `LINE` and `RECTF` functions. The program halts after completing the drawing operations.

; simple draw program
; initialization
  LDI r4, 64
  LDI r10, 64
  LDI r9, 0xC4E7CD
  LDI r8, 0x902B51
  LDI r11, 2
  LDI r2, 10
  LDI r11, 0x76C2AD
  LDI r12, 0x88E06B
  LDI r11, 0xCDAA24
  LINE r11, r2, r11, r12, r11
  LDI r5, 64
  LDI r13, 3148
  LDI r14, 128
  LDI r11, 266
  LDI r10, 3342
  RECTF r5, r13, r14, r11, r10
  HALT
