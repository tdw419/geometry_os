; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls a subroutine (`func_0`). Within the subroutine, it performs arithmetic operations including addition, division, and bit shifting on various registers, then returns and halts execution.

; subroutine calls
; initialization
  LDI r6, 0x49124F
  LDI r3, 2001
  LDI r10, 256
  CALL func_0
func_0:
  ADD r21, r0, r10
  DIV r6, r11, r22
  ADD r14, r1, r3
  SHR r14, r1, r2
  SHL r10, r4, r5
  RET
  HALT
