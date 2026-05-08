; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including multiplication (`MUL`), shift operations (`SHL`, `SHRI`, `SAR`), subtraction (`SUBI`), logical operations (`OR`, `AND`, `XOR`), and modular operation (`MOD`). The code concludes with a halt instruction.

; math computation
; initialization
  LDI r8, 563
  LDI r3, 0x14523E
  LDI r15, 1432
  LDI r7, 0x9D28BE
  LDI r5, 0x40D02C
  LDI r14, 10
  LDI r6, 0x087518
  MUL r11, r10, r1
  SHR r18, r9, r10
  SUBI r7, r3, 0x88F509
  SHL r8, r14, r1
  SHL r9, r3, r10
  SAR r4, r1, r27
  SHLI r3, r4, 5
  OR r4, r6, r3
  OR r1, r7, r4
  AND r6, r7, r1
  XOR r4, r1, r30
  AND r8, r7, r14
  AND r4, r15, r1
  OR r1, r8, r3
  OR r6, r8, r15
  SHL r7, r3, r10
  SHR r7, r13, r17
  SHLI r12, r3, 0
  SAR r2, r3, r10
  SHL r0, r10, r8
  XOR r21, r14, r11
  OR r7, r3, r0
  AND r10, r6, r12
  OR r11, r13, r3
  MUL r5, r2, r12
  OR r7, r14, r10
  OR r9, r15, r13
  SHR r2, r5, r12
  SHLI r12, r4, 10
  XOR r12, r3, r8
  MOD r10, r15, r6
  SUBI r11, r2, 255
  AND r12, r4, r0
  SAR r15, r12, r13
  SHLI r15, r2, 1
  HALT
