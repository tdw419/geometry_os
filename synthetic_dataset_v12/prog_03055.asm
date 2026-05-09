; DESCRIPTION: Draws a yellow rectangle at (343, 9) with width 14 and height 51.
; PLAN: r0=343(x), r1=9(y), r2=14(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 9
LDI r2, 14
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
