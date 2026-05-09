; DESCRIPTION: Renders a purple line between points (501, 20) and (377, 196).
; PLAN: r0=501(x1), r1=20(y1), r2=377(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 20
LDI r2, 377
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
