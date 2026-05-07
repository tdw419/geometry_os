; DESCRIPTION: This GeOS assembly code performs a series of bitwise operations, arithmetic computations (including multiplication and division), and conditional checks. It initializes registers with specific values, manipulates them through shifts, logical operations, and arithmetic, and finally halts execution.

; math computation
; initialization
  LDI r15, 8
  LDI r11, 3409
  SHL r6, r5, r13
  SHR r15, r1, r3
  SHLI r13, r10, 3
  SAR r10, r4, r13
  CMPI r4, r9, 8
  XOR r13, r4, r10
  AND r3, r4, r13
  ADDI r8, r10, 87
  MUL r2, r13, r11
  AND r0, r15, r2
  XOR r6, r8, r9
  OR r2, r0, r1
  XOR r11, r7, r13
  XOR r1, r10, r9
  OR r0, r10, r4
  SHL r13, r8, r9
  SHLI r7, r14, 5
  SAR r5, r7, r28
  SHLI r12, r7, 16
  MUL r5, r13, r6
  XOR r14, r12, r11
  XOR r14, r3, r4
  OR r5, r4, r3
  SHL r3, r5, r15
  DIV r5, r3, r13
  ANDI r12, r3, 87
  HALT
