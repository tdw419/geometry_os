; DESCRIPTION: Renders a red line between points (89, 45) and (98, 105).
; PLAN: r0=89(x1), r1=45(y1), r2=98(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 45
LDI r2, 98
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
