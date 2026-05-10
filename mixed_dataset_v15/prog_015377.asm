; DESCRIPTION: Renders a purple rectangular region spanning 66 by 61 at (291, 185).
; PLAN: r0=291(x), r1=185(y), r2=66(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 185
LDI r2, 66
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
