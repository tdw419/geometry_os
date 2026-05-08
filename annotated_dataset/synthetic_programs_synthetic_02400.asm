; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`) which perform arithmetic and bitwise operations on the registers. Finally, it halts execution.

; subroutine calls
; initialization
  LDI r15, 0xCE489A
  LDI r6, 0xD2C39B
  LDI r11, 3982
  CALL func_0
func_0:
  SUB r14, r10, r18
  ADD r5, r2, r12
  XOR r0, r7, r5
  MOD r5, r10, r6
  AND r14, r18, r13
  XOR r6, r5, r7
  RET
  CALL func_1
func_1:
  AND r15, r11, r16
  OR r13, r7, r3
  SUB r5, r7, r0
  OR r15, r0, r2
  MOD r15, r7, r8
  RET
  CALL func_2
func_2:
  MUL r10, r12, r6
  SHR r15, r5, r11
  RET
  CALL func_3
func_3:
  SHL r15, r9, r1
  SUB r12, r15, r14
  ADD r1, r31, r5
  MOD r14, r15, r10
  RET
  HALT
