; DESCRIPTION: Draws a yellow rectangle at (388, 175) with width 51 and height 101.
; PLAN: r0=388(x), r1=175(y), r2=51(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 175
LDI r2, 51
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
