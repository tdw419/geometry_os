; DESCRIPTION: Draws a purple rectangle at (28, 2) with width 105 and height 47.
; PLAN: r0=28(x), r1=2(y), r2=105(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 2
LDI r2, 105
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
