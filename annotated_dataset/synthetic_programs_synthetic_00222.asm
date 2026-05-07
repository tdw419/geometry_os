; DESCRIPTION: This GeOS assembly code initializes several registers and then uses the `LINE` instruction to draw a line on the screen from coordinates (64, 256) to (1619, 2288). After drawing the line, it fills the area with a pattern defined by the value in register r13 and then halts execution.

; simple draw program
; initialization
  LDI r14, 16
  LDI r5, 32
  LDI r6, 0xE76ED8
  LDI r2, 1
  LDI r1, 64
  LDI r0, 256
  LDI r9, 1619
  LDI r11, 2288
  LINE r2, r1, r0, r9, r11
  LDI r13, 190
  FILL r13
  HALT
