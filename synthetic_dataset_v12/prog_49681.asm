; DESCRIPTION: Draws a purple rectangle at (376, 39) with width 39 and height 30.
; PLAN: r0=376(x), r1=39(y), r2=39(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 39
LDI r2, 39
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
