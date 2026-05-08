; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it draws the text "WORLD" at a specified position on the screen. It then performs a series of bit shift operations and jumps back to the beginning of the loop, continuously refreshing the display.

; input driven program
; initialization
  LDI r13, 3233
  LDI r3, 2074
  LDI r7, 568
  LDI r1, 128
  LDI r5, 255
  LDI r11, 2332
main_0:
  LDI r0, 4
  LDI r7, 770
  LDI r1, 2363
  DRAWTEXT r0, r7, r1, "WORLD"
  SHLI r8, r2, 255
  SAR r8, r14, r11
  SAR r8, r5, r3
  SAR r0, r9, r12
  FRAME
  JMP main_0
