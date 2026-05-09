; DESCRIPTION: Draws a purple rectangle at (163, 103) with width 79 and height 75.
; PLAN: r0=163(x), r1=103(y), r2=79(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 103
LDI r2, 79
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
