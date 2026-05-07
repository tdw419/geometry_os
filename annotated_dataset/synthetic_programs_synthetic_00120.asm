; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a subroutine (`func_0`). Within `func_0`, it performs bit shifting operations, multiplication, and modular arithmetic on the register values before returning to the main program.

; subroutine calls
; initialization
  LDI r5, 0xE76D62
  LDI r2, 255
  LDI r14, 3149
  LDI r13, 1260
  LDI r4, 4046
  CALL func_0
func_0:
  SHL r0, r5, r7
  SHL r8, r11, r12
  SHR r10, r1, r3
  MUL r5, r10, r8
  MOD r12, r11, r9
  MUL r4, r8, r7
  RET
  HALT
