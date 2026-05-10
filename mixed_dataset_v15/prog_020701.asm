; DESCRIPTION: Renders a red line between points (222, 216) and (448, 3).
; PLAN: r0=222(x1), r1=216(y1), r2=448(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 216
LDI r2, 448
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
