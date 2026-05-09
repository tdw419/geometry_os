; DESCRIPTION: Draws a black rectangle at (328, 76) with width 84 and height 81.
; PLAN: r0=328(x), r1=76(y), r2=84(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 76
LDI r2, 84
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
