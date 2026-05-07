; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls two subroutines, `func_0` and `func_1`. In `func_0`, it performs addition, modulus, and subtraction operations on the register values. In `func_1`, it executes bitwise AND, addition, and subtraction operations before halting the system.

; subroutine calls
; initialization
  LDI r9, 0x6E2242
  LDI r12, 256
  LDI r3, 0xDDB303
  LDI r30, 3370
  LDI r0, 0x311357
  LDI r5, 0
  CALL func_0
func_0:
  ADD r9, r10, r0
  MOD r0, r6, r8
  SUB r10, r0, r9
  RET
  CALL func_1
func_1:
  AND r7, r8, r15
  ADD r7, r30, r9
  ADD r7, r0, r5
  AND r14, r4, r0
  SUB r7, r11, r5
  RET
  HALT
