; DESCRIPTION: Renders a green line between points (323, 77) and (274, 227).
; PLAN: r0=323(x1), r1=77(y1), r2=274(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 77
LDI r2, 274
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
