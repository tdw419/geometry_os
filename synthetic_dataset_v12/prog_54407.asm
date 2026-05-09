; DESCRIPTION: Draws a green rectangle at (20, 97) with width 76 and height 119.
; PLAN: r0=20(x), r1=97(y), r2=76(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 97
LDI r2, 76
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
