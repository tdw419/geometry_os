; DESCRIPTION: Draws a black rectangle at (37, 78) with width 24 and height 19.
; PLAN: r0=37(x), r1=78(y), r2=24(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 78
LDI r2, 24
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
