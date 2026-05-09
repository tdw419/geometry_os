; DESCRIPTION: Draws a white rectangle at (47, 52) with width 92 and height 15.
; PLAN: r0=47(x), r1=52(y), r2=92(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 52
LDI r2, 92
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
