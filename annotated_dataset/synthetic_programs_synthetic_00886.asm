; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and performs a series of bitwise operations including XOR, AND, OR, SHL, SHR, SAR, ADD, SUBI, CMPI, and ADDI. The code also includes conditional comparisons and halts execution at the end.

; math computation
; initialization
  LDI r4, 8
  LDI r14, 64
  LDI r9, 32
  LDI r13, 128
  LDI r8, 0xF80291
  XOR r15, r9, r1
  AND r15, r8, r13
  OR r12, r2, r4
  OR r12, r13, r25
  XOR r12, r0, r9
  OR r8, r19, r25
  XOR r13, r6, r14
  OR r4, r11, r5
  SHR r2, r9, r13
  SHR r11, r12, r6
  SHL r6, r15, r9
  SAR r6, r2, r11
  ADD r6, r2, r15
  CMPI r8, r0, 64
  AND r14, r8, r6
  XOR r1, r7, r6
  XOR r8, r31, r9
  AND r14, r2, r8
  CMPI r13, r0, 128
  ADDI r6, r8, 30
  SAR r13, r11, r5
  SHLI r2, r8, 7
  ANDI r6, r1, 2
  SUBI r12, r17, 64
  XOR r10, r3, r7
  OR r4, r13, r1
  HALT
