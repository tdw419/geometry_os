; DESCRIPTION: Draws a purple rectangle at (165, 31) with width 79 and height 106.
; PLAN: r0=165(x), r1=31(y), r2=79(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 31
LDI r2, 79
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
