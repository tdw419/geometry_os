; DESCRIPTION: Renders a magenta rectangular region spanning 12 by 87 at (227, 25).
; PLAN: r0=227(x), r1=25(y), r2=12(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 25
LDI r2, 12
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
