; DESCRIPTION: Draws a yellow rectangle at (41, 159) with width 77 and height 63.
; PLAN: r0=41(x), r1=159(y), r2=77(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 159
LDI r2, 77
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
