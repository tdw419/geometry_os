; DESCRIPTION: Renders a purple line between points (52, 83) and (208, 10).
; PLAN: r0=52(x1), r1=83(y1), r2=208(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 83
LDI r2, 208
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
