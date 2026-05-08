; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then performs operations involving arithmetic, bitwise logic, and conditional branching, including a loop that multiplies register values and calls a function to perform additional logical operations before halting the system.

; mixed program
; initialization
  LDI r27, 2
  LDI r10, 0x7843D1
  LDI r1, 513
  LDI r3, 0xCEBF44
  LDI r0, 0xD6E394
  LDI r11, 3310
  LDI r12, 255
  LDI r4, 0x770212
; palette
  LDI r1, 0x70F3
  LDI r5, 1
  LDI r6, 0x444444
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x8800FF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xAAFF00
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xFFFFFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x888800
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xFF00FF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xFFFFFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x000000
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FFFF
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x880088
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0xAA00AA
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x0000CC
  STORE r1, r6
  ADD r1, r1, r5
  LDI r6, 0x00FF44
  STORE r1, r6
  ADD r1, r1, r5
  SHL r12, r10, r29
  LDI r12, 0x9707C8
  STORE r12, r6
  LOAD r4, r12
  LDI r6, 936
  STORE r6, r5
  LOAD r0, r6
  LDI r2, 1209
  STORE r2, r14
  LOAD r8, r2
  LDI r14, 0xD63420
  STORE r14, r12
  LOAD r11, r14
  LDI r0, 3099
  STORE r0, r8
  LOAD r4, r0
  LDI r6, 0xA98218
  STORE r6, r15
  LOAD r7, r6
  LDI r7, 0
  STORE r7, r0
  LOAD r12, r7
  LDI r13, 1359
  STORE r13, r14
  LOAD r11, r13
  LDI r4, 3887
  STORE r4, r11
  LOAD r17, r4
  CMP r13, r10
  LDI r4, 38
loop_0:
  MUL r6, r7, r4
  CMPI r10, r9, 128
  OR r2, r15, r9
  CMPI r9, r0, 0
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  CALL func_1
func_1:
  AND r14, r1, r8
  XOR r5, r8, r24
  RET
  HALT
