; DESCRIPTION: Renders a purple line between points (68, 0) and (31, 226).
; PLAN: r0=68(x1), r1=0(y1), r2=31(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 0
LDI r2, 31
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
