; DESCRIPTION: Renders a purple line between points (203, 159) and (22, 234).
; PLAN: r0=203(x1), r1=159(y1), r2=22(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 159
LDI r2, 22
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
