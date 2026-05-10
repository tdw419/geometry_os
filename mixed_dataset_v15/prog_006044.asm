; DESCRIPTION: Renders a white line between points (363, 145) and (477, 89).
; PLAN: r0=363(x1), r1=145(y1), r2=477(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 145
LDI r2, 477
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
