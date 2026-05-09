; DESCRIPTION: Draws a green rectangle at (172, 178) with width 111 and height 41.
; PLAN: r0=172(x), r1=178(y), r2=111(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 178
LDI r2, 111
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
