; DESCRIPTION: Draws a purple rectangle at (199, 137) with width 56 and height 89.
; PLAN: r0=199(x), r1=137(y), r2=56(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 137
LDI r2, 56
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
