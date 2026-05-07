; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a series of functions (`func_0`, `func_1`, `func_2`, `func_3`) that perform operations such as shifting, dividing, multiplying, subtracting, and logical operations on these registers. The code ultimately halts execution after completing all subroutine calls.

; subroutine calls
; initialization
  LDI r12, 0x27A263
  LDI r9, 128
  LDI r19, 1560
  LDI r7, 0xA46B36
  LDI r2, 3023
  LDI r14, 1927
  LDI r10, 0x11B312
  CALL func_0
func_0:
  SHR r7, r13, r8
  DIV r8, r0, r1
  MOD r7, r6, r0
  SHL r13, r3, r16
  SHL r11, r6, r1
  RET
  CALL func_1
func_1:
  MUL r5, r2, r1
  SHR r10, r7, r28
  SUB r3, r5, r6
  XOR r3, r1, r4
  DIV r8, r13, r6
  RET
  CALL func_2
func_2:
  ADD r7, r8, r5
  AND r8, r3, r12
  RET
  CALL func_3
func_3:
  XOR r3, r8, r0
  SHR r11, r4, r6
  RET
  HALT
