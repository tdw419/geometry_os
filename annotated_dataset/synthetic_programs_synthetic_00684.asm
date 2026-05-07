; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it calculates a value by subtracting `0xC521C8` from `r2`, sets up parameters for displaying text, prints "HELLO" on the screen, draws a frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r12, 1
  LDI r15, 0xF13F18
main_0:
  SUBI r4, r2, 0xC521C8
  LDI r14, 16
  LDI r11, 255
  LDI r7, 32
  TEXT r14, r11, r7, "HELLO"
  FRAME
  JMP main_0
