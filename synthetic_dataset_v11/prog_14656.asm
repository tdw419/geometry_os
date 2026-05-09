; DESCRIPTION: Draws a white rectangle at (109, 100) with width 107 and height 51.
; PLAN: r0=109(x), r1=100(y), r2=107(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 100
LDI r2, 107
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
