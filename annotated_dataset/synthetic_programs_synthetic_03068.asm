; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a loop where it performs bitwise operations and arithmetic calculations. The program draws shapes such as circles and lines using the PSETI and CIRCLE instructions, conditional branches, and function calls based on key input.

; mixed program
; initialization
  LDI r8, 128
  LDI r0, 10
  LDI r3, 0x455D23
  LDI r11, 0xF6BB71
  LDI r4, 1
  LDI r13, 0
; palette
  LDI r10, 0x5089
  LDI r9, 1
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0xAAAAAA
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x8800FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0xAAAAAA
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x8800FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x888800
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0xDD0044
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0xFFAA00
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r9
  LDI r0, 0xFFFF00
  STORE r10, r0
  ADD r10, r10, r9
  LDI r5, 0xB8D266
loop_0:
  AND r1, r8, r31
  LDI r6, 1
  SUB r5, r5, r6
  JNZ r5, loop_0
  PUSH r6
  OR r3, r2, r15
  MOD r12, r1, r5
  AND r15, r6, r7
  MOD r5, r0, r6
  XOR r4, r11, r8
  POP r6
  LDI r4, 256
loop_1:
  ADDI r15, r0, 209
  AND r5, r7, r29
  ADDI r2, r1, 16
  LDI r28, 0xBF5E1F
  LDI r14, 128
  LDI r6, 8
  PSETI
  LDI r7, 1
  SUB r4, r4, r7
  JNZ r4, loop_1
  CMP r13, r4
  JNZ r13, else_2
  ADD r0, r11, r13
  SHR r4, r7, r9
  JMP endif_3
else_2:
  LDI r2, 1
  LDI r1, 0x96E5F7
  LDI r11, 0x949FD9
  LDI r10, 128
  CIRCLE r2, r1, r11, r10
  LDI r3, 4091
  LDI r7, 2889
  LDI r7, 4
  LDI r11, 0x212C2C
  LDI r14, 0x88659B
  LINE r3, r7, r7, r11, r14
  LDI r11, 1716
  LDI r4, 1366
  LDI r13, 2180
  LDI r8, 124
  CIRCLE r11, r4, r13, r8
  LDI r13, 3721
  LDI r10, 256
  LDI r15, 1225
  PSET r13, r10, r15
endif_3:
  IKEY r5
  CMPI r5, 8
  JNZ r5, key_4
  CALL func_5
func_5:
  SUB r1, r9, r13
  SUB r0, r3, r4
  MUL r14, r31, r9
  SHR r7, r13, r2
  RET
  HALT
