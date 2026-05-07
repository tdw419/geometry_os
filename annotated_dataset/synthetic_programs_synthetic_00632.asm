; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses these to draw a line on the screen using the `LINE` instruction. The program sets up starting and ending coordinates for the line, along with its color and thickness, and finally halts execution.

; simple draw program
; initialization
  LDI r2, 2118
  LDI r13, 2550
  LDI r12, 2350
  LDI r11, 64
  LDI r0, 443
  LDI r10, 2404
  LDI r6, 0xB59503
  LDI r5, 2308
  LDI r11, 2613
  LDI r11, 1301
  LDI r12, 2658
  PSETI
  LDI r1, 1
  LDI r14, 579
  LDI r12, 1800
  LDI r2, 0xFA77FF
  LDI r11, 10
  LINE r1, r14, r12, r2, r11
  LDI r4, 10
  LDI r14, 1472
  LDI r3, 223
  PSETI
  HALT
