; DESCRIPTION: Draws a purple rectangle at (53, 113) with width 46 and height 31.
; PLAN: r0=53(x), r1=113(y), r2=46(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 113
LDI r2, 46
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
