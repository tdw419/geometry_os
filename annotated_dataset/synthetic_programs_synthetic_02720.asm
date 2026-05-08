; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs a series of bitwise operations (SHR, SHL, AND), arithmetic operations (SUB, DIV, MUL, ADD), and returns control to the main routine. The final instruction is HALT, which stops execution.

; subroutine calls
; initialization
  LDI r8, 32
  LDI r28, 1740
  LDI r7, 3408
  LDI r3, 0x66E999
  LDI r1, 0x236830
  LDI r12, 1716
  LDI r31, 0x604F0E
  CALL func_0
func_0:
  SHR r7, r3, r14
  SHR r8, r6, r4
  SHR r7, r6, r9
  SHR r2, r11, r3
  SUB r6, r2, r8
  DIV r10, r2, r0
  RET
  CALL func_1
func_1:
  SHL r15, r13, r1
  AND r1, r3, r4
  MUL r5, r8, r6
  RET
  CALL func_2
func_2:
  SHL r9, r8, r14
  DIV r12, r0, r2
  ADD r3, r6, r15
  DIV r11, r0, r12
  AND r10, r12, r2
  RET
  CALL func_3
func_3:
  DIV r2, r4, r5
  AND r13, r12, r16
  RET
  HALT
