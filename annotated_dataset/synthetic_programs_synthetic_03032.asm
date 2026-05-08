; DESCRIPTION: This GeOS assembly code initializes various registers and sets up a color palette. It then enters a loop where it checks for a specific key press (likely 't' with ASCII value 116). If the key is pressed, it performs arithmetic operations involving shifts and adds before halting the program.

; mixed program
; initialization
  LDI r0, 0x527B5C
  LDI r13, 10
  LDI r30, 1
  LDI r14, 0xAD91D2
  LDI r11, 4
  LDI r10, 1
; palette
  LDI r0, 0x2401
  LDI r14, 1
  LDI r9, 0xAAFF00
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0xFFEE00
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0xFFEE00
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0xFF4400
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0x0000FF
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0x00FF00
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0x00FFFF
  STORE r0, r9
  ADD r0, r0, r14
  LDI r9, 0x550077
  STORE r0, r9
  ADD r0, r0, r14
  PUSH r8
  PUSH r15
  PUSH r10
  PUSH r3
  SUB r7, r0, r21
  DIV r4, r24, r6
  POP r3
  POP r10
  POP r15
  POP r8
  XOR r13, r11, r0
  IKEY r13
  CMPI r13, 116
  JNZ r13, key_0
  ADD r1, r6, r8
  SHL r9, r7, r11
  HALT
