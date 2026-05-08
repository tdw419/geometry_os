; DESCRIPTION: This GeOS assembly code performs a series of mathematical operations including initialization of registers, bitwise operations (OR, AND, XOR), shifts (SHL, SHLI, SAR, SHR), arithmetic operations (ADDI, SUBI, MUL), and comparisons (CMPI). The code concludes with halting the system.

; math computation
; initialization
  LDI r11, 2
  LDI r2, 10
  LDI r15, 1033
  OR r5, r10, r14
  OR r7, r4, r0
  AND r12, r8, r11
  SHL r7, r8, r15
  XOR r10, r5, r15
  OR r9, r15, r30
  SUBI r25, r15, 0x7606F2
  SHL r4, r7, r24
  SUBI r9, r6, 32
  MUL r13, r2, r14
  SUBI r12, r5, 126
  ADDI r7, r11, 4
  SHLI r10, r9, 8
  SHLI r9, r4, 0x70ACCF
  SAR r8, r13, r1
  SHR r14, r13, r1
  SHL r6, r15, r10
  SHL r6, r3, r5
  CMPI r5, r9, 0xB48603
  XOR r4, r3, r1
  AND r15, r14, r3
  XOR r0, r4, r11
  OR r5, r2, r6
  XOR r9, r11, r4
  XOR r13, r9, r11
  SHR r4, r10, r11
  HALT
