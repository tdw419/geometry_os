; DESCRIPTION: Renders a purple line between points (374, 14) and (216, 246).
; PLAN: r0=374(x1), r1=14(y1), r2=216(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 14
LDI r2, 216
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
