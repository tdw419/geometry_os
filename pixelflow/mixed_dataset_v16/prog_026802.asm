; DESCRIPTION: Draws a purple rectangle at (112, 25) with width 67 and height 79.
; PLAN: r0=112(x), r1=25(y), r2=67(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 25
LDI r2, 67
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
