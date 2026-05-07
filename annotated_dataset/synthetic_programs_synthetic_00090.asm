; DESCRIPTION: This GeOS assembly code performs conditional logic checks and arithmetic operations based on the values in registers. It initializes several registers with specific values, compares register contents, and executes different blocks of code depending on these comparisons, including shifting, multiplying, dividing, and modulo operations. The code also includes drawing commands like `RECTF`, `PSETI`, `WPIXEL`, and `CIRCLE` for graphical output. Finally, it halts execution.

; conditional logic
; initialization
  LDI r13, 2841
  LDI r0, 0x5B37CA
  LDI r11, 13
  LDI r12, 1131
  CMP r6, r2
  JZ r6, else_0
  SHR r9, r15, r13
  MUL r3, r2, r12
  JMP endif_1
else_0:
  LDI r12, 255
  LDI r28, 16
  LDI r3, 3688
  LDI r15, 2988
  LDI r5, 3141
  RECTF r12, r28, r3, r15, r5
endif_1:
  CMP r2, r10
  JNZ r2, else_2
  DIV r14, r3, r11
  MOD r9, r0, r5
  MOD r0, r9, r3
  JMP endif_3
else_2:
  LDI r12, 0x2B0830
  LDI r4, 3531
  LDI r11, 1999
  PSETI
  LDI r14, 0xA7369A
  LDI r4, 828
  LDI r2, 2473
  WPIXEL
  LDI r5, 255
  LDI r2, 1
  LDI r8, 1996
  LDI r1, 16
  CIRCLE r5, r2, r8, r1
endif_3:
  HALT
