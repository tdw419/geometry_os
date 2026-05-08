; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations like AND, SHL, and SAR, calls a function `func_0` which involves more arithmetic and logical operations, and conditionally executes drawing commands such as PSET and CIRCLE based on the result of a comparison. The program ultimately halts execution.

; mixed program
; initialization
  LDI r11, 0x8EBFA2
  LDI r2, 0x1CD784
  LDI r5, 8
  LDI r23, 8
  LDI r13, 985
  LDI r6, 0xAD9D71
  LDI r7, 1
  SHL r9, r6, r7
  SAR r9, r5, r6
  CALL func_0
func_0:
  AND r9, r3, r1
  SHL r17, r8, r13
  XOR r8, r2, r15
  SUB r13, r11, r9
  MUL r4, r7, r0
  RET
  CMP r13, r11
  JNZ r13, else_1
  OR r6, r0, r14
  JMP endif_2
else_1:
  LDI r23, 8
  LDI r30, 574
  LDI r1, 1541
  PSET r23, r30, r1
  LDI r15, 998
  LDI r13, 10
  LDI r10, 255
  PSET r15, r13, r10
  LDI r3, 2974
  FILL r3
  LDI r3, 0xC4E523
  LDI r14, 0x6E545E
  LDI r10, 256
  LDI r15, 64
  CIRCLE r3, r14, r10, r15
endif_2:
  HALT
