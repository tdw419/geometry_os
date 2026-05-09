; DESCRIPTION: Draws a purple rectangle at (156, 49) with width 73 and height 60.
; PLAN: r0=156(x), r1=49(y), r2=73(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 49
LDI r2, 73
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
