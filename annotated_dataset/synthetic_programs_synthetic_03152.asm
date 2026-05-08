; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations including shifts and logicals, calls a function that executes arithmetic and logical operations on these registers, and then enters a loop where it writes pixels to a display until a condition is met before halting.

; mixed program
; initialization
  LDI r1, 1095
  LDI r9, 2921
  LDI r22, 3742
  SHLI r13, r25, 0xE35066
  SHLI r28, r15, 32
  SHL r2, r4, r12
  SHL r12, r22, r10
  CALL func_0
func_0:
  DIV r0, r7, r1
  SHL r13, r6, r1
  OR r1, r3, r13
  XOR r0, r4, r10
  XOR r11, r15, r3
  OR r14, r2, r15
  RET
  XOR r3, r19, r2
  XOR r9, r4, r24
  LDI r4, 0x7F6AF1
loop_1:
  OR r30, r8, r3
  LDI r2, 1246
  LDI r10, 0x7691C0
  LDI r4, 3031
  WPIXEL
  LDI r13, 1155
  LDI r4, 0x757BC2
  LDI r9, 0
  PSETI
  LDI r20, 1
  SUB r4, r4, r20
  JNZ r4, loop_1
  HALT
