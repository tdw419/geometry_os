; DESCRIPTION: Draws a purple rectangle at (177, 43) with width 56 and height 29.
; PLAN: r0=177(x), r1=43(y), r2=56(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 43
LDI r2, 56
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
