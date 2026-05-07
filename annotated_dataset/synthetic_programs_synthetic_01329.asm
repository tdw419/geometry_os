; DESCRIPTION: This GeOS assembly code initializes several registers and then calls three subroutines (`func_0`, `func_1`, `func_2`) in sequence. Each subroutine performs a series of operations including shifting, modular arithmetic, subtraction, bitwise operations (OR, XOR), and multiplication, before returning control to the main routine which eventually halts execution.

; subroutine calls
; initialization
  LDI r12, 128
  LDI r7, 10
  LDI r9, 1626
  LDI r6, 1866
  LDI r20, 0
  CALL func_0
func_0:
  SHR r0, r14, r13
  MOD r7, r11, r3
  SUB r11, r5, r12
  RET
  CALL func_1
func_1:
  MUL r14, r11, r6
  SUB r10, r7, r6
  MOD r10, r11, r13
  OR r2, r0, r12
  RET
  CALL func_2
func_2:
  SHR r13, r3, r8
  OR r2, r10, r3
  SUB r11, r14, r12
  XOR r9, r15, r5
  RET
  HALT
