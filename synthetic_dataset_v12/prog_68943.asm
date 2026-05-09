; DESCRIPTION: Draws a purple rectangle at (30, 30) with width 25 and height 111.
; PLAN: r0=30(x), r1=30(y), r2=25(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 25
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
