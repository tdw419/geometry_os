; DESCRIPTION: Draws a purple rectangle at (193, 68) with width 43 and height 15.
; PLAN: r0=193(x), r1=68(y), r2=43(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 68
LDI r2, 43
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
