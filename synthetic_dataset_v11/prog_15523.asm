; DESCRIPTION: Renders a purple line between points (99, 84) and (56, 95).
; PLAN: r0=99(x1), r1=84(y1), r2=56(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 84
LDI r2, 56
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
