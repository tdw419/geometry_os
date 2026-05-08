; DESCRIPTION: This GeOS assembly code initializes registers with various values, sets up a color palette, performs arithmetic operations including division, modulo, and bitwise logic, checks for a specific key input, and conditionally draws a line based on comparisons. Finally, it halts execution.

; mixed program
; initialization
  LDI r12, 4
  LDI r15, 0x1C0D32
  LDI r30, 255
  LDI r5, 2687
  LDI r2, 255
  LDI r0, 8
  LDI r10, 2
  LDI r8, 4
; palette
  LDI r0, 0x6050
  LDI r5, 1
  LDI r15, 0x0044FF
  STORE r0, r15
  ADD r0, r0, r5
  LDI r15, 0x444444
  STORE r0, r15
  ADD r0, r0, r5
  LDI r15, 0x44FF00
  STORE r0, r15
  ADD r0, r0, r5
  LDI r15, 0x44FF00
  STORE r0, r15
  ADD r0, r0, r5
  PUSH r9
  PUSH r15
  PUSH r16
  DIV r14, r10, r24
  DIV r4, r8, r5
  SHL r2, r13, r9
  MOD r12, r13, r7
  XOR r9, r11, r7
  POP r16
  POP r15
  POP r9
  AND r13, r7, r2
  AND r10, r14, r15
  IKEY r1
  CMPI r1, 0x7AA3DB
  JNZ r1, key_0
  PUSH r3
  SHR r1, r11, r13
  ADD r9, r8, r7
  OR r0, r10, r26
  DIV r29, r6, r13
  XOR r11, r3, r2
  POP r3
  CMP r10, r1
  CMPI r1, 0
  CMP r27, r4
  JNZ r27, else_1
  ADD r14, r8, r5
  MUL r11, r0, r10
  AND r7, r9, r10
  JMP endif_2
else_1:
  LDI r6, 8
  LDI r12, 4
  LDI r13, 1267
  LDI r2, 0x616D56
  LDI r4, 0x632D32
  LINE r6, r12, r13, r2, r4
  LDI r2, 1331
  LDI r10, 0
  LDI r6, 8
  WPIXEL
endif_2:
  HALT
