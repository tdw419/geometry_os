; DESCRIPTION: Renders a purple line between points (225, 227) and (76, 220).
; PLAN: r0=225(x1), r1=227(y1), r2=76(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 227
LDI r2, 76
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
