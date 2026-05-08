; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic and logical operations such as shifts, XORs, and division, and calls a function `func_0` which executes further operations including shifts, additions, conditional jumps, and pixel drawing. The program halts after executing the last instruction.

; mixed program
; initialization
  LDI r15, 0x2058AD
  LDI r4, 0x8B744E
  LDI r2, 866
  LDI r13, 0x764727
  LDI r2, 0
  STORE r2, r15
  LOAD r7, r2
  LDI r15, 2
  STORE r15, r1
  LOAD r0, r15
  LDI r7, 128
  STORE r7, r10
  LOAD r13, r7
  LDI r2, 1277
  STORE r2, r12
  LOAD r10, r2
  CALL func_0
func_0:
  SHL r5, r13, r6
  XOR r0, r15, r1
  SHR r14, r25, r0
  DIV r12, r8, r5
  SHL r0, r10, r4
  ADD r8, r6, r4
  RET
  IKEY r8
  CMPI r8, 174
  JNZ r8, key_1
  LDI r0, 1499
  STORE r0, r7
  LOAD r15, r0
  LDI r10, 3575
  STORE r10, r10
  LOAD r4, r10
  CMP r6, r20
  LDI r13, 2
  STORE r13, r2
  LOAD r5, r13
  LDI r7, 1249
  STORE r7, r9
  LOAD r10, r7
  LDI r14, 0xF8D905
  STORE r14, r12
  LOAD r29, r14
  CMP r12, r15
  JZ r12, else_2
  AND r14, r2, r24
  SHR r7, r6, r5
  SHR r6, r4, r3
  JMP endif_3
else_2:
  LDI r7, 2
  FILL r7
  LDI r1, 4
  FILL r1
  LDI r2, 3747
  LDI r11, 3240
  LDI r8, 277
  WPIXEL
endif_3:
  CMP r10, r4
  JNZ r10, else_4
  MOD r11, r10, r4
  MOD r3, r15, r2
  SUB r9, r30, r7
  AND r5, r2, r13
  JMP endif_5
else_4:
  LDI r4, 32
  FILL r4
endif_5:
  HALT
