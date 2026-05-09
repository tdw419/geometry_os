; DESCRIPTION: Draws a purple rectangle at (14, 195) with width 47 and height 55.
; PLAN: r0=14(x), r1=195(y), r2=47(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 195
LDI r2, 47
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
