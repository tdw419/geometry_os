; DESCRIPTION: Draws a purple rectangle at (157, 135) with width 19 and height 55.
; PLAN: r0=157(x), r1=135(y), r2=19(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 135
LDI r2, 19
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
