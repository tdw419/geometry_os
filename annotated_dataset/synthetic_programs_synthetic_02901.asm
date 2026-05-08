; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a circle using the `CIRCLE` instruction. The program halts execution afterward.

; simple draw program
; initialization
  LDI r14, 0x0BC1E2
  LDI r15, 3483
  LDI r4, 16
  LDI r1, 0xB351F3
  LDI r0, 1414
  LDI r3, 1
  LDI r6, 0x61FE2F
  LDI r7, 2697
  CIRCLE r0, r3, r6, r7
  HALT
