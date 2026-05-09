; DESCRIPTION: Draws a magenta rectangle at (5, 84) with width 116 and height 90.
; PLAN: r0=5(x), r1=84(y), r2=116(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 84
LDI r2, 116
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
