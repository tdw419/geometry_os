; DESCRIPTION: Draws a purple rectangle at (109, 83) with width 57 and height 75.
; PLAN: r0=109(x), r1=83(y), r2=57(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 83
LDI r2, 57
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
