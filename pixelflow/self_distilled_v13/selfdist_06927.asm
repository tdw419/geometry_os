; DESCRIPTION: Renders a purple rectangular region spanning 20 by 89 at (251, 91).
; PLAN: r0=251(x), r1=91(y), r2=20(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 91
LDI r2, 20
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
