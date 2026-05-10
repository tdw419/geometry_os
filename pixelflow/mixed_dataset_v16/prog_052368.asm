; DESCRIPTION: Renders a magenta rectangular region spanning 115 by 100 at (396, 179).
; PLAN: r0=396(x), r1=179(y), r2=115(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 179
LDI r2, 115
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
