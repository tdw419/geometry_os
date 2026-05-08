; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws the text "WORLD" at different positions on the screen. The program waits for a key press and checks if it is the '2' key; if so, it refreshes the frame and continues the loop.

; input driven program
; initialization
  LDI r4, 0x693C22
  LDI r2, 0x596D6C
  LDI r7, 0
  LDI r8, 146
  LDI r0, 0x93F616
  LDI r25, 0x7EE65E
main_0:
  LDI r6, 0x0DF885
  LDI r6, 744
  LDI r3, 3883
  DRAWTEXT r6, r6, r3, "WORLD"
  CMPI r7, 1
  LDI r15, 3739
  LDI r10, 8
  LDI r14, 3277
  DRAWTEXT r15, r10, r14, "WORLD"
  LDI r3, 0
  LDI r13, 0x71DF22
  LDI r11, 170
  DRAWTEXT r3, r13, r11, "WORLD"
  IKEY r14
  CMPI r14, 2
  JNZ r14, key_1
  FRAME
  JMP main_0
