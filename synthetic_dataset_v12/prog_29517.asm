; DESCRIPTION: Draws a purple rectangle at (420, 75) with width 71 and height 110.
; PLAN: r0=420(x), r1=75(y), r2=71(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 75
LDI r2, 71
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
