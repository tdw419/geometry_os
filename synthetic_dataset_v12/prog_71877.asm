; DESCRIPTION: Renders a purple line between points (6, 48) and (80, 76).
; PLAN: r0=6(x1), r1=48(y1), r2=80(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 48
LDI r2, 80
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
