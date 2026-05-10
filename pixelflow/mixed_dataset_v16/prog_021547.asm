; DESCRIPTION: Draws a purple rectangle at (329, 41) with width 53 and height 78.
; PLAN: r0=329(x), r1=41(y), r2=53(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 41
LDI r2, 53
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
