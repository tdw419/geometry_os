; DESCRIPTION: Draws a purple rectangle at (324, 55) with width 23 and height 92.
; PLAN: r0=324(x), r1=55(y), r2=23(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 55
LDI r2, 23
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
