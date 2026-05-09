; DESCRIPTION: Draws a black rectangle at (140, 78) with width 11 and height 49.
; PLAN: r0=140(x), r1=78(y), r2=11(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 78
LDI r2, 11
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
