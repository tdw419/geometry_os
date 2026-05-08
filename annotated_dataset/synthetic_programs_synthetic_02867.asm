; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette by storing color codes at memory locations starting from `0x2282`, and then calls two functions (`func_0` and `func_1`). The functions perform arithmetic operations such as division, XOR, AND, OR, and shift-right on the register values. After setting up the palette, it draws a pixel and fills a rectangle using specific color codes and coordinates. The main loop continues to set pixels and update frames until a condition is met.

; mixed program
; initialization
  LDI r8, 255
  LDI r9, 869
  LDI r1, 2775
  LDI r0, 0x3A3AB0
  LDI r3, 2952
  LDI r10, 0xFAD36E
; palette
  LDI r12, 0x2282
  LDI r9, 1
  LDI r3, 0x880088
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x0044FF
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0xAAAAAA
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x000000
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x888800
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x008888
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x000066
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x00FFAA
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0xFF8800
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x444444
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x550077
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x00FF00
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0xAAFF00
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x44FF00
  STORE r12, r3
  ADD r12, r12, r9
  LDI r3, 0x008888
  STORE r12, r3
  ADD r12, r12, r9
  CALL func_0
func_0:
  DIV r15, r9, r7
  XOR r13, r6, r10
  SHR r3, r15, r7
  RET
  CALL func_1
func_1:
  XOR r13, r15, r3
  AND r1, r8, r5
  ADD r3, r14, r2
  SHR r12, r11, r4
  RET
  AND r12, r14, r1
  OR r0, r12, r5
  OR r1, r11, r2
  AND r13, r5, r6
  CMPI r1, 68
  CMP r5, r7
  JNZ r5, else_2
  OR r8, r6, r13
  DIV r9, r7, r4
  JMP endif_3
else_2:
  LDI r15, 3758
  LDI r7, 8
  LDI r1, 4031
  WPIXEL
  LDI r9, 0x6CA4F0
  LDI r10, 1495
  LDI r11, 3241
  LDI r4, 64
  LDI r3, 128
  RECTF r9, r10, r11, r4, r3
endif_3:
main_4:
  LDI r2, 255
  LDI r4, 0x6A21ED
  LDI r2, 1492
  PSET r2, r4, r2
  CMPI r7, 73
  FRAME
  JMP main_4
