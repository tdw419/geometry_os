; DESCRIPTION: Renders a red line between points (54, 160) and (97, 145).
; PLAN: r0=54(x1), r1=160(y1), r2=97(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 160
LDI r2, 97
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
