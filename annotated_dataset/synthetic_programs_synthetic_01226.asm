; DESCRIPTION: The provided GeOS assembly code initializes registers with specific values and sets up a color palette. It then performs arithmetic operations, memory stores and loads, bitwise operations, and finally halts execution.

; mixed program
; initialization
  LDI r15, 0xE7116D
  LDI r10, 10
  LDI r8, 64
  LDI r7, 0x723F59
; palette
  LDI r9, 0x3077
  LDI r5, 1
  LDI r2, 0x550077
  STORE r9, r2
  ADD r9, r9, r5
  LDI r2, 0x880088
  STORE r9, r2
  ADD r9, r9, r5
  LDI r2, 0x880088
  STORE r9, r2
  ADD r9, r9, r5
  LDI r2, 0x0000FF
  STORE r9, r2
  ADD r9, r9, r5
  SAR r13, r5, r8
  SHR r7, r12, r13
  LDI r10, 275
  STORE r10, r9
  LOAD r5, r10
  LDI r8, 1
  STORE r8, r10
  LOAD r13, r8
  LDI r0, 1
  STORE r0, r11
  LOAD r12, r0
  DIV r6, r5, r14
  ADD r15, r10, r12
  SUB r13, r2, r9
  OR r1, r12, r21
  AND r2, r4, r3
  HALT
