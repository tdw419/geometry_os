; DESCRIPTION: Renders a purple line between points (244, 112) and (231, 73).
; PLAN: r0=244(x1), r1=112(y1), r2=231(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 112
LDI r2, 231
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
