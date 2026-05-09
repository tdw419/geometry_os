; DESCRIPTION: Draws a magenta rectangle at (353, 96) with width 116 and height 77.
; PLAN: r0=353(x), r1=96(y), r2=116(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 96
LDI r2, 116
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
