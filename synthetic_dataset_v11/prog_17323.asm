; DESCRIPTION: Draws a purple rectangle at (66, 112) with width 43 and height 93.
; PLAN: r0=66(x), r1=112(y), r2=43(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 43
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
