; DESCRIPTION: Renders a purple line between points (100, 176) and (332, 206).
; PLAN: r0=100(x1), r1=176(y1), r2=332(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 176
LDI r2, 332
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
