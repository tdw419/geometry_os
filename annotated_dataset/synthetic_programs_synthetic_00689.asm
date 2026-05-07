; DESCRIPTION: This GeOS assembly code performs a series of arithmetic and logical operations on registers to compute a result. It initializes several registers with specific values, then executes a sequence of shifts, additions, subtractions, comparisons, bitwise operations, and divisions to derive the final output.

; math computation
; initialization
  LDI r8, 2
  LDI r10, 3764
  LDI r3, 0xCF9F90
  LDI r6, 0x55B247
  SHR r8, r12, r15
  ADDI r13, r7, 2
  SUB r9, r8, r13
  SHLI r14, r0, 8
  SHL r6, r12, r4
  SHLI r10, r6, 1
  SHL r10, r11, r15
  CMPI r25, r9, 0xFE3DAC
  SHL r20, r4, r7
  OR r15, r16, r6
  AND r1, r0, r13
  XOR r1, r13, r15
  AND r8, r27, r15
  AND r5, r13, r10
  ADD r10, r8, r5
  SHL r3, r14, r10
  ADD r5, r0, r7
  SUBI r6, r0, 78
  DIV r0, r10, r9
  SHR r2, r10, r7
  SHR r0, r1, r8
  SHR r12, r4, r2
  SHL r2, r24, r9
  SHL r20, r4, r0
  SHL r8, r6, r1
  SHL r6, r0, r8
  SHL r6, r5, r14
  SAR r7, r0, r13
  SHR r9, r1, r15
  SHLI r0, r2, 0
  ANDI r8, r15, 1
  HALT
