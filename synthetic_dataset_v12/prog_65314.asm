; DESCRIPTION: Draws a magenta rectangle at (37, 111) with width 37 and height 92.
; PLAN: r0=37(x), r1=111(y), r2=37(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 111
LDI r2, 37
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
