; DESCRIPTION: Draws a purple rectangle at (25, 87) with width 92 and height 83.
; PLAN: r0=25(x), r1=87(y), r2=92(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 87
LDI r2, 92
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
