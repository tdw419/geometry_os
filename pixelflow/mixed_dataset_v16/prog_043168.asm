; DESCRIPTION: Renders a white line between points (448, 118) and (273, 77).
; PLAN: r0=448(x1), r1=118(y1), r2=273(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 118
LDI r2, 273
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
