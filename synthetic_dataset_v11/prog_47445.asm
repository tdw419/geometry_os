; DESCRIPTION: Draws a magenta rectangle at (65, 88) with width 36 and height 92.
; PLAN: r0=65(x), r1=88(y), r2=36(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 88
LDI r2, 36
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
