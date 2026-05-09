; DESCRIPTION: Draws a black rectangle at (85, 159) with width 89 and height 11.
; PLAN: r0=85(x), r1=159(y), r2=89(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 159
LDI r2, 89
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
