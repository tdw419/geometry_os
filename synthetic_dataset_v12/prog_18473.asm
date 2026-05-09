; DESCRIPTION: Renders a purple line between points (438, 177) and (500, 5).
; PLAN: r0=438(x1), r1=177(y1), r2=500(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 177
LDI r2, 500
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
