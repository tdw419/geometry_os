; DESCRIPTION: Draws a purple rectangle at (131, 127) with width 113 and height 116.
; PLAN: r0=131(x), r1=127(y), r2=113(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 127
LDI r2, 113
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
