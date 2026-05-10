; DESCRIPTION: Renders a magenta rectangular region spanning 114 by 52 at (248, 62).
; PLAN: r0=248(x), r1=62(y), r2=114(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 62
LDI r2, 114
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
