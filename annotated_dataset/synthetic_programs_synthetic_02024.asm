; DESCRIPTION: This GeOS assembly code initializes a drawing program by setting up color and coordinate registers, then draws two rectangles and a line on the screen before halting execution.

; simple draw program
; initialization
  LDI r2, 0xA1B09B
  LDI r1, 1607
  LDI r7, 0x91A399
  LDI r15, 2479
  LDI r7, 157
  LDI r4, 0
  LDI r12, 255
  RECTF r7, r15, r7, r4, r12
  LDI r4, 0x6213CB
  LDI r11, 3975
  LDI r11, 0x434139
  LDI r3, 0x39D788
  LDI r1, 2612
  RECTF r4, r11, r11, r3, r1
  LDI r15, 0x0F5728
  LDI r10, 3719
  LDI r11, 2
  LDI r14, 32
  LDI r7, 0x159B8E
  LINE r15, r10, r11, r14, r7
  HALT
