; DESCRIPTION: Draws a purple rectangle at (131, 54) with width 74 and height 95.
; PLAN: r0=131(x), r1=54(y), r2=74(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 54
LDI r2, 74
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
