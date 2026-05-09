; DESCRIPTION: Renders a yellow line between points (389, 109) and (61, 145).
; PLAN: r0=389(x1), r1=109(y1), r2=61(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 109
LDI r2, 61
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
