; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it waits for keyboard input. If the key 'C' (ASCII value 67) is pressed, it sets up a text message "HELLO" at a specific memory address and displays it within a frame. The program then continues to wait for further input.

; input driven program
; initialization
  LDI r7, 2
  LDI r9, 64
main_0:
  IKEY r12
  CMPI r12, 4
  JNZ r12, key_1
  CMPI r14, r13, 197
  LDI r14, 1517
  LDI r4, 0x5EF5ED
  LDI r13, 2
  TEXT r14, r4, r13, "HELLO"
  FRAME
  JMP main_0
