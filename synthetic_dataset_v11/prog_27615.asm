; DESCRIPTION: Draws a purple rectangle at (53, 111) with width 79 and height 74.
; PLAN: r0=53(x), r1=111(y), r2=79(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 111
LDI r2, 79
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
