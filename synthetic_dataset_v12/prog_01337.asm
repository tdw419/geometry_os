; DESCRIPTION: Renders a purple line between points (14, 237) and (31, 162).
; PLAN: r0=14(x1), r1=237(y1), r2=31(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 237
LDI r2, 31
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
