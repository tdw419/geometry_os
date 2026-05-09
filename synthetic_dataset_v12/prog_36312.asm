; DESCRIPTION: Draws a magenta rectangle at (106, 98) with width 43 and height 81.
; PLAN: r0=106(x), r1=98(y), r2=43(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 98
LDI r2, 43
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
