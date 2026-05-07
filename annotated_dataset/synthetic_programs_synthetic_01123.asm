; DESCRIPTION: This GeOS assembly code initializes several registers and repeatedly draws a circle on the screen using the `CIRCLE` instruction. The loop continues indefinitely due to the unconditional jump back to `main_0`.

; input driven program
; initialization
  LDI r6, 128
  LDI r11, 255
  LDI r13, 2
  LDI r9, 3881
  LDI r1, 3875
main_0:
  SUBI r4, r13, 0
  LDI r8, 0x1720A2
  LDI r7, 0x2EFBF6
  LDI r12, 128
  LDI r13, 0x4C2CFA
  CIRCLE r8, r7, r12, r13
  FRAME
  JMP main_0
