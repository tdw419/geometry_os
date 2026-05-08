; DESCRIPTION: This GeOS assembly code defines a series of subroutine calls to perform arithmetic operations such as multiplication, addition, subtraction, bitwise shifts, and logical operations on registers. It initializes specific register values and manipulates them through a sequence of function calls that execute various mathematical and logical computations before halting the system.

; subroutine calls
; initialization
  LDI r14, 4086
  LDI r2, 0xAA3D9C
  LDI r13, 1
  CALL func_0
func_0:
  OR r4, r15, r7
  MUL r12, r14, r0
  SHR r11, r5, r15
  OR r6, r12, r23
  SHL r15, r13, r5
  RET
  CALL func_1
func_1:
  SHL r10, r1, r15
  XOR r9, r10, r14
  RET
  CALL func_2
func_2:
  MUL r3, r9, r12
  SUB r7, r25, r1
  MOD r4, r14, r5
  DIV r8, r27, r11
  ADD r6, r13, r4
  RET
  CALL func_3
func_3:
  MUL r1, r8, r9
  MOD r5, r14, r15
  XOR r13, r6, r7
  ADD r13, r12, r4
  SHR r3, r7, r13
  RET
  HALT
