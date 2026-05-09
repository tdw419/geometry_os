; DESCRIPTION: Renders a yellow line between points (211, 115) and (129, 180).
; PLAN: r0=211(x1), r1=115(y1), r2=129(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 115
LDI r2, 129
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
