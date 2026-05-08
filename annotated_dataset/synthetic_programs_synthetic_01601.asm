; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a counted animation loop. The first loop (`loop_0`) repeatedly draws rectangles while decrementing a counter (`r7`), and the second loop (`loop_1`) performs bitwise operations and decrements another counter (`r17`). The program halts after completing both loops.

; counted animation
; initialization
  LDI r3, 3171
  LDI r8, 64
  LDI r1, 3384
  LDI r13, 4000
  LDI r12, 0
  LDI r2, 0xE81950
  LDI r6, 128
  LDI r7, 256
loop_0:
  LDI r0, 1
  LDI r13, 380
  LDI r9, 0x440956
  LDI r2, 2220
  LDI r15, 0x646E4E
  RECTF r0, r13, r9, r2, r15
  LDI r0, 1
  SUB r7, r7, r0
  JNZ r7, loop_0
  LDI r17, 256
loop_1:
  CMPI r2, r9, 0xDB3C22
  SHR r6, r8, r9
  LDI r13, 1
  SUB r17, r17, r13
  JNZ r17, loop_1
  HALT
