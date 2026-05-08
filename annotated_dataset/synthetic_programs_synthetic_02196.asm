; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations, division, and comparison. The loop decrements register `r8` until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r5, 2514
  LDI r3, 0xD4EAB3
  LDI r2, 8
  LDI r4, 544
  LDI r10, 16
  LDI r13, 0xDC93CE
  LDI r0, 0x43EBA6
  LDI r8, 40
loop_0:
  AND r14, r9, r10
  DIV r6, r1, r13
  CMPI r12, r10, 0x98A7A7
  LDI r14, 1
  SUB r8, r8, r14
  JNZ r8, loop_0
  HALT
