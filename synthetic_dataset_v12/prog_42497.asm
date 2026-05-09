; DESCRIPTION: Draws a blue rectangle at (78, 37) with width 97 and height 15.
; PLAN: r0=78(x), r1=37(y), r2=97(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 37
LDI r2, 97
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
