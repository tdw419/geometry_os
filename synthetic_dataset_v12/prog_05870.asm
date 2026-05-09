; DESCRIPTION: Draws a magenta rectangle at (216, 59) with width 56 and height 98.
; PLAN: r0=216(x), r1=59(y), r2=56(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 59
LDI r2, 56
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
