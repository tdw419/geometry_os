; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls functions to perform arithmetic operations including division and multiplication, stores results in memory, and compares values. The program ultimately halts after performing these operations.

; mixed program
; initialization
  LDI r10, 2800
  LDI r1, 70
  LDI r5, 2643
  LDI r0, 0x1B5E6E
  LDI r7, 1622
  CALL func_0
func_0:
  DIV r12, r14, r26
  MUL r3, r7, r11
  DIV r8, r5, r3
  XOR r2, r13, r1
  MUL r8, r22, r13
  RET
  LDI r13, 2492
  STORE r13, r18
  LOAD r5, r13
  LDI r7, 10
  STORE r7, r1
  LOAD r9, r7
  LDI r9, 16
  STORE r9, r9
  LOAD r4, r9
  LDI r14, 0x9BB4A2
  STORE r14, r11
  LOAD r10, r14
  CALL func_1
func_1:
  DIV r15, r10, r9
  MUL r2, r4, r5
  RET
  LDI r11, 255
  STORE r11, r8
  LOAD r7, r11
  LDI r30, 2035
  STORE r30, r4
  LOAD r10, r30
  CMP r3, r10
  LDI r1, 0xFCDCE6
  STORE r1, r7
  LOAD r4, r1
  LDI r0, 1
  STORE r0, r1
  LOAD r7, r0
  LDI r7, 4
  STORE r7, r11
  LOAD r10, r7
  LDI r4, 0
  STORE r4, r2
  LOAD r13, r4
  HALT
