; DESCRIPTION: Draws a magenta rectangle at (111, 142) with width 84 and height 92.
; PLAN: r0=111(x), r1=142(y), r2=84(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 142
LDI r2, 84
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
