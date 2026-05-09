; DESCRIPTION: Draws a purple rectangle at (452, 40) with width 57 and height 78.
; PLAN: r0=452(x), r1=40(y), r2=57(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 40
LDI r2, 57
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
