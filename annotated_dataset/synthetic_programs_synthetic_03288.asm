; DESCRIPTION: This GeOS assembly code performs a series of logical operations and conditional checks. It initializes registers with specific values, manipulates flags and registers based on key input and comparisons, and conditionally executes drawing commands such as `RECTF` and `WPIXEL`. The program halts execution at the end after performing these operations.

; mixed program
; initialization
  LDI r8, 2597
  LDI r1, 2692
  LDI r9, 3400
  LDI r6, 3429
  LDI r3, 1933
  LDI r25, 2
  LDI r0, 16
  PUSH r7
  SHR r11, r3, r26
  AND r4, r1, r11
  POP r7
  IKEY r10
  CMPI r10, 210
  JNZ r10, key_0
  CMP r15, r4
  JNZ r15, else_1
  OR r14, r4, r8
  JMP endif_2
else_1:
  LDI r10, 64
  LDI r0, 2345
  LDI r11, 1584
  LDI r11, 2999
  LDI r6, 1
  RECTF r10, r0, r11, r11, r6
endif_2:
  CMP r15, r7
  JZ r15, else_3
  SUB r2, r1, r4
  DIV r12, r10, r13
  XOR r14, r6, r5
  JMP endif_4
else_3:
  LDI r5, 0
  FILL r5
  LDI r1, 653
  LDI r15, 884
  LDI r15, 16
  WPIXEL
  LDI r0, 0x63DF4A
  LDI r10, 0x66F165
  LDI r13, 2926
  LDI r7, 32
  LDI r2, 2631
  RECTF r0, r10, r13, r7, r2
endif_4:
  LDI r10x234B, 390x234B9
  STORE r10, r8
  LOAD r5, r10
  LDI r4, 1
  STORE r4, r0
  LOAD r13, r4
  CMPI r9, 0xEE96AE
  HALT
