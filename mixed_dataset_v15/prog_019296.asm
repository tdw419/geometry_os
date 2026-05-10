; DESCRIPTION: Draws a white rectangle at (159, 161) with width 118 and height 61.
; PLAN: r0=159(x), r1=161(y), r2=118(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 161
LDI r2, 118
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
