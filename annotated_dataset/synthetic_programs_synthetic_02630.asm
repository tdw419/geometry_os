; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls two subroutines. The first subroutine (`func_0`) performs multiplication, addition, shift, bitwise AND operations on the registers, while the second subroutine (`func_1`) executes shifts on a register before halting the program.

; subroutine calls
; initialization
  LDI r7, 3676
  LDI r11, 0xE7DD90
  LDI r2, 3771
  LDI r18, 32
  LDI r3, 0x3E428F
  LDI r0, 16
  LDI r5, 3849
  CALL func_0
func_0:
  MUL r14, r10, r12
  ADD r1, r3, r5
  SHR r2, r5, r6
  SHR r14, r3, r2
  AND r14, r1, r8
  RET
  CALL func_1
func_1:
  SHL r4, r7, r5
  SHR r7, r5, r13
  RET
  HALT
