; DESCRIPTION: The provided GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including shifts and comparisons. It then halts execution.

; mixed program
; initialization
  LDI r10, 1596
  LDI r20, 2
  LDI r3, 2301
  LDI r11, 749
  LDI r7, 10
  CMPI r12, 1
  SAR r2, r6, r11
  SHR r2, r4, r10
  SAR r0, r7, r5
  SAR r5, r8, r15
  SHL r0, r23, r14
  HALT
