; DESCRIPTION: The GeOS assembly code initializes registers with specific values and performs conditional checks. Depending on the condition results, it either subtracts values or executes geometric drawing operations such as a line and a circle, followed by halting the system.

; conditional logic
; initialization
  LDI r5, 32
  LDI r4, 0xAC7CF0
  LDI r13, 4
  CMP r13, r1
  JNZ r13, else_0
  SUB r15, r0, r2
  JMP endif_1
else_0:
  LDI r31, 16
  LDI r13, 64
  LDI r2, 1343
  LDI r1, 4
  LDI r14, 0x8FA754
  LINE r31, r13, r2, r1, r14
endif_1:
  CMP r0, r4
  JZ r0, else_2
  SHL r12, r1, r5
  JMP endif_3
else_2:
  LDI r10, 64
  LDI r5, 0x562352
  LDI r3, 1250
  LDI r6, 0xE832F8
  CIRCLE r10, r5, r3, r6
  LDI r10, 0x396993
  LDI r7, 2422
  LDI r11, 0x2BAEBE
  PSETI
  LDI r9, 64
  LDI r15, 1422
  LDI r8, 16
  LDI r23, 255
  LDI r0, 0xAC2007
  LINE r9, r15, r8, r23, r0
endif_3:
  HALT
