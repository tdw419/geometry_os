; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for keyboard input to perform geometric operations. If the input key is '2', it draws a rectangle using the `RECTF` instruction; if the input key is '16', it fills the screen with a pattern using the `FILL` instruction, then displays a frame around it before looping back to wait for further input.

; input driven program
; initialization
  LDI r14, 256
  LDI r30, 2861
  LDI r9, 1643
  LDI r12, 0xBB1260
  LDI r2, 1442
  LDI r6, 899
main_0:
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_1
  LDI r13, 0x9DAB23
  LDI r10, 0x2E92BB
  LDI r6, 0xFC57B7
  LDI r15, 0
  LDI r4, 1329
  RECTF r13, r10, r6, r15, r4
  IKEY r8
  CMPI r8, 16
  JNZ r8, key_2
  LDI r4, 1266
  FILL r4
  FRAME
  JMP main_0
