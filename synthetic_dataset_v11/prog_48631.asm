; DESCRIPTION: Renders a green line between points (22, 143) and (145, 130).
; PLAN: r0=22(x1), r1=143(y1), r2=145(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 143
LDI r2, 145
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
