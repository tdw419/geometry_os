; DESCRIPTION: Renders a purple line between points (141, 126) and (186, 22).
; PLAN: r0=141(x1), r1=126(y1), r2=186(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 126
LDI r2, 186
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
