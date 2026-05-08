; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then proceeds to call two subroutines (`func_0` and `func_1`). The first subroutine performs addition and multiplication operations, while the second subroutine executes bitwise OR and shift operations. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r0, 0x75D1EA
  LDI r13, 2
  LDI r14, 0xA6FB5D
  LDI r1, 16
  LDI r7, 1
  CALL func_0
func_0:
  ADD r2, r13, r10
  MUL r12, r9, r11
  RET
  CALL func_1
func_1:
  OR r6, r5, r8
  SHL r2, r3, r5
  OR r9, r8, r22
  RET
  HALT
