; DESCRIPTION: Draws a purple rectangle at (244, 13) with width 12 and height 43.
; PLAN: r0=244(x), r1=13(y), r2=12(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 13
LDI r2, 12
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
