; DESCRIPTION: Draws a magenta rectangle at (59, 114) with width 89 and height 116.
; PLAN: r0=59(x), r1=114(y), r2=89(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 114
LDI r2, 89
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
