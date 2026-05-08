; DESCRIPTION: This GeOS assembly code performs conditional logic operations and arithmetic calculations. It initializes multiple registers with specific values, compares them, and executes different branches of code based on the comparison results. The code includes multiplication, subtraction, modulus, bitwise operations, and graphics drawing instructions like `PSET` and `RECTF`.

; conditional logic
; initialization
  LDI r12, 3937
  LDI r0, 1112
  LDI r15, 32
  LDI r6, 2269
  LDI r7, 10
  LDI r3, 229
  LDI r5, 459
  CMP r15, r9
  JNZ r15, else_0
  MUL r8, r6, r10
  SUB r7, r9, r8
  MOD r9, r8, r15
  AND r14, r0, r12
  JMP endif_1
else_0:
  LDI r14, 4
  LDI r9, 3323
  LDI r3, 255
  PSET r14, r9, r3
  LDI r0, 0x709AA9
  FILL r0
endif_1:
  CMP r1, r14
  JZ r1, else_2
  OR r13, r10, r15
  OR r8, r1, r12
  MUL r9, r13, r7
  JMP endif_3
else_2:
  LDI r1, 2394
  LDI r6, 1384
  LDI r15, 2490
  LDI r12, 2367
  LDI r22, 0xD40D2A
  RECTF r1, r6, r15, r12, r22
  LDI r11, 0x27D4FE
  LDI r3, 255
  LDI r10, 0
  LDI r3, 0x4707F5
  LDI r13, 343
  RECTF r11, r3, r10, r3, r13
  LDI r0, 2794
  LDI r6, 0xA864C8
  LDI r5, 0xE252EF
  PSET r0, r6, r5
endif_3:
  CMP r2, r1
  JZ r2, else_4
  MUL r13, r8, r12
  OR r10, r9, r28
  SUB r12, r1, r4
  SHR r9, r2, r7
  JMP endif_5
else_4:
  LDI r13, 269
  LDI r0, 0x58314D
  LDI r1, 3617
  PSETI
  LDI r15, 0x51DBF8
  FILL r15
endif_5:
  HALT
