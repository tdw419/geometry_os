; DESCRIPTION: Draws a blue rectangle at (364, 97) with width 34 and height 105.
; PLAN: r0=364(x), r1=97(y), r2=34(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 97
LDI r2, 34
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
