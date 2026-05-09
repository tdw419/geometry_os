; DESCRIPTION: Draws a magenta rectangle at (106, 207) with width 119 and height 16.
; PLAN: r0=106(x), r1=207(y), r2=119(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 207
LDI r2, 119
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
