; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including addition, subtraction, bitwise operations (AND, OR, XOR), shifts, and comparisons. The code concludes by halting the execution.

; math computation
; initialization
  LDI r1, 0xD86E0E
  LDI r12, 0xDBE5E5
  LDI r2, 1
  LDI r6, 64
  LDI r14, 0x80A4E8
  LDI r15, 0
  LDI r7, 0x3BECD5
  LDI r8, 1246
  SUBI r0, r6, 1
  SHR r9, r14, r13
  OR r1, r0, r7
  OR r0, r11, r4
  AND r9, r6, r0
  OR r7, r1, r5
  ADDI r1, r25, 133
  ADDI r9, r8, 0x17D355
  AND r0, r15, r23
  OR r6, r13, r5
  OR r1, r12, r6
  ANDI r12, r1, 255
  XOR r4, r13, r10
  OR r5, r12, r8
  SHLI r13, r8, 1
  SHL r6, r3, r2
  CMPI r28, r8, 200
  ANDI r10, r6, 64
  AND r0, r3, r23
  XOR r15, r0, r2
  HALT
