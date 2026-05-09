; DESCRIPTION: Renders a yellow line between points (253, 145) and (77, 3).
; PLAN: r0=253(x1), r1=145(y1), r2=77(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 145
LDI r2, 77
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
