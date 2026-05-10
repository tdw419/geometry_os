; DESCRIPTION: Draws a white rectangle at (219, 211) with width 11 and height 41.
; PLAN: r0=219(x), r1=211(y), r2=11(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 211
LDI r2, 11
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
