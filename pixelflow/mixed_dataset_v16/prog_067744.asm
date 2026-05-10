; DESCRIPTION: Renders a purple line between points (494, 97) and (34, 229).
; PLAN: r0=494(x1), r1=97(y1), r2=34(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 97
LDI r2, 34
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
