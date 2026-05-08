; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs logical operations like XOR and AND, stores and loads data between registers and memory addresses, and prints the string "HELLO". It then halts execution.

; mixed program
; initialization
  LDI r7, 16
  LDI r4, 0x7E5D88
  LDI r15, 16
  LDI r8, 10
  LDI r3, 1171
  LDI r6, 0xCEC2B0
  LDI r12, 1101
  TEXT r3, r6, r12, "HELLO"
  XOR r10, r8, r2
  AND r11, r8, r10
  LDI r2, 16
  STORE r2, r3
  LOAD r8, r2
  LDI r13, 32
  STORE r13, r7
  LOAD r3, r13
  LDI r7, 2002
  STORE r7, r15
  LOAD r14, r7
  LDI r2, 2
  STORE r2, r1
  LOAD r7, r2
  LDI r13, 0xC806DD
  STORE r13, r3
  LOAD r1, r13
  HALT
