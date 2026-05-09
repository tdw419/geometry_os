; DESCRIPTION: Draws a black rectangle at (47, 78) with width 114 and height 68.
; PLAN: r0=47(x), r1=78(y), r2=114(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 78
LDI r2, 114
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
