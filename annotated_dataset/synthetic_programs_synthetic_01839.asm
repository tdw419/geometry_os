; DESCRIPTION: This GeOS assembly code initializes a palette with various colors, then draws a circle and two text strings ("WORLD" and "HELLO") on the screen. The program continuously updates the display in a loop by jumping back to `main_2`.

; mixed program
; initialization
  LDI r7, 128
  LDI r24, 1619
; palette
  LDI r8, 0x2424
  LDI r3, 1
  LDI r10, 0x008888
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x00FFAA
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x00FFAA
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xFF4400
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xAAFF00
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x0000CC
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xAAFF00
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x880088
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x0000FF
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0x44FF00
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xFF00FF
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xFFFF00
  STORE r8, r10
  ADD r8, r8, r3
  LDI r10, 0xFF00FF
  STORE r8, r10
  ADD r8, r8, r3
  AND r13, r12, r7
  OR r12, r4, r1
  AND r9, r12, r10
  XOR r6, r0, r2
  CMP r29, r2
  JNZ r29, else_0
  SHL r3, r14, r0
  JMP endif_1
else_0:
  LDI r3, 1022
  LDI r9, 2912
  LDI r9, 10
  LDI r5, 32
  CIRCLE r3, r9, r9, r5
endif_1:
  PUSH r6
  PUSH r6
  PUSH r5
  SHL r3, r14, r7
  AND r4, r2, r11
  OR r8, r6, r25
  ADD r15, r5, r14
  POP r5
  POP r6
  POP r6
main_2:
  LDI r10, 64
  LDI r6, 907
  LDI r6, 255
  DRAWTEXT r10, r6, r6, "WORLD"
  LDI r6, 2753
  LDI r5, 10
  LDI r13, 0x03BE97
  TEXT r6, r5, r13, "HELLO"
  SUB r5, r4, r14
  FRAME
  JMP main_2
