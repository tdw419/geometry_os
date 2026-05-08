; DESCRIPTION: This GeOS assembly code performs a series of bitwise and arithmetic operations on registers to compute mathematical expressions. It initializes multiple registers with specific values and then executes operations such as shifts, logical AND/OR/XOR, addition, and comparisons to derive the final result.

; math computation
; initialization
  LDI r0, 0xFF867F
  LDI r13, 0xE07FD0
  LDI r26, 0xB6E06F
  LDI r8, 196
  LDI r11, 0
  SHL r10, r12, r16
  SHR r3, r0, r10
  SAR r12, r9, r15
  SHLI r2, r15, 4
  AND r10, r8, r28
  OR r3, r5, r9
  OR r8, r4, r15
  OR r4, r3, r9
  OR r7, r0, r1
  OR r6, r4, r9
  ADD r6, r10, r8
  OR r7, r30, r13
  OR r14, r9, r13
  XOR r12, r3, r2
  AND r11, r9, r5
  SHR r12, r1, r14
  SHR r9, r6, r13
  CMPI r4, r14, 0x117527
  SAR r15, r10, r5
  SHLI r13, r14, 7
  SHL r7, r6, r13
  XOR r12, r10, r2
  OR r15, r4, r5
  OR r14, r10, r2
  ANDI r5, r2, 75
  SAR r0, r4, r5
  SHL r14, r10, r0
  ADDI r1, r12, 135
  AND r3, r4, r7
  XOR r0, r6, r7
  AND r7, r1, r3
  XOR r6, r12, r11
  ADDI r10, r7, 3
  HALT
