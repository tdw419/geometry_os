; DESCRIPTION: Draws a white rectangle at (184, 136) with width 26 and height 66.
; PLAN: r0=184(x), r1=136(y), r2=26(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 136
LDI r2, 26
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
