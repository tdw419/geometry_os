; DESCRIPTION: Draws a purple rectangle at (63, 175) with width 53 and height 41.
; PLAN: r0=63(x), r1=175(y), r2=53(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 175
LDI r2, 53
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
