; DESCRIPTION: Draws a white rectangle at (111, 158) with width 52 and height 55.
; PLAN: r0=111(x), r1=158(y), r2=52(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 158
LDI r2, 52
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
