; DESCRIPTION: Draws a black rectangle at (106, 94) with width 41 and height 16.
; PLAN: r0=106(x), r1=94(y), r2=41(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 94
LDI r2, 41
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
