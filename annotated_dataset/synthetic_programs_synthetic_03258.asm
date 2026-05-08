; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a function (`func_0`) that performs bit shifting, division, and XOR operations. It then checks a key value against `0x78EDCB` and, if matched, executes a text display routine for "HELLO" and another function (`func_2`). The program halts after execution.

; mixed program
; initialization
  LDI r12, 0x95434C
  LDI r7, 50
  LDI r4, 0xB926EB
  LDI r14, 4
  LDI r0, 3962
  LDI r9, 255
  LDI r2, 255
  CALL func_0
func_0:
  SHL r12, r0, r8
  SHL r3, r9, r11
  DIV r10, r13, r12
  RET
  LDI r19, 0x4BDD42
  STORE r19, r2
  LOAD r13, r19
  LDI r2, 16
  STORE r2, r10
  LOAD r9, r2
  LDI r0, 290x80CD3
  STORE r0, r3
  LOAD r11, r0
  XOR r13, r5, r15
  XOR r8, r5, r10
  XOR r8, r13, r1
  IKEY r1
  CMPI r1, 0x78EDCB
  JNZ r1, key_1
  LDI r8, 2
  LDI r5, 255
  LDI r9, 1797
  TEXT r8, r5, r9, "HELLO"
  CALL func_2
func_2:
  DIV r11, r2, r9
  DIV r9, r12, r0
  OR r14, r5, r7
  ADD r15, r3, r16
  SHR r14, r0, r9
  RET
  HALT
