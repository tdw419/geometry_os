; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and enters a loop where it repeatedly draws a rectangle using the `RECTF` instruction. The loop also performs a bitwise XOR operation on registers and updates the frame.

; input driven program
; initialization
  LDI r15, 255
  LDI r6, 4
  LDI r3, 128
  LDI r4, 0x525A20
  LDI r0, 0x3E0F7F
  LDI r13, 2
  LDI r8, 3044
  LDI r11, 3888
main_0:
  LDI r14, 0x4F2219
  LDI r12, 0
  LDI r26, 0x46B16B
  LDI r4, 0x25656E
  LDI r8, 0x22073C
  RECTF r14, r12, r26, r4, r8
  XOR r0, r15, r12
  FRAME
  JMP main_0
