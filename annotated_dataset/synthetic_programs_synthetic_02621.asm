; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `LINE` function to draw a line on the screen. After that, it uses the `RECTF` function to fill a rectangle and finally halts execution.

; simple draw program
; initialization
  LDI r5, 4
  LDI r12, 10
  LDI r1, 2851
  LDI r9, 0x62B96C
  LDI r3, 0xB08561
  LDI r0, 64
  LDI r13, 3251
  LDI r0, 10
  LDI r7, 0x9A59B4
  LDI r10, 2291
  LDI r5, 0x59F4F3
  LDI r12, 0xD772BD
  LINE r0, r7, r10, r5, r12
  LDI r4, 0
  LDI r2, 658
  LDI r2, 2066
  LDI r10, 128
  LDI r15, 2
  RECTF r4, r2, r2, r10, r15
  HALT
