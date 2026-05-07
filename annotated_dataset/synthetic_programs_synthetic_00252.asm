; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and draws rectangles and text on the screen in a loop. It includes operations for bitwise logic, arithmetic, and memory manipulation to create visual effects and display messages.

; mixed program
; initialization
  LDI r7, 2648
  LDI r1, 0x6B5E74
  LDI r10, 3805
  LDI r3, 128
; palette
  LDI r0, 0x21EE
  LDI r1, 1
  LDI r9, 0x000000
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0xFFFF00
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0xAA00AA
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0xFF4400
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0xFF8800
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0x00FF00
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0x00FFFF
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0x0044FF
  STORE r0, r9
  ADD r0, r0, r1
  LDI r9, 0x000000
  STORE r0, r9
  ADD r0, r0, r1
  XOR r15, r10, r0
  XOR r3, r1, r14
  AND r12, r9, r4
  OR r13, r19, r3
  LDI r4, 0x73B1BB
loop_0:
  ANDI r8, r4, 0xC5AA73
  LDI r6, 873
  LDI r12, 3617
  LDI r13, 2948
  LDI r14, 0x2697B9
  LDI r18, 0xDF9E43
  RECTF r6, r12, r13, r14, r18
  MUL r25, r14, r10
  LDI r15, 1
  SUB r4, r4, r15
  JNZ r4, loop_0
  SUB r24, r3, r8
main_1:
  CMPI r7, 0
  SHL r15, r6, r2
  SHLI r5, r20, 3
  SHR r6, r31, r11
  CMPI r18, r7, 0xAECDBF
  LDI r11, 4
  LDI r9, 0xC6D71E
  LDI r0, 6
  DRAWTEXT r11, r9, r0, "WORLD"
  XOR r1, r6, r8
  AND r7, r12, r6
  AND r10, r8, r14
  LDI r0, 3491
  LDI r15, 0xC13108
  LDI r8, 32
  TEXT r0, r15, r8, "HELLO"
  FRAME
  JMP main_1
