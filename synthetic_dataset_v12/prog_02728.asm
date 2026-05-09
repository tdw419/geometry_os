; DESCRIPTION: Draws a purple rectangle at (47, 73) with width 32 and height 29.
; PLAN: r0=47(x), r1=73(y), r2=32(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 73
LDI r2, 32
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
