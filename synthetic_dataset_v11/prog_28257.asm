; DESCRIPTION: Draws a purple rectangle at (145, 25) with width 64 and height 115.
; PLAN: r0=145(x), r1=25(y), r2=64(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 25
LDI r2, 64
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
