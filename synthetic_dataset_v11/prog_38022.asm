; DESCRIPTION: Draws a purple rectangle at (164, 200) with width 71 and height 22.
; PLAN: r0=164(x), r1=200(y), r2=71(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 200
LDI r2, 71
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
