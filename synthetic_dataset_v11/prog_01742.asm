; DESCRIPTION: Renders a yellow line between points (194, 52) and (220, 35).
; PLAN: r0=194(x1), r1=52(y1), r2=220(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 52
LDI r2, 220
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
