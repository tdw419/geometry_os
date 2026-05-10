; DESCRIPTION: Draws a purple rectangle at (191, 41) with width 111 and height 82.
; PLAN: r0=191(x), r1=41(y), r2=111(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 41
LDI r2, 111
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
