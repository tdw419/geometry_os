; DESCRIPTION: Draws a magenta rectangle at (176, 81) with width 71 and height 106.
; PLAN: r0=176(x), r1=81(y), r2=71(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 81
LDI r2, 71
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
