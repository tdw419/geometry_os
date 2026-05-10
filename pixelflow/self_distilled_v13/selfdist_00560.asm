; DESCRIPTION: Draws a purple rectangle at (170, 188) with width 41 and height 78.
; PLAN: r0=170(x), r1=188(y), r2=41(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 188
LDI r2, 41
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
