; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a series of bitwise shift operations, arithmetic calculations (subtraction, addition), logical operations (AND, OR), and conditional comparisons. The code concludes by executing a halt instruction.

; math computation
; initialization
  LDI r13, 241
  LDI r3, 0xB036A4
  LDI r1, 2
  LDI r0, 255
  SHL r10, r2, r14
  SHL r14, r13, r11
  SHL r7, r6, r5
  SUB r7, r3, r14
  OR r3, r10, r0
  AND r11, r15, r7
  AND r8, r6, r11
  ADD r9, r12, r7
  SHLI r5, r4, 0x39C74C
  SHR r11, r1, r13
  ADDI r10, r9, 255
  AND r15, r7, r0
  OR r4, r8, r1
  AND r0, r11, r15
  SHLI r15, r16, 8
  SHL r6, r7, r4
  CMPI r8, r10, 156
  SHLI r2, r11, 5
  SHLI r7, r12, 0xB45655
  SHLI r2, r11, 0x5E456A
  ADD r6, r12, r10
  CMPI r26, r7, 77
  OR r13, r3, r12
  ADD r5, r7, r9
  HALT
