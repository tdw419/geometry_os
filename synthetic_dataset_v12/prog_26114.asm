; DESCRIPTION: Draws a purple rectangle at (292, 132) with width 60 and height 57.
; PLAN: r0=292(x), r1=132(y), r2=60(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 132
LDI r2, 60
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
