; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it compares two values, loads specific addresses into registers, draws the text "WORLD" at a predefined location, refreshes the frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r14, 899
  LDI r10, 64
  LDI r8, 64
main_0:
  CMPI r6, r7, 22
  LDI r11, 0x6FC757
  LDI r6, 128
  LDI r11, 0x031926
  DRAWTEXT r11, r6, r11, "WORLD"
  FRAME
  JMP main_0
