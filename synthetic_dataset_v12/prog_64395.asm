; DESCRIPTION: Draws a white rectangle at (381, 54) with width 96 and height 51.
; PLAN: r0=381(x), r1=54(y), r2=96(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 54
LDI r2, 96
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
