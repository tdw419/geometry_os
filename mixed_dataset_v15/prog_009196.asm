; DESCRIPTION: Renders a purple line between points (461, 102) and (426, 77).
; PLAN: r0=461(x1), r1=102(y1), r2=426(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 102
LDI r2, 426
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
