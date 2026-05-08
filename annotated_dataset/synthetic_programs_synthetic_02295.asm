; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. Inside `func_0`, it performs bitwise OR and XOR operations on the register values before returning control to the caller and halting execution.

; subroutine calls
; initialization
  LDI r14, 32
  LDI r1, 0
  LDI r12, 3828
  LDI r7, 1937
  LDI r5, 10
  LDI r6, 3791
  LDI r3, 0x47AFBD
  LDI r4, 0xDFB031
  CALL func_0
func_0:
  OR r9, r5, r7
  XOR r5, r8, r12
  RET
  HALT
