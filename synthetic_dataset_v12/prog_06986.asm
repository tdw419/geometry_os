; DESCRIPTION: Draws a purple rectangle at (20, 85) with width 28 and height 71.
; PLAN: r0=20(x), r1=85(y), r2=28(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 85
LDI r2, 28
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
