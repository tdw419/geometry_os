; DESCRIPTION: Draws a green rectangle at (133, 41) with width 81 and height 10.
; PLAN: r0=133(x), r1=41(y), r2=81(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 41
LDI r2, 81
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
