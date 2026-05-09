; DESCRIPTION: Draws a purple rectangle at (131, 125) with width 62 and height 62.
; PLAN: r0=131(x), r1=125(y), r2=62(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 125
LDI r2, 62
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
