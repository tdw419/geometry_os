; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including addition, subtraction, bitwise AND, OR, XOR, shifts (left and right), multiplication, and comparisons. The code concludes by halting execution.

; math computation
; initialization
  LDI r7, 0x9BAE36
  LDI r2, 0x677FF3
  LDI r10, 0xA77B15
  ANDI r1, r15, 0
  ADD r1, r0, r3
  SHL r7, r12, r3
  SHL r5, r19, r14
  SHLI r7, r1, 2
  SAR r9, r1, r22
  ADD r12, r3, r11
  OR r2, r12, r3
  OR r11, r19, r14
  AND r8, r5, r14
  AND r9, r0, r13
  ADDI r13, r7, 255
  SUBI r13, r2, 31
  SUB r1, r3, r0
  SUBI r11, r10, 242
  AND r11, r6, r0
  OR r1, r15, r5
  OR r3, r10, r2
  CMPI r12, r14, 193
  XOR r5, r7, r8
  MUL r16, r7, r6
  HALT
