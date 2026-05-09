; DESCRIPTION: Renders a purple line between points (413, 149) and (441, 123).
; PLAN: r0=413(x1), r1=149(y1), r2=441(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 149
LDI r2, 441
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
