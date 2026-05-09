; DESCRIPTION: Renders a purple line between points (402, 7) and (386, 145).
; PLAN: r0=402(x1), r1=7(y1), r2=386(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 7
LDI r2, 386
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
