; DESCRIPTION: Draws a black rectangle at (216, 77) with width 51 and height 67.
; PLAN: r0=216(x), r1=77(y), r2=51(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 77
LDI r2, 51
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
