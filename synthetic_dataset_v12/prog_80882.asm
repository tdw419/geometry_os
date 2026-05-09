; DESCRIPTION: Draws a magenta rectangle at (85, 0) with width 119 and height 59.
; PLAN: r0=85(x), r1=0(y), r2=119(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 0
LDI r2, 119
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
