; DESCRIPTION: The GeOS assembly code initializes registers with specific values, performs arithmetic and logical operations including division, multiplication, and bitwise operations, conditionally executes drawing functions like `TEXT`, `CIRCLE`, and `PSETI`, and loops indefinitely in the `main_4` function.

; mixed program
; initialization
  LDI r3, 0x03F837
  LDI r11, 10
  LDI r7, 0x810B16
  LDI r8, 0x686D98
  LDI r5, 0
  CALL func_0
func_0:
  DIV r5, r6, r8
  OR r4, r0, r15
  SUB r6, r2, r3
  RET
  LDI r7, 2814
  LDI r6, 0xAA992B
  LDI r15, 64
  TEXT r7, r6, r15, "HELLO"
  CMP r8, r11
  JNZ r8, else_1
  ADD r2, r3, r14
  DIV r6, r10, r13
  MUL r7, r0, r6
  DIV r15, r7, r1
  JMP endif_2
else_1:
  LDI r5, 2781
  LDI r2, 0x062C6C
  LDI r10, 0xAF35B4
  WPIXEL
  LDI r12, 1498
  LDI r1, 0x7AB521
  LDI r14, 0xF52D55
  LDI r4, 2220
  CIRCLE r12, r1, r14, r4
  LDI r3, 2212
  LDI r6, 0xE9202C
  LDI r7, 3673
  PSETI
endif_2:
  SUB r0, r14, r3
  CALL func_3
func_3:
  AND r14, r10, r0
  OR r5, r2, r29
  RET
main_4:
  OR r2, r16, r4
  AND r7, r13, r2
  XOR r0, r9, r10
  LDI r8, 0xD2721E
  LDI r8, 3194
  LDI r2, 2861
  TEXT r8, r8, r2, "HELLO"
  SAR r15, r5, r6
  SHL r2, r15, r7
  FRAME
  JMP main_4
