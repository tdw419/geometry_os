; DESCRIPTION: Draws a black rectangle at (322, 12) with width 35 and height 109.
; PLAN: r0=322(x), r1=12(y), r2=35(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 12
LDI r2, 35
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
