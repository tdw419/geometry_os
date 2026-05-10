; DESCRIPTION: Draws a green rectangle at (205, 113) with width 61 and height 41.
; PLAN: r0=205(x), r1=113(y), r2=61(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 113
LDI r2, 61
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
