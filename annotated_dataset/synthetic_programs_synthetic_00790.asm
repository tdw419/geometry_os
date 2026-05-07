; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a loop where it checks for user input. If the key 'R' (ASCII value 82) is pressed, it draws the text "WORLD" at coordinates specified by registers and updates the display frame before repeating the loop.

; drawing loop program
; initialization
  LDI r18, 0x23ADAA
  LDI r12, 2467
  LDI r26, 3704
  LDI r15, 10
main_0:
  ADD r15, r3, r13
  IKEY r4
  CMPI r4, 82
  JNZ r4, key_1
  LDI r1, 1585
  LDI r4, 10
  LDI r1, 0xA50686
  DRAWTEXT r1, r4, r1, "WORLD"
  FRAME
  JMP main_0
