; DESCRIPTION: Renders a purple line between points (34, 49) and (46, 226).
; PLAN: r0=34(x1), r1=49(y1), r2=46(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 49
LDI r2, 46
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
