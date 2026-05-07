; DESCRIPTION: The GeOS assembly code initializes registers with specific values, sets up a color palette, and performs various arithmetic operations including addition, subtraction, multiplication, and division. It also includes conditional branching and function calls to manipulate data and perform graphical operations like drawing lines. The program ultimately halts execution after completing its tasks.

; mixed program
; initialization
  LDI r15, 83
  LDI r9, 101
  LDI r5, 255
; palette
  LDI r8, 0x40BB
  LDI r12, 1
  LDI r14, 0x0044FF
  STORE r8, r14
  ADD r8, r8, r12
  LDI r14, 0x0000FF
  STORE r8, r14
  ADD r8, r8, r12
  LDI r14, 0x0044FF
  STORE r8, r14
  ADD r8, r8, r12
  LDI r14, 0xFF4400
  STORE r8, r14
  ADD r8, r8, r12
  LDI r14, 0x0044FF
  STORE r8, r14
  ADD r8, r8, r12
  LDI r3, 16
  STORE r3, r6
  LOAD r2, r3
  LDI r11, 64
  STORE r11, r4
  LOAD r23, r11
  LDI r6, 3026
  STORE r6, r10
  LOAD r9, r6
  CALL func_0
func_0:
  ADD r13, r9, r11
  SUB r3, r4, r1
  ADD r22, r8, r4
  OR r9, r1, r5
  RET
  CALL func_1
func_1:
  MUL r0, r15, r24
  MOD r1, r0, r10
  SHR r15, r1, r13
  MOD r12, r4, r20
  SUB r13, r5, r14
  XOR r9, r10, r6
  RET
  LDI r6, 255
  STORE r6, r10
  LOAD r3, r6
  LDI r0x22857, 0xBCE60x22850x2285
  STORE r17, r31
  LOAD r8, r17
  LDI r1, 0
  STORE r1, r12
  LOAD r15, r1
  LDI r7, 1090
  STORE r7, r11
  LOAD r5, r7
  LDI r4, 0x4514F3
  STORE r4, r6
  LOAD r2, r4
  CMP r6, r1
  PUSH r8
  PUSH r12
  PUSH r15
  PUSH r11
  DIV r6, r9, r15
  AND r12, r6, r1
  XOR r7, r1, r6
  MUL r0, r6, r29
  XOR r15, r7, r3
  POP r11
  POP r15
  POP r12
  POP r8
  LDI r11, 0
  STORE r11, r4
  LOAD r9, r11
  LDI r2, 2015
  STORE r2, r9
  LOAD r7, r2
  LDI r6, 0xB7A529
  STORE r6, r14
  LOAD r10, r6
  LDI r0, 0xD5D545
  STORE r0, r11
  LOAD r7, r0
  LDI r13, 1
  STORE r13, r0
  LOAD r5, r13
  CMP r21, r9
  JZ r21, else_2
  MOD r13, r10, r4
  SHR r9, r5, r12
  DIV r21, r12, r5
  DIV r15, r8, r13
  JMP endif_3
else_2:
  LDI r12, 1558
  LDI r2, 0x30FBD2
  LDI r0, 0
  LDI r2, 3034
  LDI r10, 2966
  LINE r12, r2, r0, r2, r10
endif_3:
  HALT
