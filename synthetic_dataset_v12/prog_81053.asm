; DESCRIPTION: Draws a black rectangle at (163, 115) with width 52 and height 77.
; PLAN: r0=163(x), r1=115(y), r2=52(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 115
LDI r2, 52
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
