; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on comparisons between register contents. It includes operations like XOR, SHL (shift left), DIV (divide), MOD (modulus), and conditional branches to execute different sets of instructions. The code also uses geometric drawing commands such as CIRCLE and PSET to render shapes and points on a screen, and concludes with a HALT instruction to stop execution.

; conditional logic
; initialization
  LDI r12, 0x999BFE
  LDI r11, 2
  LDI r0, 0xFF2C9F
  LDI r14, 64
  LDI r9, 2368
  LDI r5, 0x5C9F6C
  CMP r1, r6
  JNZ r1, else_0
  XOR r26, r8, r4
  JMP endif_1
else_0:
  LDI r1, 3105
  LDI r11, 2235
  LDI r11, 423
  PSET r1, r11, r11
endif_1:
  CMP r3, r7
  JNZ r3, else_2
  DIV r14, r9, r4
  SHL r10, r15, r8
  XOR r2, r25, r9
  JMP endif_3
else_2:
  LDI r12, 3172
  LDI r4, 0x119A8A
  LDI r4, 2666
  LDI r26, 0xFB041A
  CIRCLE r12, r4, r4, r26
endif_3:
  CMP r14, r10
  JZ r14, else_4
  SHL r15, r8, r11
  DIV r1, r11, r2
  DIV r14, r9, r1
  MOD r14, r0, r6
  JMP endif_5
else_4:
  LDI r2, 1811
  LDI r15, 2
  LDI r5, 256
  LDI r15, 1728
  CIRCLE r2, r15, r5, r15
  LDI r8, 0xEBC4BE
  LDI r0, 711
  LDI r14, 3755
  PSET r8, r0, r14
  LDI r9, 2778
  LDI r0, 0
  LDI r6, 255
  PSET r9, r0, r6
  LDI r13, 995
  FILL r13
endif_5:
  HALT
