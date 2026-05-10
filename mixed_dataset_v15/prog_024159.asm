; DESCRIPTION: Renders a purple rectangular region spanning 68 by 77 at (85, 105).
; PLAN: r0=85(x), r1=105(y), r2=68(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 105
LDI r2, 68
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
