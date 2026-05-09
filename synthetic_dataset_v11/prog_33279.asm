; DESCRIPTION: Renders a white line between points (77, 145) and (99, 212).
; PLAN: r0=77(x1), r1=145(y1), r2=99(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 145
LDI r2, 99
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
