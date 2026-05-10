; DESCRIPTION: Draws a purple rectangle at (267, 100) with width 24 and height 74.
; PLAN: r0=267(x), r1=100(y), r2=24(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 100
LDI r2, 24
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
