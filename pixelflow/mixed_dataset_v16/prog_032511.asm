; DESCRIPTION: Draws a purple rectangle at (304, 74) with width 84 and height 101.
; PLAN: r0=304(x), r1=74(y), r2=84(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 74
LDI r2, 84
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
