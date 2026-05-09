; DESCRIPTION: Draws a white rectangle at (471, 0) with width 35 and height 50.
; PLAN: r0=471(x), r1=0(y), r2=35(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 0
LDI r2, 35
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
