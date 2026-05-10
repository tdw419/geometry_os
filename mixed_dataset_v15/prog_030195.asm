; DESCRIPTION: Draws a magenta rectangle at (163, 92) with width 72 and height 54.
; PLAN: r0=163(x), r1=92(y), r2=72(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 92
LDI r2, 72
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
