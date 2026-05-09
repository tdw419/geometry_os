; DESCRIPTION: Renders a purple line between points (101, 200) and (240, 131).
; PLAN: r0=101(x1), r1=200(y1), r2=240(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 200
LDI r2, 240
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
