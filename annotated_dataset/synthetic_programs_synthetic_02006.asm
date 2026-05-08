; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs arithmetic operations (addition, subtraction, multiplication) on these registers. The final function halts the execution.

; subroutine calls
; initialization
  LDI r4, 0x12C290
  LDI r2, 2
  LDI r7, 0x798125
  LDI r3, 1675
  LDI r20, 3706
  CALL func_0
func_0:
  SUB r7, r6, r8
  ADD r13, r6, r14
  ADD r9, r12, r8
  RET
  CALL func_1
func_1:
  MUL r15, r3, r12
  SUB r1, r12, r2
  MUL r0, r8, r3
  SUB r12, r15, r5
  AND r9, r8, r2
  ADD r29, r1, r0
  RET
  CALL func_2
func_2:
  SUB r15, r1, r11
  MUL r2, r11, r8
  RET
  CALL func_3
func_3:
  SUB r2, r11, r14
  SUB r4, r3, r15
  RET
  HALT
