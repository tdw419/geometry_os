; DESCRIPTION: Draws a magenta rectangle at (150, 169) with width 44 and height 73.
; PLAN: r0=150(x), r1=169(y), r2=44(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 169
LDI r2, 44
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
