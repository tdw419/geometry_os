; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a line using the `LINE` instruction followed by a circle using the `CIRCLE` instruction. Finally, it halts execution.

; simple draw program
; initialization
  LDI r14, 0xBC58B9
  LDI r5, 64
  LDI r8, 0
  LDI r2, 3393
  LDI r0, 255
  LDI r7, 255
  LDI r1, 0x81547D
  LDI r4, 763
  LDI r6, 937
  LINE r0, r7, r1, r4, r6
  LDI r4, 32
  LDI r6, 0x10199E
  LDI r2, 64
  LDI r13, 2424
  CIRCLE r4, r6, r2, r13
  HALT
