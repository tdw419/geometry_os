; DESCRIPTION: This GeOS assembly code initializes several registers and calls a subroutine `func_0`, which performs arithmetic operations including XOR, MUL, DIV, SHL, and MOD. The routine manipulates the values in the registers to compute a result before returning and halting execution.

; subroutine calls
; initialization
  LDI r15, 3441
  LDI r1, 255
  LDI r4, 0
  LDI r10, 4
  CALL func_0
func_0:
  XOR r13, r15, r0
  MUL r8, r21, r5
  DIV r6, r14, r3
  MUL r13, r11, r6
  SHL r9, r15, r3
  MOD r7, r11, r13
  RET
  HALT
