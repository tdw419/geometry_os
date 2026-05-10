; DESCRIPTION: Draws a purple rectangle at (322, 23) with width 66 and height 27.
; PLAN: r0=322(x), r1=23(y), r2=66(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 23
LDI r2, 66
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
