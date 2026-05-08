; DESCRIPTION: This GeOS assembly code performs a series of arithmetic and logical operations on registers to compute a mathematical result. It includes initialization of several registers with specific values, followed by a sequence of addition, subtraction, bitwise operations (AND, XOR, OR), shifts (SHL, SHR, SAR), division, comparison, and finally halts execution.

; math computation
; initialization
  LDI r13, 128
  LDI r5, 3473
  LDI r3, 2124
  LDI r4, 2991
  LDI r2, 1
  LDI r16, 0x251E6D
  ADDI r20, r1, 4
  SUBI r15, r3, 104
  SUBI r13, r0, 0x9ABA02
  AND r14, r11, r1
  XOR r6, r2, r14
  OR r0, r7, r2
  SHLI r12, r10, 0x12F62C
  SHR r4, r8, r0
  SAR r11, r9, r16
  SUBI r8, r2, 4
  SAR r13, r29, r8
  SHLI r7, r10, 2
  SHLI r0, r8, 0xF7AA82
  SAR r0, r11, r6
  AND r4, r13, r2
  DIV r3, r6, r12
  SUBI r19, r8, 64
  CMPI r7, r9, 256
  ANDI r8, r7, 64
  SAR r2, r15, r7
  SHR r15, r12, r6
  SHR r11, r18, r4
  SAR r2, r10, r0
  ADD r2, r4, r3
  SHL r2, r9, r14
  SHLI r12, r6, 0xEFA352
  SAR r3, r1, r0
  HALT
