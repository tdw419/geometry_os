; DESCRIPTION: Draws a yellow rectangle at (107, 15) with width 113 and height 41.
; PLAN: r0=107(x), r1=15(y), r2=113(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 15
LDI r2, 113
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
