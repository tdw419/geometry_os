; DESCRIPTION: Draws a black rectangle at (199, 52) with width 49 and height 21.
; PLAN: r0=199(x), r1=52(y), r2=49(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 52
LDI r2, 49
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
