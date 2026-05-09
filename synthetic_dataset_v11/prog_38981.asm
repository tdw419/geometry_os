; DESCRIPTION: Draws a black rectangle at (51, 90) with width 73 and height 40.
; PLAN: r0=51(x), r1=90(y), r2=73(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 90
LDI r2, 73
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
