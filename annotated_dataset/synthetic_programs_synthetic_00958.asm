; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. The subroutine performs arithmetic operations including subtraction, bitwise right shift, and division before returning and halting the execution.

; subroutine calls
; initialization
  LDI r10, 0xEB2E3B
  LDI r12, 45
  LDI r11, 1
  LDI r2, 0x63085D
  LDI r15, 3919
  LDI r7, 64
  LDI r20, 2615
  LDI r3, 3787
  CALL func_0
func_0:
  SUB r14, r5, r12
  SHR r4, r8, r5
  DIV r2, r5, r12
  RET
  HALT
