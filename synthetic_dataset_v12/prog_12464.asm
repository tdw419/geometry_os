; DESCRIPTION: Renders a white line between points (89, 169) and (199, 19).
; PLAN: r0=89(x1), r1=169(y1), r2=199(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 169
LDI r2, 199
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
