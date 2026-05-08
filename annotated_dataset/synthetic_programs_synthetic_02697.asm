; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a drawing loop where it compares a register value to a threshold, performs bitwise operations, and draws text on the screen using predefined coordinates and colors. The loop continuously updates the display with the text "WORLD" and "HELLO" until manually stopped.

; drawing loop program
; initialization
  LDI r15, 3853
  LDI r9, 0x80E2BB
  LDI r0, 2414
  LDI r5, 1113
  LDI r13, 0xA4FD0F
  LDI r4, 255
; palette
  LDI r7, 0x2472
  LDI r13, 1
  LDI r4, 0x8800FF
  STORE r7, r4
  ADD r7, r7, r13
  LDI r4, 0xAAAAAA
  STORE r7, r4
  ADD r7, r7, r13
  LDI r4, 0x000066
  STORE r7, r4
  ADD r7, r7, r13
  LDI r4, 0x00FF44
  STORE r7, r4
  ADD r7, r7, r13
main_0:
  CMPI r8, 0x22A4C8
  SAR r1, r12, r8
  SHLI r15, r2, 0x7836A4
  SHR r3, r10, r11
  AND r7, r3, r5
  LDI r1, 0xB0DB75
  LDI r7, 816
  LDI r8, 110
  DRAWTEXT r1, r7, r8, "WORLD"
  LDI r5, 3086
  LDI r9, 0
  LDI r12, 0xDD117E
  TEXT r5, r9, r12, "HELLO"
  FRAME
  JMP main_0
