; DESCRIPTION: Draws a green rectangle at (227, 172) with width 112 and height 61.
; PLAN: r0=227(x), r1=172(y), r2=112(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 172
LDI r2, 112
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
