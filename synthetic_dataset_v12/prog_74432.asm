; DESCRIPTION: Draws a magenta rectangle at (177, 34) with width 112 and height 81.
; PLAN: r0=177(x), r1=34(y), r2=112(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 34
LDI r2, 112
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
