; DESCRIPTION: Draws a magenta rectangle at (17, 33) with width 15 and height 116.
; PLAN: r0=17(x), r1=33(y), r2=15(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 33
LDI r2, 15
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
