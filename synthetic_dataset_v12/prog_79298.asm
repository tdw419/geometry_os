; DESCRIPTION: Draws a black rectangle at (296, 70) with width 78 and height 49.
; PLAN: r0=296(x), r1=70(y), r2=78(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 70
LDI r2, 78
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
