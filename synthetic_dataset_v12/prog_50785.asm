; DESCRIPTION: Renders a white line between points (14, 77) and (192, 85).
; PLAN: r0=14(x1), r1=77(y1), r2=192(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 77
LDI r2, 192
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
