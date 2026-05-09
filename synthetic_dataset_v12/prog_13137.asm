; DESCRIPTION: Draws a purple rectangle at (353, 192) with width 43 and height 32.
; PLAN: r0=353(x), r1=192(y), r2=43(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 192
LDI r2, 43
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
