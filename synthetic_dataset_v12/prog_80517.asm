; DESCRIPTION: Draws a magenta rectangle at (59, 80) with width 22 and height 116.
; PLAN: r0=59(x), r1=80(y), r2=22(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 80
LDI r2, 22
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
