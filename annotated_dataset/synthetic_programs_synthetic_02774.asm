; DESCRIPTION: The GeOS assembly code initializes registers and calls two subroutines. In `func_0`, it performs bitwise operations (XOR, ADD, MUL, MOD, AND), while in `func_1` it executes additional bitwise operations (XOR, SHL) before halting the system.

; subroutine calls
; initialization
  LDI r5, 2121
  LDI r0, 256
  CALL func_0
func_0:
  XOR r12, r3, r1
  ADD r0, r14, r5
  MUL r6, r10, r9
  MOD r8, r6, r10
  AND r6, r13, r4
  RET
  CALL func_1
func_1:
  XOR r13, r10, r4
  SHL r12, r15, r9
  RET
  HALT
