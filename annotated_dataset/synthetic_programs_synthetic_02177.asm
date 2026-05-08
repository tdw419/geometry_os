; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets a pixel, draws the text "WORLD" at a specified location, and includes conditional logic to call functions based on input keys. The functions perform arithmetic operations, bitwise manipulations, and handle additional conditions and drawing commands.

; mixed program
; initialization
  LDI r13, 128
  LDI r4, 0xF0CCCD
  LDI r1, 0xAAD6FC
  LDI r5, 2873
  LDI r2, 0x87FA67
  LDI r15, 1
  LDI r7, 222
  LDI r15, 0x3B67D3
  LDI r5, 2155
  PSET r7, r15, r5
  LDI r13, 567
  LDI r9, 3012
  LDI r14, 2758
  DRAWTEXT r13, r9, r14, "WORLD"
  IKEY r2
  CMPI r2, 0x795760
  JNZ r2, key_0
  CALL func_1
func_1:
  ADD r0, r9, r12
  SHR r3, r0, r7
  ADD r2, r9, r12
  SHL r9, r15, r4
  OR r15, r11, r13
  RET
  PUSH r14
  PUSH r9
  ADD r14, r15, r0
  DIV r11, r8, r15
  SHL r4, r5, r0
  ADD r14, r30, r15
  SHL r11, r7, r10
  POP r9
  POP r14
  CALL func_2
func_2:
  DIV r16, r4, r12
  MUL r4, r5, r7
  DIV r2, r11, r6
  RET
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_3
  CMP r8, r0
  JNZ r8, else_4
  XOR r0, r14, r8
  JMP endif_5
else_4:
  LDI r8, 32
  LDI r9, 0x5D19DD
  LDI r6, 1006
  PSETI
  LDI r4, 0x0E2AD0
  LDI r11, 0x44AB74
  LDI r12, 255
  WPIXEL
  LDI r1, 271
  LDI r15, 2061
  LDI r3, 2
  WPIXEL
  LDI r1, 16
  FILL r1
endif_5:
  HALT
