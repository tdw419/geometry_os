; DESCRIPTION: Renders a magenta line between points (448, 104) and (355, 109).
; PLAN: r0=448(x1), r1=104(y1), r2=355(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 104
LDI r2, 355
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
