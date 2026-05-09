; DESCRIPTION: Renders a purple line between points (438, 105) and (402, 182).
; PLAN: r0=438(x1), r1=105(y1), r2=402(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 105
LDI r2, 402
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
