; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it loads specific values into registers, prints "HELLO" to the screen, performs bitwise operations, and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r15, 0xF64F0B
  LDI r0, 0xDE4FEC
  LDI r5, 128
main_0:
  LDI r12, 255
  LDI r10, 0xBD5C88
  LDI r8, 10
  TEXT r12, r10, r8, "HELLO"
  CMPI r5, 232
  OR r0, r15, r8
  AND r14, r7, r4
  ANDI r5, r19, 78
  FRAME
  JMP main_0
