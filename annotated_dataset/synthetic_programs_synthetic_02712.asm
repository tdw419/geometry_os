; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a circle using the `CIRCLE` instruction. The program halts after completing the drawing operation.

; simple draw program
; initialization
  LDI r0, 3819
  LDI r13, 3141
  LDI r4, 10
  LDI r3, 107
  LDI r2, 64
  LDI r8, 16
  LDI r15, 0xD8368A
  LDI r6, 4
  LDI r15, 16
  LDI r15, 10
  LDI r6, 588
  CIRCLE r6, r15, r15, r6
  HALT
