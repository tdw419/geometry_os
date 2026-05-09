; DESCRIPTION: Draws a magenta rectangle at (249, 98) with width 26 and height 81.
; PLAN: r0=249(x), r1=98(y), r2=26(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 98
LDI r2, 26
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
