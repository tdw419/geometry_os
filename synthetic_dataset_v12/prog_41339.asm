; DESCRIPTION: Renders a purple line between points (110, 80) and (276, 219).
; PLAN: r0=110(x1), r1=80(y1), r2=276(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 80
LDI r2, 276
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
