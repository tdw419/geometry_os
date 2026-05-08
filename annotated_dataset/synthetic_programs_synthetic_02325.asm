; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, draws text "WORLD" at a given position, performs various arithmetic and logical operations, checks a condition to either update variables or draw a rectangle, and waits for a key press to halt execution.

; mixed program
; initialization
  LDI r2, 0x6C2A92
  LDI r10, 0xA08399
  LDI r0, 8
; palette
  LDI r11, 0x4036
  LDI r9, 1
  LDI r13, 0x888800
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x00FFAA
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x8800FF
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0xFF8800
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0xDD0044
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x444444
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x00FF44
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x888800
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x44FF00
  STORE r11, r13
  ADD r11, r11, r9
  LDI r13, 0x008888
  STORE r11, r13
  ADD r11, r11, r9
  LDI r10, 0x6D11D7
  LDI r13, 16
  LDI r12, 4
  DRAWTEXT r10, r13, r12, "WORLD"
  PUSH r3
  PUSH r12
  XOR r3, r4, r15
  OR r12, r2, r1
  AND r4, r8, r15
  POP r12
  POP r3
  PUSH r4
  PUSH r6
  PUSH r0
  PUSH r5
  XOR r4, r5, r0
  SHL r15, r1, r10
  MUL r13, r5, r9
  SHL r15, r5, r11
  SUB r6, r9, r1
  POP r5
  POP r0
  POP r6
  POP r4
  CMP r14, r8
  JNZ r14, else_0
  SUB r6, r14, r13
  DIV r5, r0, r3
  ADD r14, r15, r1
  JMP endif_1
else_0:
  LDI r5, 0x571D24
  LDI r14, 0x2BEC09
  LDI r13, 2170
  LDI r10, 4
  LDI r7, 0x3BA0F9
  RECTF r5, r14, r13, r10, r7
  LDI r14, 1
  FILL r14
endif_1:
  LDI r13, 0xA331FD
  LDI r8, 3396
  LDI r8, 721
  WPIXEL
  PUSH r7
  PUSH r6
  PUSH r0
  DIV r6, r5, r0
  DIV r12, r9, r6
  POP r0
  POP r6
  POP r7
  PUSH r5
  XOR r3, r11, r4
  XOR r0, r8, r10
  OR r2, r13, r15
  POP r5
  IKEY r13
  CMPI r13, 5
  JNZ r13, key_2
  HALT
