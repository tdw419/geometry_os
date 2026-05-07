; DESCRIPTION: The GeOS assembly code initializes a drawing loop with specific register values and sets up a color palette. It then enters a main loop where it waits for a key press, performs various bitwise operations on registers, and uses the `FRAME` command to update the display.

; drawing loop program
; initialization
  LDI r0, 1912
  LDI r11, 0x2AD9AF
  LDI r15, 0x655CB9
  LDI r2, 0xEA7D75
  LDI r14, 1
  LDI r10, 0xE1B224
; palette
  LDI r3, 0x601A
  LDI r1, 1
  LDI r11, 0x00FF00
  STORE r3, r11
  ADD r3, r3, r1
  LDI r11, 0xFF4400
  STORE r3, r11
  ADD r3, r3, r1
  LDI r11, 0xFFAA00
  STORE r3, r11
  ADD r3, r3, r1
  LDI r11, 0x00FFAA
  STORE r3, r11
  ADD r3, r3, r1
main_0:
  IKEY r6
  CMPI r6, 1
  JNZ r6, key_1
  SHLI r13, r3, 64
  SHL r3, r12, r10
  ANDI r14, r13, 1
  CMPI r6, 0x24EA8D
  AND r6, r1, r13
  OR r26, r0, r4
  AND r3, r4, r13
  FRAME
  JMP main_0
