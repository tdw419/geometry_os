; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a loop where it repeatedly draws the text "HELLO" at two different positions on the screen. It checks for a key press; if '1' is pressed, it executes a subtraction operation and calls the FRAME routine before continuing the loop.

; drawing loop program
; initialization
  LDI r8, 0x857DF4
  LDI r0, 0x83C2E1
  LDI r12, 4
  LDI r9, 2
  LDI r15, 0
  LDI r1, 0x45388B
main_0:
  LDI r0, 0xDD8325
  LDI r8, 2141
  LDI r12, 10
  TEXT r0, r8, r12, "HELLO"
  LDI r14, 0x5A1D94
  LDI r7, 2701
  LDI r11, 8
  TEXT r14, r7, r11, "HELLO"
  CMPI r2, 0xA7C04A
  IKEY r3
  CMPI r3, 1
  JNZ r3, key_1
  SUB r6, r20, r13
  FRAME
  JMP main_0
