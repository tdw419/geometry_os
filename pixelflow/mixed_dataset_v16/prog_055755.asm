; DESCRIPTION: Draws a purple rectangle at (25, 57) with width 68 and height 79.
; PLAN: r0=25(x), r1=57(y), r2=68(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 57
LDI r2, 68
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
