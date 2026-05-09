; DESCRIPTION: Draws a black rectangle at (83, 86) with width 84 and height 112.
; PLAN: r0=83(x), r1=86(y), r2=84(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 86
LDI r2, 84
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
