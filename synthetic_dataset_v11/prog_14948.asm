; DESCRIPTION: Draws a purple rectangle at (70, 34) with width 41 and height 111.
; PLAN: r0=70(x), r1=34(y), r2=41(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 34
LDI r2, 41
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
