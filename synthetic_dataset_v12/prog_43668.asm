; DESCRIPTION: Draws a blue rectangle at (88, 148) with width 97 and height 54.
; PLAN: r0=88(x), r1=148(y), r2=97(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 148
LDI r2, 97
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
