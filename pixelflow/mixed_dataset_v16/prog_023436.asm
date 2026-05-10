; DESCRIPTION: Renders a yellow rectangular region spanning 35 by 51 at (34, 136).
; PLAN: r0=34(x), r1=136(y), r2=35(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 136
LDI r2, 35
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
