; DESCRIPTION: Renders a magenta rectangular region spanning 47 by 78 at (227, 20).
; PLAN: r0=227(x), r1=20(y), r2=47(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 20
LDI r2, 47
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
