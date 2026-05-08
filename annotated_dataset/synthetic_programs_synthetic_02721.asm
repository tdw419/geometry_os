; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette in memory, performs arithmetic and logical operations, draws a circle on the screen, calls a subroutine (`func_0`), and then executes various memory load/store operations before halting.

; mixed program
; initialization
  LDI r3, 1113
  LDI r4, 2389
  LDI r5, 1
  LDI r9, 2613
; palette
  LDI r15, 0x60C9
  LDI r14, 1
  LDI r3, 0xAA00AA
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x00AAFF
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x0044FF
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x8800FF
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0xFFEE00
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x000000
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x8800FF
  STORE r15, r3
  ADD r15, r15, r14
  LDI r3, 0x0000FF
  STORE r15, r3
  ADD r15, r15, r14
  OR r2, r6, r13
  OR r9, r1, r6
  AND r14, r4, r3
  AND r0, r13, r11
  SHR r13, r3, r4
  LDI r17, 0
  LDI r11, 986
  LDI r14, 64
  LDI r1, 0xD57103
  CIRCLE r17, r11, r14, r1
  CALL func_0
func_0:
  MUL r6, r4, r13
  MUL r19, r11, r6
  SHR r2, r10, r1
  SHR r13, r28, r5
  SUB r13, r11, r10
  MUL r11, r7, r3
  RET
  LDI r15, 32
  STORE r15, r7
  LOAD r8, r15
  LDI r4, 8
  STORE r4, r11
  LOAD r8, r4
  LDI r7, 2196
  STORE r7, r7
  LOAD r14, r7
  LDI r9, 1
  STORE r9, r6
  LOAD r0, r9
  SAR r7, r18, r12
  SHL r5, r3, r9
  SHL r20, r5, r7
  SHL r10, r15, r12
  HALT
