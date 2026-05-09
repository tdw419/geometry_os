; DESCRIPTION: Draws a magenta rectangle at (124, 149) with width 52 and height 59.
; PLAN: r0=124(x), r1=149(y), r2=52(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 149
LDI r2, 52
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
