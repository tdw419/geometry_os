; DESCRIPTION: Draws a purple rectangle at (357, 62) with width 47 and height 116.
; PLAN: r0=357(x), r1=62(y), r2=47(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 62
LDI r2, 47
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
