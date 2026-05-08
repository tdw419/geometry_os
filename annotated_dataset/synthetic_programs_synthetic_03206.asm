; DESCRIPTION: This GeOS assembly code initializes several registers and then uses them to draw a line on the screen with the `LINE` instruction, followed by filling a rectangular area with two different colors using the `FILL` instruction. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r5, 0
  LDI r19, 2
  LDI r1, 953
  LDI r26, 8
  LDI r15, 255
  LDI r0, 0xEBC124
  LDI r7, 0x9D364C
  LDI r0, 2990
  LDI r2, 10
  LDI r1, 278
  LDI r8, 1507
  LINE r7, r0, r2, r1, r8
  LDI r8, 0x967759
  FILL r8
  LDI r30, 16
  FILL r30
  HALT
