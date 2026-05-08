; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a function `func_0` that performs bitwise operations and arithmetic, and then calls another function `func_1` which includes shift operations and conditional checks based on input keys. The program also draws a rectangle and sets a pixel if certain key conditions are met, finally halting execution.

; mixed program
; initialization
  LDI r6, 2233
  LDI r2, 1133
  LDI r13, 256
  LDI r1, 1907
  CALL func_0
func_0:
  OR r15, r5, r0
  SHR r0, r1, r3
  MUL r13, r9, r7
  SHR r6, r13, r0
  ADD r8, r4, r2
  XOR r3, r0, r8
  RET
  SHLI r11, r2, 8
  SHLI r12, r7, 0x256FBC
  SHR r4, r20, r0
  SAR r7, r0, r3
  PUSH r14
  DIV r9, r11, r4
  MUL r11, r13, r15
  SUB r9, r5, r3
  MUL r1, r9, r13
  SUB r22, r4, r31
  POP r14
  CALL func_1
func_1:
  SHL r1, r13, r5
  XOR r15, r14, r2
  SHR r14, r9, r5
  MOD r2, r0, r10
  SHL r3, r12, r2
  MUL r2, r5, r7
  RET
  LDI r0, 3933
  LDI r11, 2
  LDI r10, 3882
  LDI r7, 2857
  LDI r14, 0x059C8F
  RECTF r0, r11, r10, r7, r14
  IKEY r1
  CMPI r1, 28
  JNZ r1, key_2
  IKEY r7
  CMPI r7, 64
  JNZ r7, key_3
  LDI r1, 255
  LDI r11, 864
  LDI r2, 32
  PSETI
  HALT
