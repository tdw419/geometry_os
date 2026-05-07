; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a loop where it fills the screen with a pattern, performs bitwise operations on multiple registers, and draws text onto the frame buffer before repeating the process indefinitely.

; drawing loop program
; initialization
  LDI r14, 8
  LDI r3, 2877
  LDI r7, 0xEA880B
  LDI r12, 0xB7F82B
  LDI r9, 3159
  LDI r10, 0xA69809
  LDI r13, 0xBA5676
; palette
  LDI r11, 0x600E
  LDI r10, 1
  LDI r5, 0xFF8800
  STORE r11, r5
  ADD r11, r11, r10
  LDI r5, 0x008888
  STORE r11, r5
  ADD r11, r11, r10
  LDI r5, 0x00AAFF
  STORE r11, r5
  ADD r11, r11, r10
  LDI r5, 0x00FFAA
  STORE r11, r5
  ADD r11, r11, r10
main_0:
  CMPI r15, 8
  LDI r11, 2
  FILL r11
  SHL r15, r13, r7
  SHLI r8, r12, 0xD47AAF
  SHL r13, r6, r15
  AND r3, r1, r10
  AND r28, r14, r5
  LDI r9, 255
  LDI r7, 0x3B24D4
  LDI r15, 256
  PSETI
  LDI r6, 0xD3185A
  LDI r13, 32
  LDI r1, 3494
  TEXT r6, r13, r1, "HELLO"
  FRAME
  JMP main_0
