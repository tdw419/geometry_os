; DESCRIPTION: Draws a magenta rectangle at (63, 200) with width 92 and height 44.
; PLAN: r0=63(x), r1=200(y), r2=92(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 200
LDI r2, 92
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
