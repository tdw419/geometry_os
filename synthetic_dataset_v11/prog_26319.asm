; DESCRIPTION: Draws a magenta rectangle at (88, 59) with width 81 and height 24.
; PLAN: r0=88(x), r1=59(y), r2=81(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 59
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
