; DESCRIPTION: Draws a white rectangle at (137, 51) with width 81 and height 47.
; PLAN: r0=137(x), r1=51(y), r2=81(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 51
LDI r2, 81
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
