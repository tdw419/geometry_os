; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, displays the text "HELLO" on the screen at coordinates (3953, 32), and then enters a loop where it waits for a key press. If the key 'z' (ASCII value 142) is pressed, it performs bitwise operations and draws a rectangle with specific dimensions and color, before halting execution.

; mixed program
; initialization
  LDI r30, 4
  LDI r2, 32
  LDI r14, 4
  LDI r0, 0x486020
  LDI r1, 0xC7B3A0
  LDI r12, 4
  LDI r6, 3953
  LDI r15, 0x2BF555
; palette
  LDI r3, 0x4036
  LDI r5, 1
  LDI r14, 0x00AAFF
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0x880088
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0xDD0044
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0xAAAAAA
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0x0000FF
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0x00FF44
  STORE r3, r14
  ADD r3, r3, r5
  LDI r14, 0x00FFFF
  STORE r3, r14
  ADD r3, r3, r5
  LDI r6, 3522
  LDI r2, 64
  LDI r10, 10
  TEXT r6, r2, r10, "HELLO"
  LDI r13, 64
  STORE r13, r9
  LOAD r8, r13
  LDI r12, 762
  STORE r12, r6
  LOAD r11, r12
  LDI r11, 1160x6021
  STORE r11, r3
  LOAD r5, r11
  IKEY r5
  CMPI r5, 142
  JNZ r5, key_0
  SHL r10, r3, r14
  SHLI r8, r0, 4
  LDI r5, 0x656875
  LDI r13, 1068
  LDI r13, 0x3F815D
  LDI r15, 466
  LDI r4, 453
  RECTF r5, r13, r13, r15, r4
  PUSH r4
  DIV r5, r2, r13
  DIV r15, r4, r2
  OR r1, r15, r6
  POP r4
  AND r15, r7, r4
  OR r0, r31, r6
  CMP r15, r3
  HALT
