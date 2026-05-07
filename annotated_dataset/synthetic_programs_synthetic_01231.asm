; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a series of subroutines (`func_0`, `func_1`, `func_2`). Each subroutine performs bitwise operations (such as shift, XOR, OR), arithmetic operations (like addition, modulo), and finally halts the system after all subroutines have executed.

; subroutine calls
; initialization
  LDI r12, 3256
  LDI r4, 3946
  LDI r9, 256
  LDI r3, 0x6A55EB
  LDI r13, 8
  LDI r8, 4
  LDI r15, 16
  CALL func_0
func_0:
  SHR r2, r13, r4
  SHR r4, r13, r10
  SHR r11, r1, r5
  RET
  CALL func_1
func_1:
  XOR r8, r6, r13
  OR r8, r5, r10
  RET
  CALL func_2
func_2:
  XOR r14, r3, r9
  ADD r8, r1, r13
  SHL r7, r15, r12
  MOD r5, r4, r13
  RET
  HALT
