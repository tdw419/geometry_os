; DESCRIPTION: Draws a purple rectangle at (167, 189) with width 80 and height 18.
; PLAN: r0=167(x), r1=189(y), r2=80(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 189
LDI r2, 80
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
