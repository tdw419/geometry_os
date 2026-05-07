; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, draws a line using the `LINE` instruction, and fills the screen with a color using the `FILL` instruction before halting execution.

; simple draw program
; initialization
  LDI r1, 255
  LDI r3, 0x177EC6
  LDI r4, 10
  LDI r8, 10
  LDI r12, 16
  LDI r15, 1366
  LDI r21, 0xF72128
  LDI r14, 0xC26EB1
  LDI r4, 16
  LDI r2, 0xA0E3CB
  LDI r7, 2771
  LDI r3, 3947
  LDI r12, 0x1BF017
  LINE r4, r2, r7, r3, r12
  LDI r5, 32
  FILL r5
  HALT
