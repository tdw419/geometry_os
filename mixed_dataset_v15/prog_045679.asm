; DESCRIPTION: Draws a purple rectangle at (31, 80) with width 72 and height 76.
; PLAN: r0=31(x), r1=80(y), r2=72(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 80
LDI r2, 72
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
