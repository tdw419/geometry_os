; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two subroutines, `func_0` and `func_1`. In `func_0`, it performs bitwise OR and XOR operations on registers before returning. In `func_1`, it multiplies two registers, shifts the result left by a value in another register, performs a bitwise AND, adds to a fourth register, and then returns. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r3, 226
  LDI r13, 0x004598
  LDI r5, 0x63EFDC
  LDI r14, 128
  LDI r15, 0x802A32
  LDI r4, 64
  LDI r7, 0xD996A8
  CALL func_0
func_0:
  OR r5, r15, r0
  XOR r5, r1, r4
  RET
  CALL func_1
func_1:
  MUL r0, r8, r6
  SHL r15, r6, r5
  AND r4, r0, r2
  ADD r5, r4, r14
  RET
  HALT
