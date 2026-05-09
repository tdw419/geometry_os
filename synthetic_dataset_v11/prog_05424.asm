; DESCRIPTION: Draws a purple rectangle at (41, 113) with width 70 and height 59.
; PLAN: r0=41(x), r1=113(y), r2=70(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 113
LDI r2, 70
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
