; DESCRIPTION: Renders a purple line between points (199, 9) and (168, 119).
; PLAN: r0=199(x1), r1=9(y1), r2=168(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 9
LDI r2, 168
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
