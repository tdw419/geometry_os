; DESCRIPTION: Draws a magenta rectangle at (7, 94) with width 116 and height 28.
; PLAN: r0=7(x), r1=94(y), r2=116(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 94
LDI r2, 116
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
