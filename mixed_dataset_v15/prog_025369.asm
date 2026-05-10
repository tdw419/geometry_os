; DESCRIPTION: Renders a purple rectangular region spanning 52 by 75 at (229, 116).
; PLAN: r0=229(x), r1=116(y), r2=52(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 116
LDI r2, 52
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
