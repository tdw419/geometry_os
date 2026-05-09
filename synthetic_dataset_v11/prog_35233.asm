; DESCRIPTION: Draws a blue rectangle at (140, 101) with width 112 and height 14.
; PLAN: r0=140(x), r1=101(y), r2=112(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 101
LDI r2, 112
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
