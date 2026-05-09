; DESCRIPTION: Draws a white rectangle at (45, 137) with width 41 and height 35.
; PLAN: r0=45(x), r1=137(y), r2=41(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 137
LDI r2, 41
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
