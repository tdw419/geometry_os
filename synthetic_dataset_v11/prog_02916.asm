; DESCRIPTION: Draws a black rectangle at (4, 105) with width 97 and height 95.
; PLAN: r0=4(x), r1=105(y), r2=97(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 105
LDI r2, 97
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
