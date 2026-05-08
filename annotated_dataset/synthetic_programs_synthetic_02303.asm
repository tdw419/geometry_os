; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four subroutines (func_0 through func_3). Each subroutine performs a series of bitwise operations including OR, AND, XOR, shift operations (SHR), multiplication (MUL), division (DIV), modulus (MOD), addition (ADD), and returns to the caller. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r0, 32
  LDI r3, 16
  LDI r5, 376
  LDI r4, 0xFF8B93
  LDI r12, 1159
  LDI r13, 32
  LDI r8, 10
  LDI r2, 0x626BAD
  CALL func_0
func_0:
  OR r8, r15, r11
  OR r10, r13, r12
  MUL r7, r4, r12
  DIV r5, r14, r9
  AND r3, r22, r12
  RET
  CALL func_1
func_1:
  SHR r11, r10, r2
  MOD r15, r2, r4
  RET
  CALL func_2
func_2:
  SHR r8, r25, r12
  XOR r23, r2, r15
  XOR r1, r5, r3
  RET
  CALL func_3
func_3:
  ADD r13, r12, r6
  SHR r1, r13, r0
  ADD r9, r13, r10
  XOR r12, r5, r13
  RET
  HALT
