; DESCRIPTION: Draws a purple rectangle at (0, 75) with width 93 and height 38.
; PLAN: r0=0(x), r1=75(y), r2=93(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 75
LDI r2, 93
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
