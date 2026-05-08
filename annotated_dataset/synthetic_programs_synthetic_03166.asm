; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls a subroutine `func_0`, which performs left shift operations on two registers using other specified registers as shift amounts. The program then halts execution.

; subroutine calls
; initialization
  LDI r8, 0xD5F406
  LDI r10, 0x48D996
  LDI r16, 16
  LDI r0, 4
  CALL func_0
func_0:
  SHL r7, r8, r12
  SHL r6, r5, r11
  RET
  HALT
