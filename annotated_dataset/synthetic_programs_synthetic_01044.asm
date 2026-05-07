; DESCRIPTION: The code initializes registers with specific values, sets up a palette by storing color data at memory locations, and defines two functions `func_0` and `func_1` that perform arithmetic operations such as division, multiplication, XOR, AND, shifting, subtraction, addition, and modulo. The program checks for a key press and halts if the key value is 256.

; mixed program
; initialization
  LDI r7, 1766
  LDI r6, 0xCC9AE8
  LDI r19, 0x3B4158
  LDI r3, 0x9CFFB0
  LDI r11, 255
; palette
  LDI r2, 0x30D3
  LDI r9, 1
  LDI r1, 0xAA00AA
  STORE r2, r1
  ADD r2, r2, r9
  LDI r1, 0x550077
  STORE r2, r1
  ADD r2, r2, r9
  LDI r1, 0x008888
  STORE r2, r1
  ADD r2, r2, r9
  LDI r1, 0xAA00AA
  STORE r2, r1
  ADD r2, r2, r9
  LDI r1, 0xDD0044
  STORE r2, r1
  ADD r2, r2, r9
  CALL func_0
func_0:
  DIV r8, r7, r15
  MUL r7, r14, r9
  XOR r14, r8, r5
  RET
  CALL func_1
func_1:
  AND r7, r13, r2
  SHL r8, r11, r10
  SUB r11, r6, r29
  ADD r9, r12, r8
  MOD r0, r2, r12
  SHL r2, r15, r8
  RET
  IKEY r4
  CMPI r4, 256
  JNZ r4, key_2
  HALT
