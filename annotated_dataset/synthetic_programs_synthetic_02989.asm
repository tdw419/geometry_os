; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it repeatedly draws two circles on the screen using the `CIRCLE` instruction. The first circle is drawn at coordinates (r11, r12) with radius r7 and color r2, while the second circle is drawn at coordinates (r1, r5) with radius r14 and color r4. After drawing the circles, it calls `FRAME` to update the display and then jumps back to the start of the loop (`main_0`).

; input driven program
; initialization
  LDI r4, 8
  LDI r11, 3804
  LDI r10, 255
  LDI r1, 16
  LDI r2, 0xC1DC15
  LDI r12, 0xB70080
  LDI r6, 64
main_0:
  LDI r11, 4
  LDI r12, 0x0ABB94
  LDI r7, 469
  LDI r2, 0xF40B4F
  CIRCLE r11, r12, r7, r2
  LDI r1, 1
  LDI r5, 255
  LDI r14, 2696
  LDI r4, 0x1462C3
  CIRCLE r1, r5, r14, r4
  FRAME
  JMP main_0
