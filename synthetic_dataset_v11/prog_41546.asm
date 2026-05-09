; DESCRIPTION: Draws a blue rectangle at (51, 14) with width 81 and height 40.
; PLAN: r0=51(x), r1=14(y), r2=81(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 14
LDI r2, 81
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
