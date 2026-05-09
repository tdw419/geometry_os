; DESCRIPTION: Draws a white rectangle at (70, 151) with width 41 and height 52.
; PLAN: r0=70(x), r1=151(y), r2=41(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 151
LDI r2, 41
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
