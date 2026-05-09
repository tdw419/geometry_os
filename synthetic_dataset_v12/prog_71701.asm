; DESCRIPTION: Renders a yellow line between points (163, 74) and (64, 145).
; PLAN: r0=163(x1), r1=74(y1), r2=64(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 74
LDI r2, 64
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
