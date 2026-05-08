; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of `r5` and `r4`. If they are equal, it executes a series of operations including shifting, multiplying, drawing circles, writing pixels, and drawing lines. If not, it directly proceeds to halt the system.

; conditional logic
; initialization
  LDI r2, 3244
  LDI r4, 64
  LDI r10, 0xB5C39B
  LDI r9, 1
  LDI r3, 1536
  LDI r17, 32
  LDI r11, 8
  LDI r1, 0xDD81EA
  CMP r5, r4
  JZ r5, else_0
  SHL r15, r2, r5
  MUL r8, r7, r1
  JMP endif_1
else_0:
  LDI r14, 256
  LDI r8, 16
  LDI r21, 1118
  LDI r2, 2
  CIRCLE r14, r8, r21, r2
  LDI r20, 437
  LDI r3, 0x667571
  LDI r8, 1296
  LDI r13, 68
  CIRCLE r20, r3, r8, r13
  LDI r6, 10
  LDI r15, 0xB7DB06
  LDI r3, 0xE595F1
  WPIXEL
  LDI r1, 2226
  LDI r9, 0xE848C4
  LDI r0, 1726
  LDI r2, 4
  LDI r13, 16
  LINE r1, r9, r0, r2, r13
endif_1:
  HALT
