; DESCRIPTION: Draws a purple rectangle at (144, 152) with width 62 and height 43.
; PLAN: r0=144(x), r1=152(y), r2=62(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 152
LDI r2, 62
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
