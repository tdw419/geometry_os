; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic operations such as addition and subtraction, compares register values, and applies bitwise logic operations including OR, AND, and shifts (SAR, SHR, SHL). The code ends with a HALT instruction.

; math computation
; initialization
  LDI r2, 10
  LDI r13, 3172
  LDI r14, 1647
  LDI r11, 0
  LDI r15, 1252
  LDI r1, 255
  ADD r24, r8, r7
  ADDI r15, r12, 46
  SUBI r25, r11, 0x0F6B47
  CMPI r15, r2, 104
  CMPI r2, r6, 9
  OR r1, r15, r12
  SAR r7, r15, r13
  SHR r11, r7, r13
  SUBI r10, r9, 1
  CMPI r1, r8, 219
  ADD r11, r3, r13
  OR r15, r1, r10
  OR r13, r6, r0
  OR r2, r10, r9
  AND r12, r0, r4
  CMPI r5, r1, 128
  SUBI r7, r2, 64
  SHL r3, r9, r13
  HALT
