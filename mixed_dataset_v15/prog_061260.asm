; DESCRIPTION: Renders a black line between points (163, 119) and (163, 204).
; PLAN: r0=163(x1), r1=119(y1), r2=163(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 119
LDI r2, 163
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
