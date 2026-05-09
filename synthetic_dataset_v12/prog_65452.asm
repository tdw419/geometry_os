; DESCRIPTION: Draws a white rectangle at (156, 81) with width 41 and height 38.
; PLAN: r0=156(x), r1=81(y), r2=41(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 81
LDI r2, 41
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
