; DESCRIPTION: Draws a blue rectangle at (182, 97) with width 24 and height 41.
; PLAN: r0=182(x), r1=97(y), r2=24(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 97
LDI r2, 24
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
