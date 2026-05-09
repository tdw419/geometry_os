; DESCRIPTION: Draws a purple rectangle at (61, 122) with width 85 and height 115.
; PLAN: r0=61(x), r1=122(y), r2=85(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 122
LDI r2, 85
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
