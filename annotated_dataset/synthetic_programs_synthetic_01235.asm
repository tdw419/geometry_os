; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs drawing operations including drawing a circle using the `CIRCLE` instruction and a line using the `LINE` instruction. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r5, 32
  LDI r10, 762
  LDI r3, 3781
  LDI r15, 32
  LDI r12, 2122
  LDI r24, 0xF73F70
  LDI r14, 1563
  LDI r6, 1
  LDI r8, 255
  LDI r2, 32
  CIRCLE r14, r6, r8, r2
  LDI r5, 2
  LDI r4, 2823
  LDI r13, 0xE31666
  PSETI
  LDI r31, 343
  LDI r11, 807
  LDI r12, 259
  LDI r1, 4
  LDI r0, 10
  LINE r31, r11, r12, r1, r0
  HALT
