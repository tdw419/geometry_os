; DESCRIPTION: Renders a purple line between points (94, 88) and (317, 75).
; PLAN: r0=94(x1), r1=88(y1), r2=317(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 88
LDI r2, 317
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
