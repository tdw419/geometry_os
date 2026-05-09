; DESCRIPTION: Draws a purple rectangle at (241, 48) with width 84 and height 49.
; PLAN: r0=241(x), r1=48(y), r2=84(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 48
LDI r2, 84
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
