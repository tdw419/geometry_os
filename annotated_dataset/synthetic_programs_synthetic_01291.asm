; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then calls a function to perform bitwise operations and arithmetic calculations. In the `main_1` loop, it draws a rectangle and displays text before jumping back to the start of the loop.

; mixed program
; initialization
  LDI r9, 128
  LDI r13, 8
  LDI r5, 0x06C6F4
  LDI r12, 121
; palette
  LDI r12, 0x20E6
  LDI r9, 1
  LDI r6, 0x8800FF
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0x000000
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0x0044FF
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0xFFFFFF
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0x000000
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0x444444
  STORE r12, r6
  ADD r12, r12, r9
  LDI r6, 0x00FFFF
  STORE r12, r6
  ADD r12, r12, r9
  XOR r8, r13, r6
  AND r9, r2, r11
  OR r3, r10, r4
  MUL r7, r12, r5
  PUSH r10
  PUSH r5
  MUL r4, r1, r14
  MUL r4, r11, r7
  POP r5
  POP r10
  CALL func_0
func_0:
  AND r12, r14, r5
  MUL r5, r14, r4
  SUB r13, r8, r15
  OR r9, r6, r15
  RET
main_1:
  LDI r5, 0xDA4A4B
  LDI r0, 0xDA5DBD
  LDI r15, 64
  LDI r8, 2706
  LDI r7, 0x99A0B1
  RECTF r5, r0, r15, r8, r7
  AND r6, r1, r10
  XOR r8, r12, r14
  SUBI r1, r11, 226
  LDI r12, 0x4B0913
  LDI r2, 2
  LDI r20, 0xD36BFB
  TEXT r12, r2, r20, "HELLO"
  FRAME
  JMP main_1
