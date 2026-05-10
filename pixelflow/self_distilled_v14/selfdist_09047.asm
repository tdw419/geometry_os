; DESCRIPTION: Renders a magenta rectangular region spanning 101 by 81 at (0, 33).
; PLAN: r0=0(x), r1=33(y), r2=101(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 33
LDI r2, 101
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
