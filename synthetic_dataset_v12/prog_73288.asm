; DESCRIPTION: Draws a white rectangle at (20, 86) with width 41 and height 110.
; PLAN: r0=20(x), r1=86(y), r2=41(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 86
LDI r2, 41
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
