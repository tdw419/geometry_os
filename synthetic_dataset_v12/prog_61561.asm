; DESCRIPTION: Draws a green rectangle at (300, 41) with width 43 and height 51.
; PLAN: r0=300(x), r1=41(y), r2=43(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 41
LDI r2, 43
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
