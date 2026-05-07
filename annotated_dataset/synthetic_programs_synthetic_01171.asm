; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine (`func_0`). Within the subroutine, it performs multiplication, shift right, division operations on these registers before returning. The `HALT` instruction indicates the end of execution.

; subroutine calls
; initialization
  LDI r0, 2519
  LDI r5, 64
  LDI r9, 128
  LDI r10, 4
  LDI r8, 0xD90F08
  LDI r3, 0x355F82
  CALL func_0
func_0:
  MUL r7, r9, r20
  SHR r0, r8, r9
  SHR r0, r12, r9
  DIV r6, r5, r10
  RET
  HALT
