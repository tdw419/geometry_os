; DESCRIPTION: Renders a purple line between points (125, 62) and (99, 48).
; PLAN: r0=125(x1), r1=62(y1), r2=99(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 62
LDI r2, 99
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
