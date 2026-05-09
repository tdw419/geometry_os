; DESCRIPTION: Draws a purple rectangle at (152, 49) with width 43 and height 35.
; PLAN: r0=152(x), r1=49(y), r2=43(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 49
LDI r2, 43
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
