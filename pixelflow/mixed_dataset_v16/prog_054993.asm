; DESCRIPTION: Renders a magenta rectangular region spanning 114 by 75 at (163, 43).
; PLAN: r0=163(x), r1=43(y), r2=114(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 43
LDI r2, 114
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
