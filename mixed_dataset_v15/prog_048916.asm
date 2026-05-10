; DESCRIPTION: Draws a purple rectangle at (8, 102) with width 41 and height 111.
; PLAN: r0=8(x), r1=102(y), r2=41(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 102
LDI r2, 41
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
