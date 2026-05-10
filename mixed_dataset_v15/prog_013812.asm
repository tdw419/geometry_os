; DESCRIPTION: Renders a yellow line between points (419, 248) and (84, 145).
; PLAN: r0=419(x1), r1=248(y1), r2=84(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 248
LDI r2, 84
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
