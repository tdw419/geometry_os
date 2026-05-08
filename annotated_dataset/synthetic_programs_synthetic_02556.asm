; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette by storing RGB color codes into memory, and performs arithmetic operations like addition, multiplication, and modulo. It includes conditional branching to draw a line and a circle on the screen based on certain conditions, and ends with halting the program after storing and loading data from specified memory addresses.

; mixed program
; initialization
  LDI r1, 327
  LDI r13, 0x60C331
  LDI r7, 4
  LDI r11, 255
  LDI r6, 2125
  LDI r3, 1
  LDI r0, 0xA7A835
  LDI r20, 0x49CE32
; palette
  LDI r12, 0x20E1
  LDI r9, 1
  LDI r2, 0x444444
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x880088
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xFFFFFF
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xFFEE00
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xAAFF00
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x0044FF
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x444444
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x00FF00
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x8800FF
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x00FFAA
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x00AAFF
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xFFFF00
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x00FF44
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0x000066
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xAA00AA
  STORE r12, r2
  ADD r12, r12, r9
  LDI r2, 0xFF00FF
  STORE r12, r2
  ADD r12, r12, r9
  PUSH r6
  MOD r4, r1, r2
  DIV r25, r15, r4
  SUB r1, r11, r3
  MUL r9, r6, r0
  AND r12, r4, r30
  POP r6
  CMP r2, r14
  JZ r2, else_0
  MOD r1, r4, r0
  JMP endif_1
else_0:
  LDI r13, 0xD7CB53
  LDI r0, 16
  LDI r10, 3252
  LDI r12, 0xC193A2
  LDI r14, 4
  LINE r13, r0, r10, r12, r14
  LDI r9, 0x21839A
  LDI r4, 3983
  LDI r10, 226
  LDI r6, 2053
  CIRCLE r9, r4, r10, r6
  LDI r16, 0x4E7A0E
  LDI r9, 2813
  LDI r11, 0x5E545B
  LDI r4, 0x38F7A9
  LDI r7, 0
  LINE r16, r9, r11, r4, r7
endif_1:
  LDI r24, 0x4425A2
  STORE r24, r6
  LOAD r10, r24
  LDI r12, 3843
  STORE r12, r16
  LOAD r17, r12
  LDI r3, 4
  STORE r3, r12
  LOAD r2, r3
  HALT
