; DESCRIPTION: Draws a green rectangle at (325, 77) with width 41 and height 28.
; PLAN: r0=325(x), r1=77(y), r2=41(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 77
LDI r2, 41
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
