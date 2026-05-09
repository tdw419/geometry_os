; DESCRIPTION: Draws a blue rectangle at (15, 97) with width 54 and height 69.
; PLAN: r0=15(x), r1=97(y), r2=54(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 97
LDI r2, 54
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
