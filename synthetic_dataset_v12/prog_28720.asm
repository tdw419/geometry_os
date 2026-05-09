; DESCRIPTION: Draws a purple rectangle at (238, 19) with width 62 and height 111.
; PLAN: r0=238(x), r1=19(y), r2=62(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 19
LDI r2, 62
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
