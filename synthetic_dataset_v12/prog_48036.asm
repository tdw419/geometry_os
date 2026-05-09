; DESCRIPTION: Renders a purple line between points (343, 251) and (429, 112).
; PLAN: r0=343(x1), r1=251(y1), r2=429(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 251
LDI r2, 429
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
