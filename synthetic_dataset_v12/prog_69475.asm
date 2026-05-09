; DESCRIPTION: Draws a magenta rectangle at (96, 184) with width 78 and height 65.
; PLAN: r0=96(x), r1=184(y), r2=78(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 184
LDI r2, 78
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
