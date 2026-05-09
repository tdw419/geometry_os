; DESCRIPTION: Draws a white rectangle at (159, 120) with width 56 and height 89.
; PLAN: r0=159(x), r1=120(y), r2=56(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 120
LDI r2, 56
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
