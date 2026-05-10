; DESCRIPTION: Renders a purple line between points (61, 225) and (475, 211).
; PLAN: r0=61(x1), r1=225(y1), r2=475(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 225
LDI r2, 475
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
