; DESCRIPTION: Draws a blue rectangle at (58, 97) with width 79 and height 119.
; PLAN: r0=58(x), r1=97(y), r2=79(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 97
LDI r2, 79
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
