; DESCRIPTION: Draws a purple rectangle at (57, 113) with width 106 and height 59.
; PLAN: r0=57(x), r1=113(y), r2=106(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 113
LDI r2, 106
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
