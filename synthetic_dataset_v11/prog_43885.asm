; DESCRIPTION: Draws a black rectangle at (115, 2) with width 41 and height 24.
; PLAN: r0=115(x), r1=2(y), r2=41(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 2
LDI r2, 41
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
