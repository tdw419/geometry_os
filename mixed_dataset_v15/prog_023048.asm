; DESCRIPTION: Draws a black rectangle at (184, 86) with width 70 and height 41.
; PLAN: r0=184(x), r1=86(y), r2=70(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 86
LDI r2, 70
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
