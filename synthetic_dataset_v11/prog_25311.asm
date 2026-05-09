; DESCRIPTION: Draws a white rectangle at (41, 181) with width 115 and height 59.
; PLAN: r0=41(x), r1=181(y), r2=115(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 181
LDI r2, 115
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
