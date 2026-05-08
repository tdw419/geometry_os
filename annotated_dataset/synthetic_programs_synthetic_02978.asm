; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations including shifts and compares, conditionally executes a block of code based on the result of a comparison, and finally draws the text "WORLD" at specified coordinates before halting execution.

; mixed program
; initialization
  LDI r4, 176
  LDI r3, 3090
  LDI r1, 2113
  LDI r11, 0xF43F5B
  LDI r0, 8
  LDI r7, 156
  LDI r19, 16
  LDI r12, 32
  SHL r2, r5, r13
  SHR r2, r11, r1
  SHLI r5, r15, 256
  SHLI r3, r13, 255
  CMP r5, r10
  JNZ r5, else_0
  XOR r2, r14, r13
  JMP endif_1
else_0:
  LDI r26, 0xBFC9A6
  FILL r26
  LDI r9, 2671
  FILL r9
endif_1:
  SHL r2, r11, r8
  SHR r11, r15, r4
  SHLI r7, r11, 0
  SAR r12, r4, r6
  LDI r10, 255
  LDI r0, 2
  LDI r8, 64
  DRAWTEXT r10, r0, r8, "WORLD"
  HALT
