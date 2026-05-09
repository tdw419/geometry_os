; DESCRIPTION: Draws a purple rectangle at (43, 144) with width 23 and height 53.
; PLAN: r0=43(x), r1=144(y), r2=23(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 144
LDI r2, 23
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
