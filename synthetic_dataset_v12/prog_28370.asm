; DESCRIPTION: Draws a green rectangle at (371, 136) with width 13 and height 119.
; PLAN: r0=371(x), r1=136(y), r2=13(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 136
LDI r2, 13
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
