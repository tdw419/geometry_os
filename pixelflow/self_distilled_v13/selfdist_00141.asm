; DESCRIPTION: Renders a purple rectangular region spanning 75 by 18 at (251, 145).
; PLAN: r0=251(x), r1=145(y), r2=75(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 145
LDI r2, 75
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
