; DESCRIPTION: Renders a white line between points (93, 180) and (431, 129).
; PLAN: r0=93(x1), r1=180(y1), r2=431(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 180
LDI r2, 431
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
