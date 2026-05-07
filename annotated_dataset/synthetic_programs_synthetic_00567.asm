; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs a series of arithmetic and logical operations including shifts, modulo, AND, OR, and division, conditionally executes drawing commands for lines and rectangles based on comparisons, and enters a loop that modifies and combines register values until a counter reaches zero.

; mixed program
; initialization
  LDI r4, 3510
  LDI r7, 230
  LDI r8, 0x7028D9
  LDI r15, 4041
  CMP r14, r15
  PUSH r14
  PUSH r4
  SHL r6, r5, r11
  MOD r7, r5, r12
  AND r6, r22, r2
  SHL r11, r6, r7
  SUB r2, r27, r10
  POP r4
  POP r14
  AND r31, r5, r3
  OR r14, r10, r1
  CMP r3, r7
  JZ r3, else_0
  DIV r12, r7, r5
  JMP endif_1
else_0:
  LDI r14, 0x1EE1AE
  LDI r7, 3519
  LDI r0, 2
  LDI r7, 508
  LDI r12, 0xFCDCDE
  LINE r14, r7, r0, r7, r12
  LDI r8, 128
  LDI r5, 0xF8A6DC
  LDI r1, 4014
  LDI r1, 872
  LDI r8, 0x325ED7
  LINE r8, r5, r1, r1, r8
  LDI r13, 861
  FILL r13
  LDI r1, 10
  LDI r9, 4
  LDI r6, 10
  LDI r3, 0x5BCC0B
  LDI r9, 0x29CABC
  RECTF r1, r9, r6, r3, r9
endif_1:
  LDI r10, 64
loop_2:
  ANDI r10, r14, 123
  ADDI r19, r31, 2
  OR r2, r0, r13
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_2
  HALT
