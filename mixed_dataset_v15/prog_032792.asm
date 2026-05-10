; DESCRIPTION: Draws a white rectangle at (285, 140) with width 51 and height 112.
; PLAN: r0=285(x), r1=140(y), r2=51(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 140
LDI r2, 51
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
