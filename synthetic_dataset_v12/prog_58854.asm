; DESCRIPTION: Renders a purple line between points (423, 241) and (283, 177).
; PLAN: r0=423(x1), r1=241(y1), r2=283(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 241
LDI r2, 283
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
