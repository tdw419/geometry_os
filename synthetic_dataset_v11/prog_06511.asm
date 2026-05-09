; DESCRIPTION: Draws a magenta rectangle at (81, 94) with width 17 and height 43.
; PLAN: r0=81(x), r1=94(y), r2=17(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 94
LDI r2, 17
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
