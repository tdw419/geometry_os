; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it checks for key input. If the key '1' (ASCII value 49) is pressed, it draws the text "WORLD" at coordinates (304, 8) in color 0xF4866F on the screen, then refreshes the frame and repeats the loop.

; drawing loop program
; initialization
  LDI r4, 8
  LDI r12, 0xB2A2F6
  LDI r6, 3086
  LDI r9, 0xA1F255
  LDI r2, 0x14B6CD
  LDI r3, 2642
  LDI r21, 1430
  LDI r5, 0x57C4A0
main_0:
  IKEY r9
  CMPI r9, 128
  JNZ r9, key_1
  LDI r11, 304
  LDI r12, 8
  LDI r3, 0xF4866F
  DRAWTEXT r11, r12, r3, "WORLD"
  FRAME
  JMP main_0
