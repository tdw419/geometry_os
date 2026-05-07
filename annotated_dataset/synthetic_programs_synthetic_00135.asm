; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine named `func_0`. Inside `func_0`, it performs arithmetic operations including subtraction, addition, and division on the registers, and finally returns control to the caller. The program then halts execution.

; subroutine calls
; initialization
  LDI r13, 0xBE2BDC
  LDI r2, 3799
  LDI r15, 0x303A81
  LDI r1, 2782
  LDI r6, 0xC0395F
  LDI r4, 1412
  LDI r8, 437
  LDI r7, 0x4F9C00
  CALL func_0
func_0:
  SUB r15, r22, r3
  SUB r11, r6, r4
  ADD r6, r24, r4
  DIV r4, r15, r3
  RET
  HALT
