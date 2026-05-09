; DESCRIPTION: Renders a purple line between points (279, 201) and (215, 188).
; PLAN: r0=279(x1), r1=201(y1), r2=215(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 201
LDI r2, 215
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
