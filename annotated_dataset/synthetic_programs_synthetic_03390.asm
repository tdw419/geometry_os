; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs bitwise operations including AND and XOR, shifts bits left (SHLI) and right (SHR), adds registers, compares a value to determine if it is less than or equal to 21, and finally halts the program. The code appears to be performing complex mathematical computations involving multiple register manipulations.

; math computation
; initialization
  LDI r1, 0
  LDI r0, 0x826177
  LDI r15, 1814
  LDI r14, 3519
  AND r4, r3, r12
  AND r12, r0, r29
  AND r5, r2, r4
  XOR r11, r2, r29
  SHLI r1, r6, 0x2A2A34
  SHL r2, r25, r5
  ADD r7, r4, r3
  CMPI r8, r7, 21
  AND r31, r13, r6
  SHL r3, r8, r0
  SHR r14, r12, r10
  SHR r9, r12, r14
  ADD r0, r11, r5
  SHLI r10, r7, 0
  SHLI r9, r15, 0x5F58BD
  SAR r13, r14, r4
  SHR r4, r6, r1
  SHLI r0, r4, 3
  SHR r1, r13, r6
  HALT
