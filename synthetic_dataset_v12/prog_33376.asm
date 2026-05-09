; DESCRIPTION: Draws a black rectangle at (322, 109) with width 51 and height 100.
; PLAN: r0=322(x), r1=109(y), r2=51(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 109
LDI r2, 51
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
