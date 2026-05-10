; DESCRIPTION: Draws a purple rectangle at (111, 29) with width 89 and height 71.
; PLAN: r0=111(x), r1=29(y), r2=89(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 29
LDI r2, 89
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
