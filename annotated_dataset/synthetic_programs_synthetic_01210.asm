; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine named `func_0`. Within the subroutine, it performs bitwise OR and XOR operations on these registers before returning to the caller.

; subroutine calls
; initialization
  LDI r13, 0x798605
  LDI r4, 146
  LDI r14, 2
  LDI r6, 0xBF5647
  LDI r11, 1599
  LDI r10, 256
  CALL func_0
func_0:
  OR r13, r12, r16
  OR r2, r6, r5
  XOR r12, r5, r11
  RET
  HALT
