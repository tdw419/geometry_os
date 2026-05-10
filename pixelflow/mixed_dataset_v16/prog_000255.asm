; DESCRIPTION: Renders a red line segment connecting (308, 18) to (77, 124).
; PLAN: r0=308(x1), r1=18(y1), r2=77(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 18
LDI r2, 77
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
