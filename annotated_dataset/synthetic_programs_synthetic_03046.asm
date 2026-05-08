; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a line using the `LINE` instruction. The program halts after drawing the line.

; simple draw program
; initialization
  LDI r0, 404
  LDI r6, 3369
  LDI r14, 212
  LDI r2, 0xD5BD8F
  LDI r10, 255
  LDI r15, 32
  LDI r9, 32
  LDI r5, 10
  LDI r15, 2249
  LINE r10, r15, r9, r5, r15
  HALT
