; DESCRIPTION: Draws a white rectangle at (397, 136) with width 89 and height 112.
; PLAN: r0=397(x), r1=136(y), r2=89(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 136
LDI r2, 89
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
