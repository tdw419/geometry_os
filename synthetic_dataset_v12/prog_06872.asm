; DESCRIPTION: Renders a blue line between points (439, 89) and (20, 18).
; PLAN: r0=439(x1), r1=89(y1), r2=20(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 89
LDI r2, 20
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
