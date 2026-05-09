; DESCRIPTION: Draws a purple rectangle at (376, 64) with width 114 and height 108.
; PLAN: r0=376(x), r1=64(y), r2=114(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 64
LDI r2, 114
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
