; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls four subroutines (func_0, func_1, func_2, func_3) in sequence. Each subroutine performs a series of bitwise operations (SHR, SHL, XOR, AND), arithmetic operations (ADD, SUB), and register manipulations, ultimately halting the system after completing all subroutine calls.

; subroutine calls
; initialization
  LDI r2, 128
  LDI r11, 0xBA1C05
  LDI r5, 4
  LDI r10, 2789
  LDI r8, 0x95412A
  LDI r1, 0xFC7462
  LDI r9, 0x969D34
  CALL func_0
func_0:
  SHR r3, r9, r4
  SHL r1, r12, r7
  RET
  CALL func_1
func_1:
  SHL r1, r11, r16
  SHR r10, r0, r5
  XOR r7, r8, r1
  XOR r12, r10, r3
  OR r9, r21, r11
  RET
  CALL func_2
func_2:
  AND r3, r5, r10
  ADD r6, r7, r4
  SUB r8, r1, r9
  SHR r11, r9, r6
  RET
  CALL func_3
func_3:
  XOR r13, r6, r3
  SHR r1, r10, r6
  RET
  HALT
