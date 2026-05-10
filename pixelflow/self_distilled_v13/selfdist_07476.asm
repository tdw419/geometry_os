; DESCRIPTION: Renders a magenta rectangular region spanning 21 by 106 at (285, 116).
; PLAN: r0=285(x), r1=116(y), r2=21(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 116
LDI r2, 21
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
