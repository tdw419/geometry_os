; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it draws the text "WORLD" at a certain position on the screen. It also performs bitwise operations involving XOR and OR between registers before refreshing the display frame and jumping back to the start of the loop.

; input driven program
; initialization
  LDI r4, 1271
  LDI r1, 0xE0F140
  LDI r5, 3477
  LDI r7, 0x1E7005
  LDI r15, 2
main_0:
  LDI r2, 0x646F08
  LDI r30, 3690
  LDI r7, 907
  DRAWTEXT r2, r30, r7, "WORLD"
  XOR r25, r14, r6
  OR r1, r6, r11
  FRAME
  JMP main_0
