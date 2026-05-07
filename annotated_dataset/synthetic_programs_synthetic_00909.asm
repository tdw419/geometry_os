; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws the text "WORLD" at a calculated position, then waits for user input. If the input matches a specific value (16), it draws "HELLO" and refreshes the frame before repeating the loop.

; input driven program
; initialization
  LDI r6, 0xF0BC7D
  LDI r13, 1525
  LDI r15, 256
main_0:
  LDI r15, 2
  LDI r0, 0xB03662
  LDI r4, 255
  DRAWTEXT r15, r0, r4, "WORLD"
  SHL r14, r0, r10
  SHL r1, r0, r4
  SHLI r10, r15, 8
  SHR r15, r5, r1
  CMPI r7, 0x0371D7
  LDI r11, 255
  LDI r20, 0x8DA2F3
  LDI r14, 16
  TEXT r11, r20, r14, "HELLO"
  IKEY r11
  CMPI r11, 16
  JNZ r11, key_1
  FRAME
  JMP main_0
