; DESCRIPTION: Draws a purple rectangle at (78, 16) with width 43 and height 85.
; PLAN: r0=78(x), r1=16(y), r2=43(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 16
LDI r2, 43
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
