; DESCRIPTION: Renders a white line between points (91, 89) and (474, 77).
; PLAN: r0=91(x1), r1=89(y1), r2=474(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 89
LDI r2, 474
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
