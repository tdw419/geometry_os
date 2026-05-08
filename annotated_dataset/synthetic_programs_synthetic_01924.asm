; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette in memory, and contains logic for handling keyboard input. It performs bitwise operations based on certain conditions and stores results back into registers, ultimately halting execution.

; mixed program
; initialization
  LDI r6, 2532
  LDI r11, 2648
  LDI r5, 1696
  LDI r4, 4
  LDI r14, 683
  LDI r12, 16
  LDI r2, 0x274386
  LDI r10, 0xACB44D
; palette
  LDI r6, 0x2272
  LDI r11, 1
  LDI r30, 0x8800FF
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x8800FF
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x880088
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x44FF00
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x0044FF
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0xAAAAAA
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x00FF00
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x00FFFF
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0x444444
  STORE r6, r30
  ADD r6, r6, r11
  LDI r30, 0xFF8800
  STORE r6, r30
  ADD r6, r6, r11
  CMP r2, r0
  CMPI r14, 1
  IKEY r15
  CMPI r15, 0xFF6EE3
  JNZ r15, key_0
  IKEY r27
  CMPI r27, 119
  JNZ r27, key_1
  SHL r14, r11, r7
  SHR r13, r1, r6
  SHL r3, r2, r10
  SHR r5, r11, r14
  LDI r9, 0x8E8AC1
  STORE r9, r8
  LOAD r5, r9
  LDI r8, 0x533560
  STORE r8, r0
  LOAD r9, r8
  LDI r6, 1177
  STORE r6, r6
  LOAD r9, r6
  LDI r9, 3587
  STORE r9, r2
  LOAD r30, r9
  LDI r15, 0
  STORE r15, r12
  LOAD r5, r15
  HALT
