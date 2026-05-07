; DESCRIPTION: The GeOS assembly code initializes several registers with specific values, performs conditional comparisons, and executes different sets of operations based on these conditions. It includes arithmetic operations like addition and multiplication, bitwise shifts, and graphics drawing functions such as setting pixels and filling circles. The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r9, 157
  LDI r15, 255
  CMP r5, r14
  JNZ r5, else_0
  ADD r6, r10, r15
  SHR r11, r0, r10
  JMP endif_1
else_0:
  LDI r11, 156
  LDI r8, 2575
  LDI r5, 0x7789F5
  PSETI
  LDI r14, 2597
  LDI r10, 2775
  LDI r14, 64
  LDI r5, 64
  CIRCLE r14, r10, r14, r5
  LDI r1, 0x472E91
  FILL r1
endif_1:
  CMP r6, r3
  JZ r6, else_2
  MOD r13, r6, r14
  SHL r9, r0, r13
  MUL r13, r1, r16
  JMP endif_3
else_2:
  LDI r14, 10
  LDI r8, 1551
  LDI r4, 0x7E1C6B
  LDI r8, 1
  CIRCLE r14, r8, r4, r8
endif_3:
  CMP r2, r11
  JNZ r2, else_4
  OR r0, r8, r6
  JMP endif_5
else_4:
  LDI r6, 3588
  LDI r8, 3481
  LDI r12, 0x11880D
  PSET r6, r8, r12
  LDI r14, 606
  LDI r0, 1157
  LDI r6, 1841
  PSET r14, r0, r6
  LDI r14, 0x91092A
  LDI r5, 3315
  LDI r7, 3177
  PSET r14, r5, r7
endif_5:
  HALT
