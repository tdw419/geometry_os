; DESCRIPTION: Renders a purple line between points (342, 101) and (6, 196).
; PLAN: r0=342(x1), r1=101(y1), r2=6(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 101
LDI r2, 6
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
