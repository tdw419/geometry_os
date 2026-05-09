; DESCRIPTION: Draws a purple rectangle at (160, 102) with width 66 and height 76.
; PLAN: r0=160(x), r1=102(y), r2=66(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 102
LDI r2, 66
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
