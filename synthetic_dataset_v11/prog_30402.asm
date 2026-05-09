; DESCRIPTION: Draws a purple rectangle at (66, 81) with width 24 and height 73.
; PLAN: r0=66(x), r1=81(y), r2=24(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 81
LDI r2, 24
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
