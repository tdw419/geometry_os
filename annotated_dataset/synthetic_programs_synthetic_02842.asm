; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, and performs operations including conditional jumps, arithmetic calculations, bitwise operations, function calls, and pixel manipulation. The program halts execution based on certain conditions.

; mixed program
; initialization
  LDI r19, 32
  LDI r2, 0x4DFF85
  LDI r3, 2387
  LDI r0, 3103
  LDI r1, 0x07A453
; palette
  LDI r9, 0x803B
  LDI r0, 1
  LDI r1, 0x00FF44
  STORE r9, r1
  ADD r9, r9, r0
  LDI r1, 0x880088
  STORE r9, r1
  ADD r9, r9, r0
  LDI r1, 0x0044FF
  STORE r9, r1
  ADD r9, r9, r0
  LDI r1, 0x00FFFF
  STORE r9, r1
  ADD r9, r9, r0
  LDI r1, 0x000000
  STORE r9, r1
  ADD r9, r9, r0
  LDI r1, 0x0044FF
  STORE r9, r1
  ADD r9, r9, r0
  IKEY r14
  CMPI r14, 227
  JNZ r14, key_0
  LDI r2, 16
  STORE r2, r15
  LOAD r14, r2
  LDI r13, 255
  STORE r13, r5
  LOAD r11, r13
  LDI r12, 0x1467CC
  STORE r12, r4
  LOAD r22, r12
  LDI r3, 32
  STORE r3, r9
  LOAD r0, r3
  LDI r27, 2
loop_1:
  SUBI r13, r5, 32
  ADD r5, r3, r1
  XOR r11, r15, r13
  XOR r2, r0, r7
  LDI r12, 1
  SUB r27, r27, r12
  JNZ r27, loop_1
  SHL r8, r1, r0
  CALL func_2
func_2:
  XOR r5, r0, r2
  MOD r21, r1, r13
  OR r11, r3, r0
  SUB r10, r15, r6
  DIV r1, r12, r28
  RET
  CMP r7, r11
  JNZ r7, else_3
  MOD r3, r9, r0
  SUB r5, r11, r7
  OR r2, r14, r5
  JMP endif_4
else_3:
  LDI r9, 0xEC56F9
  LDI r8, 3268
  LDI r0, 1429
  PSETI
  LDI r6, 255
  LDI r3, 2
  LDI r2, 0xD3EC52
  WPIXEL
endif_4:
  LDI r0x24090, 3899
  STORE r10, r9
  LOAD r0, r10
  LDI r6, 0x099CF8
  STORE r6, r8
  LOAD r10, r6
  CMP r28, r8
  HALT
