; DESCRIPTION: Draws a green rectangle at (431, 2) with width 43 and height 112.
; PLAN: r0=431(x), r1=2(y), r2=43(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 2
LDI r2, 43
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
