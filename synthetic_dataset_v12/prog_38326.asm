; DESCRIPTION: Draws a purple rectangle at (322, 9) with width 60 and height 51.
; PLAN: r0=322(x), r1=9(y), r2=60(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 9
LDI r2, 60
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
