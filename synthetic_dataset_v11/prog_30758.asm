; DESCRIPTION: Draws a purple rectangle at (53, 113) with width 66 and height 91.
; PLAN: r0=53(x), r1=113(y), r2=66(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 66
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
