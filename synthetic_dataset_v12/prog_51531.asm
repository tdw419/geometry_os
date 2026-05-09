; DESCRIPTION: Draws a magenta rectangle at (225, 80) with width 101 and height 98.
; PLAN: r0=225(x), r1=80(y), r2=101(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 80
LDI r2, 101
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
