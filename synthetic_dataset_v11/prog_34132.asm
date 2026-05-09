; DESCRIPTION: Draws a white rectangle at (11, 51) with width 84 and height 100.
; PLAN: r0=11(x), r1=51(y), r2=84(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 51
LDI r2, 84
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
