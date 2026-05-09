; DESCRIPTION: Renders a white line between points (14, 119) and (89, 200).
; PLAN: r0=14(x1), r1=119(y1), r2=89(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 119
LDI r2, 89
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
