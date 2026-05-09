; DESCRIPTION: Renders a green line between points (269, 247) and (451, 201).
; PLAN: r0=269(x1), r1=247(y1), r2=451(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 247
LDI r2, 451
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
