; DESCRIPTION: Renders a purple line between points (227, 8) and (317, 152).
; PLAN: r0=227(x1), r1=8(y1), r2=317(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 8
LDI r2, 317
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
