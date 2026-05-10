; DESCRIPTION: Renders a magenta rectangular region spanning 44 by 26 at (88, 158).
; PLAN: r0=88(x), r1=158(y), r2=44(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 158
LDI r2, 44
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
