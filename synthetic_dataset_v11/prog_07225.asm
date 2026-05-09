; DESCRIPTION: Renders a blue line between points (176, 89) and (36, 104).
; PLAN: r0=176(x1), r1=89(y1), r2=36(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 89
LDI r2, 36
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
