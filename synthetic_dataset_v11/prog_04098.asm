; DESCRIPTION: Draws a purple rectangle at (15, 19) with width 85 and height 91.
; PLAN: r0=15(x), r1=19(y), r2=85(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 19
LDI r2, 85
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
