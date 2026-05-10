; DESCRIPTION: Draws a white rectangle at (393, 105) with width 51 and height 71.
; PLAN: r0=393(x), r1=105(y), r2=51(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 105
LDI r2, 51
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
