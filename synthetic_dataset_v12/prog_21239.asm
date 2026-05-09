; DESCRIPTION: Renders a black line between points (201, 179) and (341, 244).
; PLAN: r0=201(x1), r1=179(y1), r2=341(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 179
LDI r2, 341
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
