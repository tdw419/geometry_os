; DESCRIPTION: Renders a purple line between points (170, 240) and (115, 189).
; PLAN: r0=170(x1), r1=240(y1), r2=115(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 240
LDI r2, 115
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
