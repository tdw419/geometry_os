; DESCRIPTION: Renders a magenta rectangular region spanning 44 by 110 at (312, 131).
; PLAN: r0=312(x), r1=131(y), r2=44(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 131
LDI r2, 44
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
