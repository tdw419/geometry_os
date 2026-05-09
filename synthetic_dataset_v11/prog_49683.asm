; DESCRIPTION: Draws a magenta rectangle at (40, 77) with width 17 and height 89.
; PLAN: r0=40(x), r1=77(y), r2=17(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 77
LDI r2, 17
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
