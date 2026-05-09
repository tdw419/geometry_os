; DESCRIPTION: Renders a black line between points (115, 232) and (199, 104).
; PLAN: r0=115(x1), r1=232(y1), r2=199(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 232
LDI r2, 199
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
