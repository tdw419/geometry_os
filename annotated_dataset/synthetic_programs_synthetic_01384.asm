; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including division, shift, subtraction, addition, bitwise AND, and comparison. The final operation is a halt instruction.

; math computation
; initialization
  LDI r13, 0xA8171A
  LDI r14, 397
  LDI r6, 3144
  LDI r26, 10
  LDI r5, 4
  LDI r23, 3363
  DIV r13, r6, r4
  SAR r4, r3, r11
  SHL r2, r10, r3
  SUBI r8, r4, 0xC8576F
  SUBI r7, r13, 0xB120CE
  AND r0, r2, r15
  ADDI r10, r18, 0x582412
  CMPI r1, r4, 215
  SHR r10, r20, r14
  SHL r3, r12, r27
  SHL r0, r9, r3
  SAR r10, r8, r14
  HALT
