; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a line using the `LINE` instruction. The program halts after drawing the line.

; simple draw program
; initialization
  LDI r8, 0x9B399D
  LDI r7, 8
  LDI r1, 4048
  LDI r2, 1753
  LDI r9, 0
  LDI r2, 0xFAC3BD
  LDI r4, 10
  LDI r9, 4
  LINE r2, r9, r2, r4, r9
  HALT
