; DESCRIPTION: Renders a yellow line between points (363, 77) and (325, 8).
; PLAN: r0=363(x1), r1=77(y1), r2=325(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 77
LDI r2, 325
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
