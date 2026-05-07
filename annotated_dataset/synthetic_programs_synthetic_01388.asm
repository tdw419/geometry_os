; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls the subroutine `func_0`. Within `func_0`, it performs a series of bitwise operations including shifts, subtractions, ANDs, modular arithmetic, and XORs on these registers. The subroutine returns after executing these operations and halts the system.

; subroutine calls
; initialization
  LDI r10, 0x05A30E
  LDI r0, 32
  LDI r12, 1265
  LDI r6, 2712
  CALL func_0
func_0:
  SHL r10, r5, r2
  SUB r14, r28, r15
  AND r5, r10, r3
  MOD r8, r30, r14
  SHL r12, r2, r15
  XOR r11, r14, r24
  RET
  HALT
