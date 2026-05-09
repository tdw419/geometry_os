; DESCRIPTION: Draws a magenta rectangle at (147, 68) with width 92 and height 102.
; PLAN: r0=147(x), r1=68(y), r2=92(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 68
LDI r2, 92
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
