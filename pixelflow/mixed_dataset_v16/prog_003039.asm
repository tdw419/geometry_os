; DESCRIPTION: Renders a blue line between points (340, 201) and (336, 26).
; PLAN: r0=340(x1), r1=201(y1), r2=336(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 201
LDI r2, 336
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
