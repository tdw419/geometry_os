; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a series of arithmetic and logical operations, including comparisons, jumps, function calls, and conditional halting based on input keys. It manipulates data using bitwise operations and arithmetic instructions, and conditionally executes different paths depending on the comparison results.

; mixed program
; initialization
  LDI r14, 725
  LDI r28, 3164
  LDI r10, 64
  CMP r6, r4
  JNZ r6, else_0
  OR r10, r7, r9
  SUB r9, r2, r5
  AND r4, r12, r0
  JMP endif_1
else_0:
  LDI r0, 16
  FILL r0
  LDI r12, 2
  LDI r12, 1
  LDI r21, 64
  PSET r12, r12, r21
  LDI r4, 1206
  LDI r10, 8
  LDI r4, 64
  PSETI
endif_1:
  OR r4, r10, r12
  AND r17, r13, r1
  OR r15, r7, r8
  XOR r10, r8, r4
  CALL func_2
func_2:
  DIV r11, r10, r15
  ADD r11, r3, r4
  OR r2, r10, r11
  XOR r8, r0, r7
  AND r1, r10, r6
  MOD r0, r8, r3
  RET
  SHL r14, r1, r0
  OR r0, r12, r9
  AND r6, r0, r15
  XOR r0, r9, r12
  CALL func_3
func_3:
  SUB r15, r11, r12
  SUB r4, r20, r7
  RET
  ADD r9, r8, r14
  IKEY r11
  CMPI r11, 76
  JNZ r11, key_4
  HALT
