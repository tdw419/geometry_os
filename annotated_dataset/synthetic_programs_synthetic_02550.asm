; DESCRIPTION: This GeOS assembly code initializes registers, sets up a color palette by storing RGB values into memory addresses, performs arithmetic and logical operations, calls a function to manipulate these values further, and finally displays the text "HELLO" at a specific location on the screen before halting.

; mixed program
; initialization
  LDI r5, 1
  LDI r2, 255
; palette
  LDI r10, 0x2308
  LDI r11, 1
  LDI r12, 0xFFFFFF
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0xFFFFFF
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0xFFEE00
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0x00FFAA
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0x0000FF
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0x0000CC
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0xFFFF00
  STORE r10, r12
  ADD r10, r10, r11
  LDI r12, 0xAAAAAA
  STORE r10, r12
  ADD r10, r10, r11
  DIV r5, r14, r1
  AND r6, r13, r7
  OR r0, r8, r10
  AND r13, r10, r11
  CALL func_0
func_0:
  SHL r5, r6, r2
  MUL r0, r6, r10
  SHL r3, r0, r11
  ADD r4, r0, r5
  XOR r6, r13, r10
  RET
  LDI r13, 8
  LDI r10, 1
  LDI r1, 2101
  TEXT r13, r10, r1, "HELLO"
  HALT
