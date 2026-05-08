; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then performs arithmetic operations, conditional checks, and pixel manipulation, including setting pixels and storing values in memory. The program concludes with a halt instruction.

; mixed program
; initialization
  LDI r12, 10
  LDI r0, 2114
; palette
  LDI r1, 0x6071
  LDI r9, 1
  LDI r11, 0xFF0000
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFFEE00
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFF4400
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFF0000
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0x44FF00
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0x0044FF
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFF8800
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0x44FF00
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFFAA00
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0x8800FF
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xFF00FF
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xDD0044
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xDD0044
  STORE r1, r11
  ADD r1, r1, r9
  LDI r11, 0xAA00AA
  STORE r1, r11
  ADD r1, r1, r9
  LDI r8, 0x50A8x37132A
  STORE r8, r7
  LOAD r14, r8
  LDI r7, 8
  STORE r7, r12
  LOAD r5, r7
  CMP r9, r12
  JZ r9, else_0
  DIV r14, r24, r3
  JMP endif_1
else_0:
  LDI r11, 3078
  LDI r10, 256
  LDI r4, 64
  PSETI
  LDI r12, 128
  LDI r7, 0xCF7682
  LDI r1, 0x7FECF9
  WPIXEL
endif_1:
  PUSH r14
  PUSH r3
  PUSH r13
  PUSH r1
  XOR r6, r3, r8
  MUL r11, r4, r1
  POP r1
  POP r13
  POP r3
  POP r14
  PUSH r7
  PUSH r13
  PUSH r14
  PUSH r5
  OR r11, r9, r14
  XOR r13, r2, r15
  SHL r15, r2, r1
  OR r10, r9, r4
  AND r1, r8, r7
  POP r5
  POP r14
  POP r13
  POP r7
  LDI r2, 0x4EB8DA
  STORE r2, r4
  LOAD r25, r2
  LDI r8, 0x9A008A
  STORE r8, r10
  LOAD r11, r8
  AND r11, r8, r6
  OR r11, r12, r16
  XOR r12, r5, r6
  AND r0, r3, r10
  HALT
