; DESCRIPTION: This GeOS assembly code initializes two registers with specific values, sets up a color palette by storing various RGB colors into memory locations starting from address `0x8083`, and then calls a function `func_0`. The function performs arithmetic operations including multiplication, XOR, SHL, SHR, and division on several registers before returning.

; mixed program
; initialization
  LDI r8, 3950
  LDI r0, 1459
; palette
  LDI r5, 0x8083
  LDI r9, 1
  LDI r4, 0x008888
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0xFFFF00
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0xDD0044
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0x0000FF
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0xDD0044
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0x000000
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0xFF4400
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0x00FF00
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0x00FFAA
  STORE r5, r4
  ADD r5, r5, r9
  LDI r4, 0x0000CC
  STORE r5, r4
  ADD r5, r5, r9
  OR r4, r5, r11
  XOR r12, r2, r14
  XOR r3, r14, r7
  AND r7, r5, r3
  CALL func_0
func_0:
  MUL r2, r0, r5
  XOR r8, r1, r2
  SHL r7, r1, r9
  SHR r3, r0, r7
  DIV r2, r7, r6
  RET
  XOR r3, r12, r7
  XOR r6, r9, r5
  OR r15, r9, r7
  HALT
