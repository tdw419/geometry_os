; DESCRIPTION: Draws a purple rectangle at (270, 77) with width 76 and height 92.
; PLAN: r0=270(x), r1=77(y), r2=76(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 77
LDI r2, 76
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
