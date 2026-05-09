; DESCRIPTION: Renders a red line between points (451, 47) and (77, 189).
; PLAN: r0=451(x1), r1=47(y1), r2=77(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 47
LDI r2, 77
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
