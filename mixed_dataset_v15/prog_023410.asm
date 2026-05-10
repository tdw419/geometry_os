; DESCRIPTION: Renders a purple line between points (499, 97) and (133, 117).
; PLAN: r0=499(x1), r1=97(y1), r2=133(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 97
LDI r2, 133
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
