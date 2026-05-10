; DESCRIPTION: Draws a purple rectangle at (377, 22) with width 79 and height 82.
; PLAN: r0=377(x), r1=22(y), r2=79(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 22
LDI r2, 79
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
