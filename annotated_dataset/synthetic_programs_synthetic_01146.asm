; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs bitwise operations including AND, XOR, and shifts (SHL, SHLI), conducts arithmetic operations such as subtraction (SUBI) and multiplication (MUL), and finally halts execution. The code appears to be performing complex mathematical computations involving bit manipulation and arithmetic on multiple registers.

; math computation
; initialization
  LDI r0, 10
  LDI r15, 1
  LDI r1, 16
  LDI r13, 694
  LDI r10, 256
  LDI r8, 2
  AND r21, r2, r8
  XOR r13, r8, r7
  XOR r15, r9, r22
  SHL r2, r14, r10
  SHLI r5, r3, 0xE91C16
  SHL r13, r3, r14
  SHLI r7, r2, 255
  SHLI r5, r6, 4
  SHLI r29, r8, 0
  SUBI r13, r0, 203
  MUL r1, r0, r3
  SHL r8, r5, r12
  SHL r28, r12, r0
  ADDI r25, r0, 4
  SHL r14, r13, r9
  AND r5, r0, r2
  AND r9, r0, r2
  AND r3, r13, r14
  XOR r14, r2, r13
  SUBI r14, r3, 0x7FE424
  SHL r4, r10, r28
  ANDI r7, r3, 41
  HALT
