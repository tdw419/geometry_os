; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise OR operations on some registers, checks a key input against the value `4`, and conditionally executes different branches of code based on the comparison result. It prints the string "HELLO" to the display under certain conditions and halts execution afterward.

; mixed program
; initialization
  LDI r1, 0x7AAE6A
  LDI r3, 0xB5117C
  LDI r7, 256
  LDI r2, 1
  LDI r14, 3905
  LDI r27, 0x5E9B1A
  LDI r4, 0x3C9E68
  LDI r10, 0x137BEA
  OR r3, r24, r10
  OR r13, r11, r10
  IKEY r14
  CMPI r14, 4
  JNZ r14, key_0
  LDI r13, 1011
  LDI r23, 0xC5E2BB
  LDI r0, 0x828D54
  TEXT r13, r23, r0, "HELLO"
  XOR r12, r14, r6
  CMPI r2, 4
  LDI r7, 0xCA5BAD
  LDI r0, 2954
  LDI r13, 255
  TEXT r7, r0, r13, "HELLO"
  HALT
