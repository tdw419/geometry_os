; DESCRIPTION: Draws a green rectangle at (371, 15) with width 59 and height 110.
; PLAN: r0=371(x), r1=15(y), r2=59(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 15
LDI r2, 59
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
