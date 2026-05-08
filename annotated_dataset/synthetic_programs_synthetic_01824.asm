; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. Inside `func_0`, it performs multiplication, addition, and bitwise AND operations on the registers before returning. The program halts after executing the subroutine.

; subroutine calls
; initialization
  LDI r3, 0x2BF9AF
  LDI r8, 3079
  LDI r4, 3012
  LDI r0, 717
  LDI r9, 0x69B199
  LDI r11, 0
  LDI r14, 1224
  CALL func_0
func_0:
  MUL r7, r12, r8
  ADD r2, r10, r4
  AND r5, r10, r0
  RET
  HALT
