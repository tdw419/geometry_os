; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it displays the text "HELLO" at specific memory addresses. It waits for a key press and, if the key is 'a' (ASCII value 172), it changes the display position and repeats the message before entering an infinite loop with a frame update.

; input driven program
; initialization
  LDI r12, 256
  LDI r21, 0x53E6F9
  LDI r6, 0xEAA206
main_0:
  CMPI r14, 0x56C419
  LDI r12, 64
  LDI r1, 1
  LDI r15, 3830
  TEXT r12, r1, r15, "HELLO"
  IKEY r9
  CMPI r9, 172
  JNZ r9, key_1
  LDI r8, 856
  LDI r13, 0x09A701
  LDI r8, 3851
  TEXT r8, r13, r8, "HELLO"
  FRAME
  JMP main_0
