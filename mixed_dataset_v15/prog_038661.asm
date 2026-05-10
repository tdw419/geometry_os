; DESCRIPTION: Renders a magenta rectangular region spanning 84 by 40 at (342, 140).
; PLAN: r0=342(x), r1=140(y), r2=84(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 140
LDI r2, 84
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
