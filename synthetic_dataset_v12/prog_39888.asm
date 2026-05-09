; DESCRIPTION: Renders a yellow line between points (55, 144) and (52, 77).
; PLAN: r0=55(x1), r1=144(y1), r2=52(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 144
LDI r2, 52
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
