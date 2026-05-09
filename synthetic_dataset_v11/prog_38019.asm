; DESCRIPTION: Draws a magenta rectangle at (116, 136) with width 55 and height 112.
; PLAN: r0=116(x), r1=136(y), r2=55(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 136
LDI r2, 55
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
