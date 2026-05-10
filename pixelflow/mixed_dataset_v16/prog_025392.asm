; DESCRIPTION: Draws a white rectangle at (142, 121) with width 51 and height 73.
; PLAN: r0=142(x), r1=121(y), r2=51(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 121
LDI r2, 51
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
