; DESCRIPTION: Renders a purple line between points (208, 148) and (150, 145).
; PLAN: r0=208(x1), r1=148(y1), r2=150(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 148
LDI r2, 150
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
