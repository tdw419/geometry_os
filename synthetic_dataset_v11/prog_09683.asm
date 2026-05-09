; DESCRIPTION: Draws a purple rectangle at (181, 95) with width 31 and height 25.
; PLAN: r0=181(x), r1=95(y), r2=31(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 95
LDI r2, 31
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
