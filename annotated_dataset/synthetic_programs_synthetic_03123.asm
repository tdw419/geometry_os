; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs arithmetic operations. It includes conditional branching to call a function that modifies register values and conditionally draws text or a circle based on comparisons. Finally, it halts execution.

; mixed program
; initialization
  LDI r5, 4
  LDI r4, 1096
  LDI r3, 447
  LDI r8, 0xFB6E48
  LDI r10, 2375
  LDI r15, 2
  LDI r1, 2
  STORE r1, r2
  LOAD r4, r1
  LDI r14, 2538
  STORE r14, r11
  LOAD r7, r14
  LDI r8, 0x6B4117
  STORE r8, r9
  LOAD r1, r8
  LDI r7, 747
  STORE r7, r8
  LOAD r13, r7
  MUL r5, r8, r4
  IKEY r14
  CMPI r14, 2
  JNZ r14, key_0
  CALL func_1
func_1:
  XOR r10, r12, r5
  ADD r11, r2, r7
  ADD r2, r14, r8
  RET
  LDI r23, 1
  STORE r23, r7
  LOAD r8, r23
  LDI r10, 4060
  STORE r10, r11
  LOAD r13, r10
  LDI r2, 0xF4DDED
  STORE r2, r8
  LOAD r7, r2
  CMP r0, r10
  LDI r9, 0xC5013C
  LDI r13, 310
  LDI r24, 0x521E7A
  DRAWTEXT r9, r13, r24, "WORLD"
  CMP r4, r10
  JZ r4, else_2
  XOR r3, r0, r14
  JMP endif_3
else_2:
  LDI r8, 128
  LDI r11, 642
  LDI r5, 959
  LDI r3, 10
  CIRCLE r8, r11, r5, r3
  LDI r14, 255
  LDI r7, 10
  LDI r8, 0x5E33C5
  LDI r6, 0x43A004
  LDI r5, 2628
  RECTF r14, r7, r8, r6, r5
endif_3:
  HALT
