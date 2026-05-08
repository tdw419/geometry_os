; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of `r5` and `r13`. If they are equal, it executes a series of operations including setting pixel colors and drawing rectangles; otherwise, it shifts bits, performs bitwise OR operations, and draws lines before halting.

; conditional logic
; initialization
  LDI r0, 1601
  LDI r6, 128
  LDI r7, 104
  LDI r11, 255
  LDI r10, 0xC78A94
  LDI r13, 2
  CMP r5, r13
  JZ r5, else_0
  SHR r3, r1, r12
  OR r15, r8, r9
  OR r1, r4, r10
  JMP endif_1
else_0:
  LDI r1, 16
  LDI r0, 16
  LDI r10, 4
  PSET r1, r0, r10
  LDI r12, 0x85C412
  LDI r7, 3525
  LDI r12, 0x605EA0
  LDI r12, 256
  LDI r10, 255
  RECTF r12, r7, r12, r12, r10
  LDI r14, 1859
  LDI r0, 0x00FF77
  LDI r14, 0
  LDI r22, 1695
  LDI r12, 1273
  RECTF r14, r0, r14, r22, r12
  LDI r2, 64
  LDI r5, 0xAFEC83
  LDI r0, 0xA56256
  LDI r6, 8
  LDI r0, 2
  LINE r2, r5, r0, r6, r0
endif_1:
  HALT
