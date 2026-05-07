; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it displays the text "HELLO" at a specified position on the screen and draws a circle. The program continuously updates the screen in this manner.

; input driven program
; initialization
  LDI r14, 2246
  LDI r8, 3254
  LDI r11, 128
  LDI r12, 4
  LDI r5, 1
  LDI r2, 934
  LDI r9, 1071
  LDI r4, 8
main_0:
  LDI r15, 32
  LDI r15, 0x8446F1
  LDI r11, 1929
  TEXT r15, r15, r11, "HELLO"
  LDI r6, 0x90B56A
  LDI r6, 3865
  LDI r12, 255
  LDI r12, 255
  CIRCLE r6, r6, r12, r12
  FRAME
  JMP main_0
