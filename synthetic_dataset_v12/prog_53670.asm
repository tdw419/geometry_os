; DESCRIPTION: Renders a purple line between points (217, 112) and (182, 77).
; PLAN: r0=217(x1), r1=112(y1), r2=182(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 112
LDI r2, 182
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
