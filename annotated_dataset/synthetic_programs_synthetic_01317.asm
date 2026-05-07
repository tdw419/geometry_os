; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it waits for user input. If a specific key is pressed, it displays the text "HELLO" and then waits for another key press before repeating the process.

; input driven program
; initialization
  LDI r0, 8
  LDI r15, 10
  LDI r6, 1705
  LDI r26, 0x0ABD74
main_0:
  IKEY r1
  CMPI r1, 0
  JNZ r1, key_1
  LDI r6, 0xC390BA
  LDI r3, 4
  LDI r7, 0xFCA4D6
  TEXT r6, r3, r7, "HELLO"
  IKEY r14
  CMPI r14, 255
  JNZ r14, key_2
  FRAME
  JMP main_0
