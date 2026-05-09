; DESCRIPTION: Renders a green line between points (109, 169) and (204, 163).
; PLAN: r0=109(x1), r1=169(y1), r2=204(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 169
LDI r2, 204
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
