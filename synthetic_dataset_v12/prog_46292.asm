; DESCRIPTION: Draws a purple rectangle at (211, 76) with width 37 and height 47.
; PLAN: r0=211(x), r1=76(y), r2=37(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 76
LDI r2, 37
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
