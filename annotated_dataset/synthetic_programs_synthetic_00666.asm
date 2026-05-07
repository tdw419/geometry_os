; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a line using the `LINE` instruction. The program halts after executing the drawing command.

; simple draw program
; initialization
  LDI r1, 256
  LDI r13, 2
  LDI r8, 2187
  LDI r3, 0x7E192D
  LDI r15, 2224
  LDI r24, 0xA607D7
  LDI r15, 16
  LDI r8, 677
  LDI r8, 3555
  LDI r1, 32
  LINE r24, r15, r8, r8, r1
  HALT
