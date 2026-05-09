; DESCRIPTION: Renders a green line between points (163, 77) and (200, 230).
; PLAN: r0=163(x1), r1=77(y1), r2=200(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 77
LDI r2, 200
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
