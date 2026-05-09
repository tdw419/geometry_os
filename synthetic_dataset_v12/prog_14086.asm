; DESCRIPTION: Renders a green line between points (385, 201) and (322, 129).
; PLAN: r0=385(x1), r1=201(y1), r2=322(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 201
LDI r2, 322
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
