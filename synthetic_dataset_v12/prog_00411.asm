; DESCRIPTION: Renders a purple line between points (415, 170) and (36, 137).
; PLAN: r0=415(x1), r1=170(y1), r2=36(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 170
LDI r2, 36
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
