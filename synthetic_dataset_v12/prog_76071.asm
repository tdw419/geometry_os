; DESCRIPTION: Draws a purple rectangle at (189, 22) with width 83 and height 109.
; PLAN: r0=189(x), r1=22(y), r2=83(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 22
LDI r2, 83
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
