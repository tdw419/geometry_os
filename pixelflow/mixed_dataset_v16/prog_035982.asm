; DESCRIPTION: Draws a black rectangle at (388, 36) with width 84 and height 76.
; PLAN: r0=388(x), r1=36(y), r2=84(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 36
LDI r2, 84
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
