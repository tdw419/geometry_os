; DESCRIPTION: Draws a purple rectangle at (315, 28) with width 71 and height 106.
; PLAN: r0=315(x), r1=28(y), r2=71(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 28
LDI r2, 71
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
