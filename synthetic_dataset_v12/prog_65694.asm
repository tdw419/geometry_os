; DESCRIPTION: Draws a magenta rectangle at (170, 112) with width 36 and height 114.
; PLAN: r0=170(x), r1=112(y), r2=36(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 112
LDI r2, 36
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
