; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then performs a series of bitwise operations (OR, AND, SHR, SHL, SUB, XOR) within the `func_0` subroutine before returning to the caller. The HALT instruction is executed after the function call, terminating program execution.

; subroutine calls
; initialization
  LDI r6, 256
  LDI r0, 1975
  LDI r10, 1687
  CALL func_0
func_0:
  OR r11, r28, r21
  AND r7, r1, r10
  SHR r11, r4, r6
  SHL r15, r10, r9
  SUB r0, r1, r9
  XOR r24, r12, r6
  RET
  HALT
