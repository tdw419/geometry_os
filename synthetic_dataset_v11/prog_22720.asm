; DESCRIPTION: Renders a purple line between points (35, 252) and (182, 124).
; PLAN: r0=35(x1), r1=252(y1), r2=182(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 252
LDI r2, 182
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
