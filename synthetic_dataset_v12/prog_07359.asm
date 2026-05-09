; DESCRIPTION: Renders a green line between points (312, 137) and (417, 238).
; PLAN: r0=312(x1), r1=137(y1), r2=417(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 137
LDI r2, 417
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
