; DESCRIPTION: Renders a green line between points (200, 78) and (249, 148).
; PLAN: r0=200(x1), r1=78(y1), r2=249(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 78
LDI r2, 249
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
