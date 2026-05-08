; DESCRIPTION: This GeOS assembly code performs a series of bitwise operations and arithmetic computations on multiple registers, including logical OR, XOR, AND, shift operations (left and right), addition, subtraction, and comparisons. It initializes several registers with specific values and then proceeds to manipulate these values through complex interdependent operations before halting execution.

; math computation
; initialization
  LDI r11, 0x62A264
  LDI r15, 3232
  LDI r7, 255
  OR r7, r11, r12
  XOR r5, r4, r14
  OR r0, r9, r5
  OR r0, r9, r15
  SHL r14, r8, r11
  SHR r9, r7, r4
  AND r6, r3, r15
  CMPI r13, r6, 4
  SUBI r4, r15, 4
  AND r14, r1, r0
  XOR r2, r9, r14
  SUB r4, r15, r14
  XOR r8, r7, r13
  OR r3, r15, r7
  AND r13, r9, r6
  XOR r11, r8, r20
  CMPI r11, r8, 152
  ADD r4, r5, r14
  SUB r12, r27, r7
  CMPI r9, r7, 180
  SAR r1, r6, r7
  SAR r7, r1, r2
  OR r11, r13, r27
  OR r10, r9, r15
  AND r15, r13, r12
  SHR r0, r2, r13
  SHR r11, r3, r5
  SHL r12, r10, r7
  SHL r3, r5, r15
  SAR r10, r0, r5
  SHLI r13, r2, 0xA7146E
  SHR r11, r2, r15
  AND r12, r0, r7
  XOR r4, r2, r1
  AND r8, r12, r9
  HALT
