; DESCRIPTION: This GeOS assembly code initializes several registers and sets up a color palette. It then enters a loop where it performs bitwise operations, checks for a specific key input, and conditionally executes drawing commands such as `FILL`, `PSET`, and `CIRCLE`. The program halts after completing the loop.

; mixed program
; initialization
  LDI r13, 1
  LDI r7, 1041
  LDI r2, 256
  LDI r21, 3650
  LDI r0, 32
  LDI r12, 3524
  LDI r5, 0
  LDI r1, 1
; palette
  LDI r13, 0x8014
  LDI r5, 1
  LDI r6, 0x0044FF
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xFF4400
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xFF4400
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xFF00FF
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xDD0044
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xAAFF00
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0xFFFFFF
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0x00FF44
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0x000000
  STORE r13, r6
  ADD r13, r13, r5
  LDI r6, 0x444444
  STORE r13, r6
  ADD r13, r13, r5
  SAR r0, r10, r7
  SHL r7, r8, r5
  SAR r14, r5, r2
  IKEY r9
  CMPI r9, 0x576A25
  JNZ r9, key_0
  XOR r6, r23, r0
  OR r14, r13, r0
  XOR r15, r6, r11
  PUSH r22
  PUSH r2
  SHL r5, r10, r7
  OR r8, r11, r7
  AND r10, r6, r5
  POP r2
  POP r22
  LDI r7, 0x291E57
  FILL r7
  CMP r8, r13
  JNZ r8, else_1
  SUB r2, r9, r7
  MOD r6, r2, r15
  JMP endif_2
else_1:
  LDI r3, 128
  LDI r29, 371
  LDI r10, 0xCDEC7C
  PSET r3, r29, r10
  LDI r7, 64
  LDI r4, 4
  LDI r1, 2
  LDI r13, 0x585009
  CIRCLE r7, r4, r1, r13
  LDI r14, 0x087372
  FILL r14
endif_2:
  LDI r2, 2
loop_3:
  ADDI r9, r7, 0x208822
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_3
  HALT
