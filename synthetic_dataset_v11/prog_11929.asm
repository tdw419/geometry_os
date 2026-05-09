; DESCRIPTION: Renders a purple line between points (208, 74) and (34, 81).
; PLAN: r0=208(x1), r1=74(y1), r2=34(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 74
LDI r2, 34
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
