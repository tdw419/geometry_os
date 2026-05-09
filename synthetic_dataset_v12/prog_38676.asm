; DESCRIPTION: Draws a white rectangle at (96, 51) with width 55 and height 10.
; PLAN: r0=96(x), r1=51(y), r2=55(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 51
LDI r2, 55
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
