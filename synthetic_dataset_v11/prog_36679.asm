; DESCRIPTION: Draws a magenta rectangle at (1, 36) with width 114 and height 112.
; PLAN: r0=1(x), r1=36(y), r2=114(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 36
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
