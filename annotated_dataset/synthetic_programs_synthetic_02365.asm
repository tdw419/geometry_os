; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls three functions (`func_0`, `func_1`, `func_2`) that perform bitwise operations (such as shifts, XORs, ANDs) and modular arithmetic. The code halts execution after the last function call.

; subroutine calls
; initialization
  LDI r2, 738
  LDI r5, 255
  CALL func_0
func_0:
  SHL r0, r7, r13
  MOD r14, r4, r2
  MOD r10, r3, r4
  RET
  CALL func_1
func_1:
  MOD r5, r0, r9
  XOR r12, r9, r7
  XOR r3, r7, r2
  OR r15, r26, r8
  MOD r14, r10, r6
  MOD r14, r5, r8
  RET
  CALL func_2
func_2:
  XOR r9, r12, r5
  SHR r3, r2, r4
  SHL r4, r12, r13
  XOR r7, r12, r15
  AND r7, r0, r4
  RET
  HALT
