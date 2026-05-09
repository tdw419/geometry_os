; DESCRIPTION: Draws a purple rectangle at (41, 33) with width 71 and height 94.
; PLAN: r0=41(x), r1=33(y), r2=71(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 33
LDI r2, 71
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
