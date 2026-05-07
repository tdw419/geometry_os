; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it draws the text "HELLO" and "WORLD" on a graphical display. The `FRAME` command is used to update the display after each iteration.

; drawing loop program
; initialization
  LDI r11, 2880
  LDI r4, 1158
  LDI r10, 0xCDCE1C
  LDI r1, 64
main_0:
  LDI r2, 0x6054D9
  LDI r1, 128
  LDI r3, 16
  TEXT r2, r1, r3, "HELLO"
  LDI r4, 32
  LDI r13, 128
  LDI r3, 3152
  DRAWTEXT r4, r13, r3, "WORLD"
  FRAME
  JMP main_0
