; DESCRIPTION: Draws a magenta rectangle at (84, 162) with width 75 and height 59.
; PLAN: r0=84(x), r1=162(y), r2=75(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 162
LDI r2, 75
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
