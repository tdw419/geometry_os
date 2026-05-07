; DESCRIPTION: This GeOS assembly code initializes a series of registers with specific values and then calls four subroutines (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations such as modulo, shift, multiply, add, subtract, and bitwise logic (AND, OR, XOR) on these registers. The code ultimately halts execution after completing all subroutine calls.

; subroutine calls
; initialization
  LDI r0, 4
  LDI r3, 229
  LDI r11, 0xE6A1BB
  LDI r4, 1
  LDI r9, 1345
  LDI r14, 263
  LDI r15, 0xF11430
  CALL func_0
func_0:
  MOD r3, r12, r11
  SHL r5, r0, r7
  MOD r2, r3, r10
  OR r1, r5, r12
  MUL r5, r10, r13
  RET
  CALL func_1
func_1:
  SHL r6, r10, r0
  OR r14, r8, r10
  MUL r6, r8, r13
  RET
  CALL func_2
func_2:
  SUB r8, r7, r0
  SHR r15, r8, r14
  RET
  CALL func_3
func_3:
  AND r0, r10, r5
  XOR r16, r15, r13
  RET
  HALT
