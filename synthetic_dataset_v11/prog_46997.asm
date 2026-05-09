; DESCRIPTION: Draws a black rectangle at (51, 81) with width 105 and height 60.
; PLAN: r0=51(x), r1=81(y), r2=105(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 81
LDI r2, 105
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
