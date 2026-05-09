; DESCRIPTION: Draws a purple rectangle at (93, 111) with width 15 and height 77.
; PLAN: r0=93(x), r1=111(y), r2=15(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 111
LDI r2, 15
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
