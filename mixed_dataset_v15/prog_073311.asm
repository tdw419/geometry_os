; DESCRIPTION: Draws a green rectangle at (21, 81) with width 55 and height 41.
; PLAN: r0=21(x), r1=81(y), r2=55(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 81
LDI r2, 55
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
