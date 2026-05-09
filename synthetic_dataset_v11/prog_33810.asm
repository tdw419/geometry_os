; DESCRIPTION: Renders a white line between points (55, 248) and (83, 77).
; PLAN: r0=55(x1), r1=248(y1), r2=83(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 248
LDI r2, 83
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
