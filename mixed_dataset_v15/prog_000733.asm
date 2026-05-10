; DESCRIPTION: Draws a purple rectangle at (167, 21) with width 54 and height 35.
; PLAN: r0=167(x), r1=21(y), r2=54(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 21
LDI r2, 54
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
