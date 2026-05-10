; DESCRIPTION: Draws a purple rectangle at (376, 95) with width 38 and height 31.
; PLAN: r0=376(x), r1=95(y), r2=38(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 95
LDI r2, 38
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
