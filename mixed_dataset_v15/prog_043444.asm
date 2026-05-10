; DESCRIPTION: Renders a magenta rectangular region spanning 62 by 112 at (99, 176).
; PLAN: r0=99(x), r1=176(y), r2=62(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 176
LDI r2, 62
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
