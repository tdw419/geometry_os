; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters two nested loops. The outer loop decrements a counter `r12` until it reaches zero, filling memory locations with a value from register `r5`. The inner loop performs arithmetic operations involving multiple registers, including subtracting, comparing, bitwise AND, and dividing, before decrementing another counter `r20` until it also reaches zero. The program halts after the loops complete.

; counted animation
; initialization
  LDI r15, 0xBB7281
  LDI r10, 0x742C03
  LDI r0, 1749
  LDI r9, 1384
  LDI r11, 3880
  LDI r8, 2419
  LDI r12, 32
loop_0:
  LDI r5, 128
  FILL r5
  LDI r10, 1
  SUB r12, r12, r10
  JNZ r12, loop_0
  LDI r20, 64
loop_1:
  SUB r15, r3, r1
  CMPI r14, r6, 0x0736AB
  ANDI r7, r5, 0x626D04
  DIV r14, r6, r10
  LDI r0, 1
  SUB r20, r20, r0
  JNZ r20, loop_1
  HALT
