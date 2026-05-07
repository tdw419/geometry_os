; DESCRIPTION: This GeOS assembly code initializes a palette with various colors and draws the text "HELLO" at coordinates (32, 0x56B442) in size 2. It also draws a circle with center (255, 64) and radius 128. The code includes two functions, `func_0` and `func_1`, which perform bitwise operations and conditional checks.

; mixed program
; initialization
  LDI r2, 1625
  LDI r6, 0xE6AAB2
; palette
  LDI r6, 0x704B
  LDI r3, 1
  LDI r11, 0xFF4400
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0xAA00AA
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0xFF8800
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x880088
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x00FFAA
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x00FF00
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x444444
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x0000FF
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x000000
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x0000FF
  STORE r6, r11
  ADD r6, r6, r3
  LDI r11, 0x444444
  STORE r6, r11
  ADD r6, r6, r3
  LDI r6, 32
  LDI r8, 0x56B442
  LDI r25, 2
  TEXT r6, r8, r25, "HELLO"
  LDI r10, 8
  LDI r6, 255
  LDI r2, 64
  LDI r11, 128
  CIRCLE r10, r6, r2, r11
  CALL func_0
func_0:
  AND r9, r15, r4
  DIV r10, r13, r1
  RET
  CMP r13, r8
  AND r9, r12, r1
  OR r12, r8, r10
  AND r6, r13, r15
  OR r5, r2, r13
  XOR r11, r12, r7
  CALL func_1
func_1:
  OR r13, r8, r6
  AND r5, r10, r8
  RET
  HALT
