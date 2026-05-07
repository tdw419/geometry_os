; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and performs various graphical operations such as drawing lines, rectangles, circles, and text on the screen. It also includes conditional logic to execute different branches based on register comparisons and calls a function (`func_2`) that performs arithmetic operations.

; mixed program
; initialization
  LDI r0, 0x114597
  LDI r10, 939
  LDI r14, 128
  LDI r9, 460
  LDI r3, 289
; palette
  LDI r2, 0x30A3
  LDI r13, 1
  LDI r10, 0x550077
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x000000
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x444444
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x00FFFF
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x00FF00
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x44FF00
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x44FF00
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x0000FF
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x8800FF
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r13
  LDI r10, 0x0000FF
  STORE r2, r10
  ADD r2, r2, r13
  CMP r3, r6
  JZ r3, else_0
  MOD r7, r1, r6
  XOR r14, r6, r5
  JMP endif_1
else_0:
  LDI r15, 10
  LDI r19, 0x4C3DA3
  LDI r10, 3780
  LDI r7, 847
  LDI r10, 1815
  LINE r15, r19, r10, r7, r10
  LDI r3, 4
  LDI r11, 0x2745B4
  LDI r5, 8
  LDI r5, 0x29D6A5
  LDI r13, 2
  LINE r3, r11, r5, r5, r13
  LDI r20, 0xC40FD4
  LDI r5, 0x436CAA
  LDI r12, 2
  PSET r20, r5, r12
endif_1:
  CALL func_2
func_2:
  AND r7, r15, r3
  DIV r9, r8, r11
  SUB r2, r7, r15
  MUL r10, r31, r15
  RET
  CMP r3, r1
  JZ r3, else_3
  OR r13, r12, r1
  ADD r6, r5, r15
  JMP endif_4
else_3:
  LDI r7, 0xAA2C0C
  LDI r9, 4
  LDI r6, 32
  LDI r10, 3034
  LDI r15, 2003
  LINE r7, r9, r6, r10, r15
  LDI r21, 255
  LDI r6, 0x91D24F
  LDI r4, 0xDD68DC
  LDI r2, 0x3099A8
  LDI r14, 2574
  RECTF r21, r6, r4, r2, r14
  LDI r3, 0xD60054
  LDI r26, 676
  LDI r4, 1898
  PSET r3, r26, r4
  LDI r10, 64
  LDI r13, 16
  LDI r15, 0x6FCE0F
  PSETI
endif_4:
  CMP r9, r7
  JZ r9, else_5
  XOR r15, r3, r6
  JMP endif_6
else_5:
  LDI r12, 2616
  LDI r6, 0xD59B69
  LDI r15, 1092
  PSETI
  LDI r7, 1
  LDI r1, 0xB4032C
  LDI r12, 10
  LDI r10, 0x428FD8
  LDI r4, 0x8EA127
  LINE r7, r1, r12, r10, r4
  LDI r9, 0x59CD9A
  LDI r7, 0x742C33
  LDI r3, 3743
  LDI r7, 0
  CIRCLE r9, r7, r3, r7
  LDI r13, 32
  LDI r14, 4
  LDI r1, 1859
  PSETI
endif_6:
  LDI r7, 16
  LDI r20, 3429
  LDI r2, 1534
  LDI r12, 0xFA8BB9
  LDI r2, 0xA80760
  LINE r7, r20, r2, r12, r2
  LDI r9, 0xA84E22
  LDI r3, 0x95A118
  LDI r4, 0xCE0FB6
  DRAWTEXT r9, r3, r4, "WORLD"
  CMP r4, r1
  LDI r8, 8
  LDI r11, 0xE1C119
  LDI r14, 1
  TEXT r8, r11, r14, "HELLO"
  HALT
