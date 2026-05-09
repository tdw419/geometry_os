; DESCRIPTION: Renders a blue line between points (37, 89) and (328, 21).
; PLAN: r0=37(x1), r1=89(y1), r2=328(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 89
LDI r2, 328
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
