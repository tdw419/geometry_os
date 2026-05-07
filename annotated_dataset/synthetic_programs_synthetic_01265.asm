; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls two subroutines, `func_0` and `func_1`. Each subroutine performs a series of arithmetic and logical operations on the registers before returning. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r11, 2493
  LDI r12, 1411
  LDI r10, 128
  LDI r13, 3968
  LDI r2, 0x0311C9
  CALL func_0
func_0:
  SUB r17, r3, r15
  ADD r2, r9, r6
  XOR r14, r10, r13
  MUL r14, r31, r13
  RET
  CALL func_1
func_1:
  AND r8, r6, r12
  AND r6, r12, r0
  SUB r10, r0, r8
  OR r12, r10, r11
  DIV r10, r11, r5
  RET
  HALT
