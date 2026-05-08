; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. The loop performs bitwise operations on these registers, checks for keyboard input, and conditionally displays the text "HELLO" in a frame if certain conditions are met.

; drawing loop program
; initialization
  LDI r15, 0x4E3640
  LDI r0, 0x052286
  LDI r3, 64
  LDI r5, 1189
  LDI r14, 961
  LDI r9, 4
main_0:
  XOR r5, r1, r15
  OR r4, r3, r15
  AND r2, r1, r5
  XOR r11, r2, r14
  CMPI r14, r5, 29
  IKEY r12
  CMPI r12, 0xD80F5F
  JNZ r12, key_1
  IKEY r8
  CMPI r8, 1
  JNZ r8, key_2
  DIV r1, r9, r11
  LDI r10, 2175
  LDI r0, 64
  LDI r1, 255
  TEXT r10, r0, r1, "HELLO"
  FRAME
  JMP main_0
